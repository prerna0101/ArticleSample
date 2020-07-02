//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on 01/07/20.

import Foundation


class RootClass : NSObject, NSCoding{

    var comments : Int!
    var content : String!
    var createdAt : String!
    var id : String!
    var likes : Int!
    var media : [Media]!
    var user : [User]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        comments = dictionary["comments"] as? Int
        content = dictionary["content"] as? String
        createdAt = dictionary["createdAt"] as? String
        id = dictionary["id"] as? String
        likes = dictionary["likes"] as? Int
        media = [Media]()
        if let mediaArray = dictionary["media"] as? [[String:Any]]{
            for dic in mediaArray{
                let value = Media(fromDictionary: dic)
                media.append(value)
            }
        }
        user = [User]()
        if let userArray = dictionary["user"] as? [[String:Any]]{
            for dic in userArray{
                let value = User(fromDictionary: dic)
                user.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if comments != nil{
            dictionary["comments"] = comments
        }
        if content != nil{
            dictionary["content"] = content
        }
        if createdAt != nil{
            dictionary["createdAt"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if likes != nil{
            dictionary["likes"] = likes
        }
        if media != nil{
            var dictionaryElements = [[String:Any]]()
            for mediaElement in media {
                dictionaryElements.append(mediaElement.toDictionary())
            }
            dictionary["media"] = dictionaryElements
        }
        if user != nil{
            var dictionaryElements = [[String:Any]]()
            for userElement in user {
                dictionaryElements.append(userElement.toDictionary())
            }
            dictionary["user"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        comments = aDecoder.decodeObject(forKey: "comments") as? Int
        content = aDecoder.decodeObject(forKey: "content") as? String
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        likes = aDecoder.decodeObject(forKey: "likes") as? Int
        media = aDecoder.decodeObject(forKey: "media") as? [Media]
        user = aDecoder.decodeObject(forKey: "user") as? [User]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if comments != nil{
            aCoder.encode(comments, forKey: "comments")
        }
        if content != nil{
            aCoder.encode(content, forKey: "content")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "createdAt")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if likes != nil{
            aCoder.encode(likes, forKey: "likes")
        }
        if media != nil{
            aCoder.encode(media, forKey: "media")
        }
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }
    }
}
