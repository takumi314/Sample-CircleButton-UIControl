//
//  ViewController.swift
//  Sample-CircleButton-UIControl
//
//  Created by NishiokaKohei on 2017/05/27.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

struct GestureCoodinates {
    var parent: CGPoint
    var origin: CGPoint
    var touch: CGPoint {
        get {
            return parent - origin
        }
    }
}

class ViewController: UIViewController {

    var gesture: GestureCoodinates!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        let baseView = createCircleView()
        self.view.addSubview(baseView)
        self.view.backgroundColor = .black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Provate methods

    private func createCircleView() -> UIView {
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let baseView = UIView(frame: circleView.bounds)
        baseView.backgroundColor = .clear
        baseView.center = self.view.center
        baseView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        baseView.addSubview(circleView)

        return baseView
    }

    @objc private func handlePanGesture(sender: UIGestureRecognizer) {
        gesture = GestureCoodinates(parent: CGPoint(), origin: CGPoint())
        switch sender.state {
        case .began:
            gesture.parent = sender.location(in: self.view)
            gesture.origin = (sender.view?.center)!
            break
        case .changed:
            let delta = sender.location(in: self.view) - gesture.parent
            sender.view?.center = gesture.origin - gesture.touch + delta
            break
        case .ended:
            break
        default:
            break
        }
    }

}

