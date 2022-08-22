//
//  MyCalendarViewController.swift
//  WWDC
//
//  Created by bytedance on 2022/8/22.
//

import UIKit

class MyCalendarViewController: UIViewController {

    
    
    let fullSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        view.addSubview(calendarView)
    }
    
    lazy var calendarView: UICalendarView = {
        let calendarView = UICalendarView(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 500))
        calendarView.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.3)
        
        calendarView.backgroundColor = .white
        
//        calendarView.tintColor = .blue
        
        calendarView.calendar = Calendar(identifier: .gregorian)
        
        calendarView.locale = Locale(identifier: "zh_Hans_CN")
        
        calendarView.delegate = self
        
        let multiDateSelection = UICalendarSelectionMultiDate(delegate: self)
        
        calendarView.selectionBehavior = multiDateSelection
        
        return calendarView
    }()
    
    var selectedDates: Set<DateComponents> = []{
        didSet {
            let formatDate = selectedDates.compactMap { components in
                Calendar.current
                    .date(from:components)?
                    .formatted(.dateTime.year().month().day()
                        .locale(Locale(identifier: "zh_Hans_CN")))
                 
            }
                .formatted()
            
            print(formatDate)
        }
    }
}

// MARK: - UICalendarSelectionMultiDateDelegate
extension MyCalendarViewController: UICalendarSelectionMultiDateDelegate {
    
    /// 选择多选的回调
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        selectedDates.insert(dateComponents)
    }
    
    /// 取消多选的回调
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        selectedDates.remove(dateComponents)
    }
    
    /// 是否可以多选日期
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
        return true
    }
    
    /// 是否可以取消多选的日期
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canDeselectDate dateComponents: DateComponents) -> Bool {
        return true
    }
    
    
}

// MARK: - UICalendarViewDelegate
extension MyCalendarViewController: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
        return UICalendarView.Decoration.default(color: .gray, size: .small)
    }

}
