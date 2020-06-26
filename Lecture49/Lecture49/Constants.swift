//
//  Constants.swift
//  Lecture49
//
//  Created by Nika Kirkitadze on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

struct Colors {
//    public static let MossGreen = UIColor(hex: "#00CC83")
//    public static let Black     = UIColor(hex: "#191919")
//    public static let Gray      = UIColor(hex: "#F3F3F3")
//    public static let LightGray = UIColor(hex: "#F1F1F1")
//    public static let DarkGray  = UIColor(hex: "#777777")
    
    public static let MossGreen = hexStringToUIColor(hex: "00CC83")
    public static let Black     = hexStringToUIColor(hex: "191919")
    public static let Gray      = hexStringToUIColor(hex: "F3F3F3")
    public static let LightGray = hexStringToUIColor(hex: "F1F1F1")
    public static let DarkGray  = hexStringToUIColor(hex: "777777")
}

struct Font {
    public static let SourceSansProBold     = UIFont(name: "SourceSansPro-Bold", size: 14)
    public static let SourceSansProRegular  = UIFont(name: "SourceSansPro-Regular", size: 14)
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
