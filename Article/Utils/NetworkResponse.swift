//
//  NetworkResponse.swift
//  Article
//
//  Created by Prerna Chauhan on 01/07/20.
//  Copyright © 2020 Prerna Chauhan. All rights reserved.
//

import Foundation
open class NetworkResponse {
    
    public var statusCode: Int = -1
    public var error: Error? = nil
    public var response: Any? = nil
    public var success = false
    public var data:Data?
    public init() {
        
    }
    
    public init(networkResponse: NetworkResponse) {
        self.statusCode = networkResponse.statusCode
        self.error = networkResponse.error
        self.response = networkResponse.response
        self.success = networkResponse.success
        self.data = networkResponse.data
    }
    
}
