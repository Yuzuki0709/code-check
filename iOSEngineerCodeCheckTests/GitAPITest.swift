//
//  GitAPITest.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 岩本竜斗 on 2022/07/29.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import XCTest
@testable import iOSEngineerCodeCheck

class GitAPITest: XCTestCase {
    func testSearchRepository() {
        var repository: GitRepository?
        let expect = expectation(description: "非同期処理待ち")
        
        GitAPI.searchRepository(keyword: "swift") { repositorys in
            repository = repositorys.first
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                print(error)
                XCTFail("Time Over")
            } else {
                XCTAssertEqual(repository?.id, 44838949)
                XCTAssertEqual(repository?.fullName, "apple/swift")
                XCTAssertEqual(repository?.owner?.login, "apple")
                XCTAssertEqual(repository?.language, "C++")
            }
            
        }
    }
}
