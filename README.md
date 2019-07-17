<img src="./images/palette.png" width="40%" style="margin: 0 auto">

# :rainbow: APIResource

<div style="text-align: center">
  <img src="https://img.shields.io/travis/onemoonstudio/APIResource.svg?style=flat">
  <img src="https://img.shields.io/cocoapods/v/APIResource.svg?style=flat">
  <img src="https://img.shields.io/cocoapods/l/APIResource.svg?style=flat">
  <img src="https://img.shields.io/cocoapods/p/APIResource.svg?style=flat">
  <img src="https://img.shields.io/badge/author-onemoon-red.svg">
</div>

## What is APIResource

**APIResource** is resource management library. **Resources** like HTTPMethod ( GET / POST ... ) or Query ( ?hello=world ) are managed. Important Thing is **APIResource does not help for your network task like Alamofire but just manage your resources**. Network Task is your job except for APIResource.get

You can use this library **simply** **URL with APIResource**, but also can use with **enum and ResourceBase**. please check Usage

Thanks to [PostmanEcho API](https://docs.postman-echo.com/?version=latest), I can test my features and wrote it with XCTestClass. so enjoy this Library and your star will be helpful to me



## Installation

APIResource is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'APIResource'
```



## Features

- [ ] initialize APIResource with urlString
- [ ] initialize APIResource with ResourceBase
- [ ] APIResource makes URLRequest 



features what not checked are not enough tested 



## Usage

[APIResource](https://github.com/onemoonStudio/APIResource/blob/master/APIResource/Source/APIResource.swift) is core of this Library. you can make this with **urlString** or [**ResourceBase**]()


```swift
// urlString is like "http://hello.com/path?12=34"
let apiResource: APIResource = APIResource("https://postman-echo.com/get?foo1=bar1&foo2=bar2")
```

```swift
// conform ResourceBase 
enum PostmanEchoAPI {
    case getRequest
}
extension PostmanEchoAPI: ResourceBase {
    var host: String? {
        switch self {
        case .getRequest:
            return "https://postman-echo.com/"
        }
    }
    var path: String? {
        switch self {
        case .getRequest:
            return "/get"
        }
    }
    var queryString: String? {
        switch self {
        case .getRequest:
            return "?foo1=bar1&foo2=bar2"
        }
    }
}

let apiResource: APIResource = PostmanEchoAPI.getRequest.apiResource

```



### Reference

[Alamofire](https://github.com/Alamofire/Alamofire)
[Just](https://github.com/dduan/Just)
[Moya](https://github.com/Moya/Moya)



### License

APIResource is available under the MIT license. See the LICENSE file for more info.
