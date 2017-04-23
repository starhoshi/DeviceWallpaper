//
//  AppleDeviceRequest.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/23.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import Foundation
import APIKit
import ObjectMapper

protocol AppleDeviceRequest: Request {
}

extension AppleDeviceRequest {
    var baseURL: URL {
        return URL(string: "https://starhoshi.github.io/apple_device_api")!
    }
}

extension AppleDeviceRequest where Response: ImmutableMappable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response(JSONObject: object)
    }
}

extension AppleDeviceRequest {
    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        log?.info("requestURL: \(urlRequest)")
        return urlRequest
    }

    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        log?.info("raw response header: \(urlResponse)")
        log?.info("raw response body: \(object)")
        switch urlResponse.statusCode {
        case 200..<300:
            return object

        default:
            throw ResponseError.unacceptableStatusCode(urlResponse.statusCode)
        }
    }
}
