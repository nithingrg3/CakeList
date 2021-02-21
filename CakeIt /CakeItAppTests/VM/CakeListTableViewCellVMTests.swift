//
//  CakeListTableViewCellVMTests.swift
//  CakeItAppTests
//
//  Created by Nitin George on 20/02/2021.
//

import XCTest

class CakeListTableViewCellVMTests: XCTestCase {

    var apiManager: APICakeProtocol = CakeServicesMock()
    var viewModel: CakeListTableViewCellVMProtocol!
    
    override func setUpWithError() throws {
        let cake = Cake(title: "WineCake", desc: "Grape flavour", imageURL: "https://img.delicious.com.au/xRc0uydo/del/2015/10/dundee-cake-10249-1.jpg")
        viewModel = CakeListTableViewCellVM(apiManager: apiManager, cake: cake)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchCakeName() {
        let title = viewModel.fetchCakeName()
        XCTAssert(title == "WineCake")
    }

    func testFetchCakeDescription() {
        let description = viewModel.fetchCakeDescription()
        XCTAssert(description == "Grape flavour")
    }
    
    func testNilCakeDesc() {
        viewModel = CakeListTableViewCellVM(apiManager: apiManager, cake: nil)
        let description = viewModel.fetchCakeDescription()
        XCTAssertNil(description)
    }
    
    func testNilCakeTitle() {
        let cake = Cake(title: nil, desc: "Grape flavour", imageURL: "https://img.delicious.com.au/xRc0uydo/del/2015/10/dundee-cake-10249-1.jpg")
        viewModel = CakeListTableViewCellVM(apiManager: apiManager, cake: cake)
        let title = viewModel.fetchCakeName()
        XCTAssertNil(title)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
