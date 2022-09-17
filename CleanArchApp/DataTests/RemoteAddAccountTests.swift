import XCTest

final class RemoteAddAccountTests: XCTestCase {
    func test_() {
        let url = URL(string: "http://any-url.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClint: httpClientSpy)
        
        sut.add()
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    class HttpClientSpy: HttpClient {
        var url: URL?

        func post(url: URL) {
            self.url = url
        }
        
        
    }

}

protocol HttpClient {
        
    func post(url: URL)
}

class RemoteAddAccount {
    private let url: URL
    private let httpClint: HttpClient
    
    init(url: URL, httpClint: HttpClient) {
        self.url = url
        self.httpClint = httpClint
    }
    
    func add(){
        httpClint.post(url: url)
    }
}
