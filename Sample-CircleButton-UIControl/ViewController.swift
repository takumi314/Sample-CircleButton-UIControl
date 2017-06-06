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
    var baseView: UIView!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let baseView = createCircleView()
        view.addSubview(baseView)
        view.backgroundColor = .black
    }

    override func viewWillLayoutSubviews() {
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] (UIViewControllerTransitionCoordinatorContext) in
            guard let center = self?.view.center else { return }
            self?.baseView.center = center
        }, completion: { (UIViewControllerTransitionCoordinatorContext) in
            //
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Provate methods

    private func createCircleView() -> UIView {
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        circleView.addSubview(CircleView.label)

        baseView = UIView(frame: circleView.bounds)
        baseView.backgroundColor = .clear
        baseView.center = view.center
        baseView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        baseView.addSubview(circleView)

        return baseView
    }

    @objc private func handlePanGesture(sender: UIGestureRecognizer) {
        gesture = GestureCoodinates(parent: CGPoint(), origin: CGPoint())
        switch sender.state {
        case .began:
            gesture.parent = sender.location(in: view)
            gesture.origin = (sender.view?.center)!
            break
        case .changed:
            let delta = sender.location(in: view) - gesture.parent
            sender.view?.center = gesture.origin - gesture.touch + delta
            break
        case .ended:
            break
        default:
            break
        }
    }

}

