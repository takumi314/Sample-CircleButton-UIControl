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

    // MARK: - Properties

    let normalColor = UIColor(hex: 0x59acff)
    let selectedColor = UIColor(hex: 0xFF6E86)

    var circleColor: UIColor {
        return self.isSelected ? self.selectedColor : self.normalColor
    }

    var didTouchUpInsideHandler: (() -> Void)?

    // MARK: - Shape

    lazy var circleShapedLayer: CAShapeLayer = {
        let path = UIBezierPath(ovalIn: self.bounds)

        let circleLayer = CAShapeLayer()
        circleLayer.fillColor = self.circleColor.cgColor
        circleLayer.path = path.cgPath

        return circleLayer
    }()

    // MARK: - UIControl

    override var isHighlighted: Bool {
        didSet {
            guard oldValue != self.isHighlighted else { return }

            self.circleShapedLayer.fillColor = self.isHighlighted ?
                self.circleColor.darkColor().cgColor : self.circleColor.cgColor

            if self.isHighlighted {
                UIView.animate(
                    withDuration: 0.05,
                    delay: 0,
                    options: [.allowUserInteraction, .beginFromCurrentState],
                    animations: { [weak self] in
                        self?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                })
            } else {
                UIView.animate(
                    withDuration: 1,
                    delay: 0,
                    usingSpringWithDamping: 0.15,
                    initialSpringVelocity: 10,
                    options: [.allowUserInteraction, .beginFromCurrentState],
                    animations: { [weak self] in
                        self?.transform = CGAffineTransform.identity
                })
            }
        }
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)

        // 円内で離した場合のみに反応させる
        if let point = touch?.location(in: self),
            let path = self.circleShapedLayer.path,
            path.contains(point) {

            self.isSelected = !self.isSelected
            self.didTouchUpInsideHandler?()
        }
    }

    // MARK: - UIView

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return circleShapedLayer.path?.contains(point) ?? false
    }

    // MARK: - CALayerDelegate

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if circleShapedLayer.superlayer == nil {
            self.layer.addSublayer(circleShapedLayer)
        }
    }

    // MARK: - Private

    private func explosion() -> Void {
        self.transform = CGAffineTransform(scaleX: 15.0, y: 15.0)
    }

}
