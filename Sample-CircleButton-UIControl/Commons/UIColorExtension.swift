//
//  UIColorExtension.swift
//  Sample-CircleButton-UIControl
//
//  Created by NishiokaKohei on 2017/05/27.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

extension UIColor {

    // MARK: - Initializer

    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let mask = 0x000000FF

        let r = Int(hex >> 16) & mask
        let g = Int(hex >> 8) & mask
        let b = Int(hex) & mask

        let red = CGFloat(r) / 255
        let green = CGFloat(g) / 255
        let blue = CGFloat(b) / 255

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

}
