//
//  String+HTML.swift
//  InfiniteArt
//
//  Created by Angela Kearns on 11/26/23.
//

import Foundation
import UIKit

extension String {
    public var convertHtmlToNSAttributedString: NSMutableAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        do {
            let attributedString = try NSMutableAttributedString(data: data, options: [.documentType: NSMutableAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 18), range: NSRange(location: 0, length: attributedString.length))
            return attributedString
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    var convertHtmlToString: AttributedString {
        if let nsAttributedString = convertHtmlToNSAttributedString {
            return AttributedString(nsAttributedString)
        }
        
        return AttributedString("")
    }

}
