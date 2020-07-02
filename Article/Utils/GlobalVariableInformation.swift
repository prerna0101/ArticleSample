//
//  ViewController.swift
//  Article
//
//  Created by Prerna Chauhan on 01/07/20.
//  Copyright © 2020 Prerna Chauhan. All rights reserved.
//
import Foundation
import UIKit

class GlobalVariableInformation {
    
    private static var globalVariableInformation : GlobalVariableInformation? = nil

    var limit = 10 //default will get 5 results
    var page = 1
    var totalItems = 0;

    static func instance() -> GlobalVariableInformation {
        if (globalVariableInformation == nil) {
            globalVariableInformation = GlobalVariableInformation()
        }
        return globalVariableInformation!
    }
    
    private init() {
        // Fetch logged in keys
    }
}


