//
//  Counter.swift
//  Sample-CircleButton-UIControl
//
//  Created by NishiokaKohei on 2017/06/01.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation

struct Counter {

    public let max: Int

    public var isMaximum: Bool {
        return number >= max
    }

    private var number: Int {
        didSet {
            number = (number > max || 0 > number) ? 0 : number
        }
    }

    init(max: Int = 0,from initial: Int = 0) {
        self.max = max
        self.number = initial
    }

    mutating func plusOne() {
        self.number = self.number + 1
    }

    mutating func minusOne() {
        self.number = self.number - 1
    }

    mutating func reset() {
        self.number = 0
    }

    func count() -> Int {
        return number
    }

}
