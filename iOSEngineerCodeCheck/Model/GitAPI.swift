//
//  GitAPI.swift
//  iOSEngineerCodeCheck
//
//  Created by 岩本竜斗 on 2022/07/26.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

/// GitのAPIを表現した型
class GitAPI {
    
    /// レポジトリをAPIを通し、サーチする関数
    /// - Parameters:
    ///   - keyword: 検索したいワード
    ///   - completion: 処理終了時に実行したい関数
    static func searchRepository(keyword: String, completion: @escaping ([GitRepository]) -> Void) {
        var repositorys: [GitRepository] = []
        
        // キーワードをURLで使えるようにエンコード
        guard let keywordEncode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else { return }
        
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(keywordEncode)")
        else { return }
        
        // URLリクエストの作成
        let request = URLRequest(url: url)
        
        // URLセッションの作成
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { data, res, err in
            guard let data = data else { return }
            
            // セッションを終了
            session.finishTasksAndInvalidate()
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(GitSearchResponse<GitRepository>.self, from: data)
                
                // guard let items = json.items else { return }
                
                for item in json.items {
                    let addRepository = GitRepository(
                        id: item.id,
                        fullName: item.fullName,
                        owner: Owner(
                            login: item.owner?.login,
                            avatarURL: item.owner?.avatarURL
                        ),
                        stargazersCount: item.stargazersCount,
                        watchersCount: item.watchersCount,
                        language: item.language,
                        forksCount: item.forksCount,
                        openIssuesCount: item.openIssuesCount
                    )
                    
                    repositorys.append(addRepository)
                    
                }
            } catch {
                print("エラーが発生しました：\(error)")
            }
            
            completion(repositorys)
        }
        
        // taskを実行
        task.resume()
    }
}
    

