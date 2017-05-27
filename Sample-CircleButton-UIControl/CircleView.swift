//
//  CircleView.swift
//  Sample-CircleButton-UIControl
//
//  Created by NishiokaKohei on 2017/05/27.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

// MARK: - UIControl

class CircleView: UIControl {

    // MARK: - Immutable properties

    let normalColor = UIColor(hex: 0x59acff)
    let selectedColor = UIColor(hex: 0xFF6E86)

    // MARK: - Muttable properties

    var circleColor: UIColor {
        return self.isSelected ? self.selectedColor : self.normalColor
    }

    // MARK: - Shape

    lazy var circleShapedLayer: CAShapeLayer = {
        let path = UIBezierPath(ovalIn: self.bounds)

        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        // 色の指定

        return circleLayer
    }()

    // MARK: - UIView

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return circleShapedLayer.path?.contains(point) ?? false
    }

}
