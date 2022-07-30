//
//  GitRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 岩本竜斗 on 2022/07/26.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation


/// Gitのレポジトリを表す型
public struct GitRepository: Codable {
    public let id: Int?
    public let fullName: String?
    public let owner: Owner?
    public let htmlURL: String?
    public let stargazersCount, watchersCount: Int?
    public let language: String?
    public let forksCount: Int?
    public let openIssuesCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
    }
}


/// レポジトリのオーナーを表す型
public struct Owner: Codable {
    public let login: String?
    public let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
