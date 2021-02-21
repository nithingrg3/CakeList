//
//  CakeListViewModelTests.swift
//  CakeItAppTests
//
//  Created by Nitin George on 20/02/2021.
//

import XCTest

class CakeListViewModelTests: XCTestCase {

    var apiManager: APICakeProtocol = CakeServicesMock()
    var viewModel: CakeListViewModelProtocol!
    
    override func setUp() {
        super.setUp()
        viewModel = CakeListViewModel(apiManager: apiManager)
        viewModel.fetchCakes { (isSuccess, cakes) in
        }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidNavigationTitle() {
        XCTAssertEqual(viewModel.fetchNavigationTitle(), "🎂 \(NSLocalizedString("CakeItHomeNavTitle", comment: "")) 🍰")
    }
    
    func testInValidNavigationTitle() {
        XCTAssert(viewModel.fetchNavigationTitle() != "\(NSLocalizedString("CakeItHomeNavTitle", comment: ""))")
    }
    
    func testNumberOfRows() {
        let rowCount = viewModel.numberOfRows()
        XCTAssert(rowCount == 10)
    }
    
    func testFetchCakeWithInvalidIndex() {
        let cake = viewModel.fetchSelectedCake(selectedIndex: -100)
        XCTAssertNil(cake)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
