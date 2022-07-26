//
//  GitAPI.swift
//  iOSEngineerCodeCheck
//
//  Created by 岩本竜斗 on 2022/07/26.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

struct ResultJson: Codable {
    let items: [GitRepository]?
}

class GitAPI {
    static func searchRepository(keyword: String, completion: @escaping ([GitRepository]) -> Void) {
        var repositorys: [GitRepository] = []
        
        guard let keywordEncode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else { return }
        
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(keywordEncode)")
        else { return }
        
        
        let request = URLRequest(url: url)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { data, res, err in
            guard let data = data else { return }
            
            session.finishTasksAndInvalidate()
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(ResultJson.self, from: data)
                
                guard let items = json.items else { return }
                
                for item in items {
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
                        forksCount: item.forksCount
                    )
                    
                    repositorys.append(addRepository)
                    
                }
            } catch {
                print("エラーが発生しました：\(error)")
            }
            
            completion(repositorys)
        }
        
        task.resume()
    }
}
    

