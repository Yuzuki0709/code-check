//
//  GitSearchResponseTest.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 岩本竜斗 on 2022/07/29.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import XCTest
import iOSEngineerCodeCheck

class GitSearchResponseTest: XCTestCase {
    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = GitSearchResponse<GitRepository>.exampleJSON.data(using: .utf8)!
        let response = try jsonDecoder.decode(GitSearchResponse<GitRepository>.self, from: data)

        XCTAssertEqual(response.totalCount, 141722)
        XCTAssertEqual(response.items.count, 3)

        let firstRepository = response.items[0]
        let secondRepository = response.items[1]
        
        XCTAssertEqual(firstRepository.id, 44838949)
        XCTAssertEqual(firstRepository.fullName, "apple/swift")
        XCTAssertEqual(firstRepository.owner?.login, "apple")
        XCTAssertEqual(firstRepository.stargazersCount, 60193)
        XCTAssertEqual(firstRepository.watchersCount, 60193)
        XCTAssertEqual(firstRepository.language, "C++")
        XCTAssertEqual(firstRepository.forksCount, 9684)
        XCTAssertEqual(firstRepository.openIssuesCount, 6001)
        
        XCTAssertEqual(secondRepository.id, 790019)
        XCTAssertEqual(secondRepository.fullName, "openstack/swift")
        XCTAssertEqual(secondRepository.owner?.login, "openstack")
        XCTAssertEqual(secondRepository.stargazersCount, 2324)
        XCTAssertEqual(secondRepository.watchersCount, 2324)
        XCTAssertEqual(secondRepository.language, "Python")
        XCTAssertEqual(secondRepository.forksCount, 1055)
        XCTAssertEqual(secondRepository.openIssuesCount, 0)
    }
}
