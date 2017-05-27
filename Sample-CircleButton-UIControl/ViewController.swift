//
//  ViewController.swift
//  Sample-CircleButton-UIControl
//
//  Created by NishiokaKohei on 2017/05/27.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        baseView.addSubview(circleView)

        return baseView
    }


}

