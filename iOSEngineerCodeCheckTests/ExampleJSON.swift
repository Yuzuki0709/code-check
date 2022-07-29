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

extension GitSearchResponse where Item == GitRepository {
    static var exampleJSON: String {
        return """
        {
            "total_count": 141722,
            "items": [
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
                },
                {
                    "id": 790019,
                    "full_name": "openstack/swift",
                    "owner": {
                        "login": "openstack",
                        "avatar_url": "https://avatars.githubusercontent.com/u/324574?v=4",
                    },
                    "stargazers_count": 2324,
                    "watchers_count": 2324,
                    "language": "Python",
                    "forks_count": 1055,
                    "open_issues_count": 0,
                },
                {
                    "id": 130902948,
                    "full_name": "tensorflow/swift",
                    "owner": {
                        "login": "tensorflow",
                        "avatar_url": "https://avatars.githubusercontent.com/u/15658638?v=4",
                    },
                    "stargazers_count": 6060,
                    "watchers_count": 6060,
                    "language": "Jupyter Notebook",
                    "forks_count": 614,
                    "open_issues_count": 37,
                }
            ]
        }
        """
    }
}

