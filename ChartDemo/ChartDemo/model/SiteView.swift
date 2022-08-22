//
//  SiteView.swift
//  ChartDemo
//
//  Created by caisiyi on 2022/8/18.
//

import SwiftUI

struct SiteView: Identifiable{
    var id = UUID().uuidString
    var hour: Date
    var views: Double
    var animated: Bool = false
}

extension Date{
    func updateHour(value: Int)->Date {
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
    }
}

var analytics: [SiteView] = [
    SiteView(hour: Date().updateHour(value: 8), views: 1500),
    SiteView(hour: Date().updateHour(value: 9), views: 1242),
    SiteView(hour: Date().updateHour(value: 10), views: 4210),
    SiteView(hour: Date().updateHour(value: 11), views: 1400),
    SiteView(hour: Date().updateHour(value: 12), views: 1115),
    SiteView(hour: Date().updateHour(value: 13), views: 1320),
    SiteView(hour: Date().updateHour(value: 14), views: 3812),
    SiteView(hour: Date().updateHour(value: 15), views: 2341),
    SiteView(hour: Date().updateHour(value: 16), views: 1938),
    SiteView(hour: Date().updateHour(value: 17), views: 3244),
    SiteView(hour: Date().updateHour(value: 18), views: 3244),
    SiteView(hour: Date().updateHour(value: 19), views: 2454),
    SiteView(hour: Date().updateHour(value: 20), views: 3644),


]
