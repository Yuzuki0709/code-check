//
//  GitRepositoryTest.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 岩本竜斗 on 2022/07/29.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import XCTest
import iOSEngineerCodeCheck

class GitRepositoryTest: XCTestCase {
    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = GitRepository.exampleJSON.data(using: .utf8)!
        let repository = try jsonDecoder.decode(GitRepository.self, from: data)
        
        XCTAssertEqual(repository.id, 44838949)
        XCTAssertEqual(repository.fullName, "apple/swift")
        XCTAssertEqual(repository.owner?.login, "apple")
        XCTAssertEqual(repository.stargazersCount, 60193)
        XCTAssertEqual(repository.watchersCount, 60193)
        XCTAssertEqual(repository.language, "C++")
        XCTAssertEqual(repository.forksCount, 9684)
        XCTAssertEqual(repository.openIssuesCount, 6001)
    }
}
