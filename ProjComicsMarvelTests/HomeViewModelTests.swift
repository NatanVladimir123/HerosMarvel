//
//  HomeViewModelTests.swift
//  ProjComicsMarvelTests
//
//  Created by Bruno Andrade on 2023-04-06.
//

import XCTest
@testable import ProjComicsMarvel

final class HomeViewModelTests: XCTestCase {

    func testLoadHerosSuccessIsSearchTrue() throws {
        let viewModel = HomeViewModel(marvelAPI: MockMarvelAPISuccess())
        var success: Bool = false
        
        viewModel.loadHeros(isSearch: true) { result in
            switch result {
            case .success:
                success = true
            case .failure:
                break
            }
            
            XCTAssertTrue(success)
            XCTAssertEqual(viewModel.heros.count, 2)
        }
    }
    
    func testLoadHerosSuccessIsSearchFalse() throws {
        let viewModel = HomeViewModel(marvelAPI: MockMarvelAPISuccess())
        viewModel.heros = [Hero(id: 44, name: "Captain America", description: "shield", thumbnail: Thumbnail(path: "", ext: ""), urls: [])]
        var success: Bool = false
        
        viewModel.loadHeros(isSearch: false) { result in
            switch result {
            case .success:
                success = true
            case .failure:
                break
            }
            
            XCTAssertTrue(success)
            XCTAssertEqual(viewModel.heros.count, 3)
        }
    }

}
