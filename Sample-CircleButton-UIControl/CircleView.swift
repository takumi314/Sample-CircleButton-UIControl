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


    // MARK: - Shape

    lazy var circleShapedLayer: CAShapeLayer = {
        let path = UIBezierPath(ovalIn: self.bounds)

        let circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        // 色の指定

        return circleLayer
    }()

}
