//
//  GitSearchResponse.swift
//  iOSEngineerCodeCheck
//
//  Created by 岩本竜斗 on 2022/07/29.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation

/// GitAPIからのレスポンスを表す型
public struct GitSearchResponse<Item: Decodable> : Decodable{
    public var totalCount: Int
    public var items: [Item]

    public enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
