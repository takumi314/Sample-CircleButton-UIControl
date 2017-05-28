//
//  Vectors.swift
//  Sample-CircleButton-UIControl
//
//  Created by NishiokaKohei on 2017/05/29.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

/*
 *  足し算 addition
 */

func + (_ lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

/*
 *  引き算 Subtraction
 */
func - (_ lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

/*
 *  内積 Inner product / スカラー積 Scalar product
 */
func * (_ lhs: CGPoint, rhs: CGPoint) -> CGFloat {
    return lhs.x * rhs.x + lhs.y * rhs.y
}

/*
 *  逆元 Inverse element
 */
prefix func - (value: CGPoint) -> CGPoint {
    return CGPoint(x: -value.x, y: -value.y)
}

extension CGPoint {

    /*
     *  Norm
     */
    public var length: CGFloat {
        get {
            return sqrt( self * self )
        }
    }

    /*
     *  Unit vector
     */
    public var unit: CGPoint {
        get {
            if self.length == 0 {
                return CGPoint(x: 0, y: 0)
            }
            return CGPoint(x: x / self.length , y: y / self.length)
        }
    }

}
