import XCTest

final class RemoteAddAccountTests: XCTestCase {
    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string: "http://any-url.com")!
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClint: httpClientSpy)
        
        sut.add()
        XCTAssertEqual(httpClientSpy.url, url)
    }
    
    class HttpClientSpy: HttpPostClient {
        var url: URL?

        func post(url: URL) {
            self.url = url
        }
        
        
    }

}

protocol HttpPostClient {
        
    func post(url: URL)
}

class RemoteAddAccount {
    private let url: URL
    private let httpClint: HttpPostClient
    
    init(url: URL, httpClint: HttpPostClient) {
        self.url = url
        self.httpClint = httpClint
    }
    
    func add(){
        httpClint.post(url: url)
    }
}
