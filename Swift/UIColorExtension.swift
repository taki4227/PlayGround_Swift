//
//  UIColorExtension.swift
//  ToDoListApp
//
//  Created by Naoki Takimoto on 2017/03/17.
//  Copyright © 2017年 takimoto. All rights reserved.
//

import UIKit

extension UIColor {
    
    
    /// RGB値をUIColorに変換
    ///
    /// - Parameters:
    ///   - r: R値
    ///   - g: G値
    ///   - b: B値
    ///   - alpha: Alpha値
    /// - Returns: UIColor
    class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    
    /// Hex値をUIColorに変換
    ///
    /// - Parameters:
    ///   - hexStr: Hex値
    ///   - alpha: Alpha値
    /// - Returns: UIColor, 存在しない場合は白を返す
    class func hex ( hexStr : String, alpha : CGFloat) -> UIColor {
        var hexStr = hexStr
        hexStr = hexStr.replacingOccurrences(of: "#", with: "")
        
        if hexStr.characters.count == 3 {
            var newHexStr = ""
            for c in hexStr.characters {
                newHexStr += "\(c)\(c)"
            }
            hexStr = newHexStr
        }
        
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.white
        }
    }
}
