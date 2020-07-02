//
//  ViewController.swift
//  Jet2Travel
//
//  Created by Prerna Chauhan on 01/07/20.
//  Copyright © 2020 Prerna Chauhan. All rights reserved.
//


import UIKit
import Foundation

class ViewModel {
    
    // Closure use for notifi
    var reloadList = {() -> () in }
    var errorMessage = {(message : String) -> () in }
    
    let date = Date()
    let formatter = DateFormatter()
    
    
    ///Array of List Model class
    var articlesArray : [RootClass] = []{
        ///Reload data when data set
        didSet{
            reloadList()
        }
    }
    
    var mediaArray : [Media] = []{
        ///Reload data when data set
        didSet{
            reloadList()
        }
    }
    var userArray : [User] = []{
        ///Reload data when data set
        didSet{
            reloadList()
        }
    }
    
    // Get data from API
    func getServicecall() {
        var request = URLRequest(url: URL(string: "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page=\(GlobalVariableInformation.instance().page)&limit=\(GlobalVariableInformation.instance().limit)")!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                //  let data: Data = try Data(contentsOf: url as URL)
                let jsonArray: [[String: AnyObject]] = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [[String: AnyObject]]
                print("json: \(jsonArray)")
                if let arry = jsonArray as? [[String:AnyObject]] {
                    for item in arry {
                        self.articlesArray.append(RootClass(fromDictionary:item))
                        
                    }
                    
                }
                
            }
            catch {
                print("Error: (data: contentsOf: url)")
            }
        }).resume()
        
        //create dataTask using the session object to send data to the server
        //        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
        //            // Error
        //            if let error = error {
        //                print("error:", error)
        //                return
        //            }
        //            // Response Status with HTTPURLResponse
        //            let responseStatus = response as? HTTPURLResponse
        //            print("responseStatus Code", responseStatus as Any)
        //            do {
        //                guard let data = data else {
        //                    return
        //                }
        //                // Using Decoder
        //                let decode = JSONDecoder()
        //                let response = try decode.decode(ServiceResponseModel.self, from: data)
        //            //    print(response)
        //                // Creating DispatchGroup
        //                let group = DispatchGroup()
        //                group.enter()
        //                DispatchQueue.main.async {
        //                    GlobalVariableInformation.instance().totalItems = response.totalResults!
        //                    self.articlesArray.append(contentsOf: response.articles!)
        //                    group.leave()
        //                }
        //                group.enter()
        //                DispatchQueue.main.async {
        //                    GlobalVariableInformation.instance().totalItems = response.totalResults!
        //                    self.articlesArray.append(contentsOf: response.articles!)
        //                    group.leave()
        //                }
        //                group.enter()
        //                DispatchQueue.main.async {
        //                    GlobalVariableInformation.instance().totalItems = response.totalResults!
        //                    self.articlesArray.append(contentsOf: response.articles!)
        //                    group.leave()
        //                }
        //                group.notify(queue: .main) {
        //                    // Alert
        //                }
        //            } catch {
        //                print("Error ->\(error.localizedDescription)")
        //                self.errorMessage(error.localizedDescription)
        //            }
        //        })
        //        task.resume()
        //    }
    }
    
}
