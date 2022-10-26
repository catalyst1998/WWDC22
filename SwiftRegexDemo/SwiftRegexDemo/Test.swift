//
//  Test.swift
//  SwiftRegexDemo
//
//  Created by bytedance on 2022/8/23.
//

import Foundation
import RegexBuilder

struct Test {
    init() {
        let transaction = "ruby     08/09/2022      btyedance   $30.21"
    }
    
    
    // 1. regex literals
   let digit = /\d+/
    
    
    // 2. run-time construction
    let runtimeString = #"\d+"#
    
    // 3. regex builder
    let digits = OneOrMore(.digit)
}
