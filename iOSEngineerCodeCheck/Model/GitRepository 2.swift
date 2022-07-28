//
//  GitRepository.swift
//  iOSEngineerCodeCheck
//
//  Created by 岩本竜斗 on 2022/07/26.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

struct GitRepository {
    let id: Int
    let owner: Owner
    let stargazersCount: Int
    let watchersCount: Int
    let language: String
    let forksCount: Int
    
    struct Owner {
        let login: String
        let avatarURL: String
    }
}
