//
//  ListRepositoryViewTest.swift
//  iOSEngineerCodeCheckUITests
//
//  Created by 岩本竜斗 on 2022/07/30.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import XCTest
@testable import iOSEngineerCodeCheck

class ListRepositoryViewTest: XCTestCase {
    
    /// レポジトリ名を検索し、検索結果がテーブルに表示されるかをテストする関数
    func testPrintListRepository() {
        
        let app = XCUIApplication()
        app.launch()
        
        let searchBar = app.tables["Empty list"].searchFields["GitHubのリポジトリを検索できるよー"]
        let searchButton = app.buttons["Search"]
        let tablesQuery = app.tables
        let addedCell = tablesQuery.staticTexts["apple/swift"]
        
        searchBar.tap()
        searchBar.typeText("swift")
        searchButton.tap()
        
        // 非同期処理が完了するのを待つ
        sleep(5)
        
        XCTAssertTrue(addedCell.exists)
    }
}
