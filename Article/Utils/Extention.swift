//
//  Extention.swift
//  Article
//
//  Created by Prerna Chauhan on 01/07/20.
//  Copyright © 2020 Prerna Chauhan. All rights reserved.
//
import Foundation
import UIKit
extension String {
    
    func getCurrentDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        return result
    }
}

extension String {

    /// Converts a string to a percent-encoded URL, including Unicode characters.
    ///
    /// - Returns: An encoded URL if all steps succeed, otherwise nil.
    func encodedUrl() -> URL? {
        // Remove preexisting encoding,
        guard let decodedString = self.removingPercentEncoding,
            // encode any Unicode characters so URLComponents doesn't choke,
            let unicodeEncodedString = decodedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            // break into components to use proper encoding for each part,
            let components = URLComponents(string: unicodeEncodedString),
            // and reencode, to revert decoding while encoding missed characters.
            let percentEncodedUrl = components.url else {
            // Encoding failed
            return URL(string: self)
        }
        return percentEncodedUrl
    }
}



extension Int {
func shorted() -> String {
    if self >= 1000 && self < 10000 {
        return String(format: "%.1fK", Double(self/100)/10).replacingOccurrences(of: ".0", with: "")
    }

    if self >= 10000 && self < 1000000 {
        return "\(self/1000)k"
    }

    if self >= 1000000 && self < 10000000 {
        return String(format: "%.1fM", Double(self/100000)/10).replacingOccurrences(of: ".0", with: "")
    }

    if self >= 10000000 {
        return "\(self/1000000)M"
    }

    return String(self)
}
}

extension UIImageView {

   func setRounded() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}
