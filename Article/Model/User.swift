//
//  User.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on 01/07/20.

import Foundation


class User : NSObject, NSCoding{

    var about : String!
    var avatar : String!
    var blogId : String!
    var city : String!
    var createdAt : String!
    var designation : String!
    var id : String!
    var lastname : String!
    var name : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        about = dictionary["about"] as? String
        avatar = dictionary["avatar"] as? String
        blogId = dictionary["blogId"] as? String
        city = dictionary["city"] as? String
        createdAt = dictionary["createdAt"] as? String
        designation = dictionary["designation"] as? String
        id = dictionary["id"] as? String
        lastname = dictionary["lastname"] as? String
        name = dictionary["name"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if about != nil{
            dictionary["about"] = about
        }
        if avatar != nil{
            dictionary["avatar"] = avatar
        }
        if blogId != nil{
            dictionary["blogId"] = blogId
        }
        if city != nil{
            dictionary["city"] = city
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if designation != nil{
            dictionary["designation"] = designation
        }
        if id != nil{
            dictionary["id"] = id
        }
        if lastname != nil{
            dictionary["lastname"] = lastname
        }
        if name != nil{
            dictionary["name"] = name
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        about = aDecoder.decodeObject(forKey: "about") as? String
        avatar = aDecoder.decodeObject(forKey: "avatar") as? String
        blogId = aDecoder.decodeObject(forKey: "blogId") as? String
        city = aDecoder.decodeObject(forKey: "city") as? String
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? String
        designation = aDecoder.decodeObject(forKey: "designation") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        lastname = aDecoder.decodeObject(forKey: "lastname") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if about != nil{
            aCoder.encode(about, forKey: "about")
        }
        if avatar != nil{
            aCoder.encode(avatar, forKey: "avatar")
        }
        if blogId != nil{
            aCoder.encode(blogId, forKey: "blogId")
        }
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if designation != nil{
            aCoder.encode(designation, forKey: "designation")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if lastname != nil{
            aCoder.encode(lastname, forKey: "lastname")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
    }
}
