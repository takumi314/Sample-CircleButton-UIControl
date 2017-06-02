//
//  CounterLabel.swift
//  Sample-CircleButton-UIControl
//
//  Created by NishiokaKohei on 2017/06/02.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

class CounterLabel: UILabel {

    // MARK: - Initialzer

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration

    func writeText(_ text: String) {
        self.text = text
    }

    func config()  {
        self.backgroundColor = .clear
        self.textColor = .black
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 40)
    }

    func eraseText() {
        self.text = ""
    }

}
