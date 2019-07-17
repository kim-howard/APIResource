import XCTest
import APIResource

class PostmanEchoTest: XCTestCase {
    
    /// Simple Test for Check
    func testURLString() {
        let expectation = XCTestExpectation(description: "Echo Postman")
        let urlSession = URLSession(configuration: .default)
        let urlRequest: URLRequest = APIResource("https://postman-echo.com/get?foo1=bar1&foo2=bar2").urlRequest()
        let dataTask = urlSession.dataTask(with: urlRequest) { (data, _, _) in
            XCTAssertNotNil(data, "No data was arrived.")
            print("::: testURLString :::")
            print(try! JSONDecoder().decode(GetModel.self, from: data!))
            print("::: TEST END :::")
            expectation.fulfill()
        }
        dataTask.resume()
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testResourceBase() {
        let expectation = XCTestExpectation(description: "Echo Postman")
        let urlSession = URLSession(configuration: .default)
        let urlRequest: URLRequest = PostmanEchoAPI.getRequest.apiResource.urlRequest()
        let dataTask = urlSession.dataTask(with: urlRequest) { (data, _, _) in
            XCTAssertNotNil(data, "No data was arrived.")
            print("::: testResourceBase :::")
            print(try! JSONDecoder().decode(GetModel.self, from: data!))
            print("::: TEST END :::")
            expectation.fulfill()
        }
        dataTask.resume()
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testAPIResourceGet() {
        let expectation = XCTestExpectation(description: "Echo Postman")
        let apiResource = APIResource("https://postman-echo.com/get?foo1=bar1&foo2=bar2")
        apiResource.get { data in
            XCTAssertNotNil(data, "No data was arrived.")
            print("::: testAPIResourceGet :::")
            print(try! JSONDecoder().decode(GetModel.self, from: data!))
            print("::: TEST :::")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
