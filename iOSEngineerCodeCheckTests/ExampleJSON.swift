//
//  ExampleJSON.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 岩本竜斗 on 2022/07/29.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import iOSEngineerCodeCheck

extension GitRepository {
    static var exampleJSON: String {
        return """
        {
            "id": 44838949,
            "full_name": "apple/swift",
            "owner": {
                "login": "apple",
                "avatar_url": "https://avatars.githubusercontent.com/u/10639145?v=4"
            },
            "stargazers_count": 60193,
            "watchers_count": 60193,
            "language": "C++",
            "forks_count": 9684,
            "open_issues_count": 6001
        }
        """
    }
}
