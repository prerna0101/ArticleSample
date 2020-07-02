//
//  Media.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on 01/07/20.

import Foundation


class Media : NSObject, NSCoding{

    var blogId : String!
    var createdAt : String!
    var id : String!
    var image : String!
    var title : String!
    var url : String!

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        blogId = dictionary["blogId"] as? String
        createdAt = dictionary["createdAt"] as? String
        id = dictionary["id"] as? String
        image = dictionary["image"] as? String
        title = dictionary["title"] as? String
        url = dictionary["url"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if blogId != nil{
            dictionary["blogId"] = blogId
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if title != nil{
            dictionary["title"] = title
        }
        if url != nil{
            dictionary["url"] = url
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        blogId = aDecoder.decodeObject(forKey: "blogId") as? String
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        image = aDecoder.decodeObject(forKey: "image") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if blogId != nil{
            aCoder.encode(blogId, forKey: "blogId")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
    }
}
