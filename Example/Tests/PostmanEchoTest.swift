import XCTest
import APIResource

class PostmanEchoTest: XCTestCase {
    
//    override func setUp() {
//        super.setUp()
//    }
//
//    override func tearDown() {
//        super.tearDown()
//    }
    
    // 앞에 무조건 test 가 있어야 테스트가 될 수 있다.
    func testGetExample() {
        let expectation = XCTestExpectation(description: "Echo Postman")
        
        PostmanEchoAPI.get.apiResource.get { data in
            // Make sure we get some data.
            XCTAssertNotNil(data, "No data was arrived.")
            print("::: TEST :::")
            print(try! JSONDecoder().decode(GetModel.self, from: data!))
            print("::: TEST :::")
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
        }
       
//        let dataTask = URLSession(configuration: .default)
//            .dataTask(with: PostmanEchoAPI.get.urlRequest) { (data, _, _) in
//                // Make sure we get some data.
//                XCTAssertNotNil(data, "No data was arrived.")
//                print("::: TEST :::")
//                print(try! JSONDecoder().decode(GetModel.self, from: data!))
//                print("::: TEST :::")
//                // Fulfill the expectation to indicate that the background task has finished successfully.
//                expectation.fulfill()
//        }
//
//        dataTask.resume()
        
        wait(for: [expectation], timeout: 10.0)
//        XCTAssert(true, "Pass")
    }
}
