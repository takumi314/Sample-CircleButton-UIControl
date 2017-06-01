//
//  Counter.swift
//  Sample-CircleButton-UIControl
//
//  Created by NishiokaKohei on 2017/06/01.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import Foundation

struct Counter {

    ///
    /// The maximum number
    ///
    public let max: Int

    ///
    /// true if the total number is maximum one
    ///
    public var isMaximum: Bool {
        return number >= max
    }

    ///
    /// The current number that is counted,
    /// will be reset if over the maximum value
    ///
    private var number: Int {
        didSet {
            self.number = (number > max || 0 > number) ? 0 : number
        }
    }

    // MARK: - Initializer

    init(max: Int = 0,from initial: Int = 0) {
        self.max = max
        self.number = initial
    }

    ///
    /// add one to the current number
    ///
    mutating func plusOne() {
        self.number = number + 1
    }

    ///
    /// subtract one from the current number
    ///
    mutating func minusOne() {
        self.number = number - 1
    }

    ///
    /// set zero into the current number
    ///
    mutating func reset() {
        self.number = 0
    }

    ///
    /// return the current number
    ///
    func count() -> Int {
        return number
    }

}
