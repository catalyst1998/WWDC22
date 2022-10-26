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
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(textView)
    }
    
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 550, width: 150, height: 40))
        label.text = "本月考勤天数"
        return label
    }()
    
    var textView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 200, y: 550, width: 150, height: 60))
        
        textView.textAlignment = .left
        
        textView.textColor = .red
        
        textView.font = UIFont.boldSystemFont(ofSize: 20)
                                          
        return textView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 250, y: 620, width: 70, height: 40))
        button.backgroundColor = .systemBlue
        button.setTitle("confirm", for: .normal)
        
        button.addTarget(self, action: #selector(countWorkDays), for: .touchUpInside)
        return button
    }()
    
    lazy var calendarView: UICalendarView = {
        let calendarView = UICalendarView(frame: CGRect(x: 0, y: 0, width: self.fullSize.width, height:400))
        
        calendarView.center = CGPoint(x: self.fullSize.width*0.5, y: self.fullSize.height*0.4)
        
        calendarView.backgroundColor = .white
        
//        calendarView.tintColor = .blue
        
        calendarView.calendar = Calendar(identifier: .gregorian)
        
        calendarView.locale = Locale(identifier: "zh_Hans_CN")
        
        let fromDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: 2022, month: 9, day: 24)

        let toDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: 2022, month: 10, day: 23)

        guard let formDate = fromDateComponents.date, let toDate = toDateComponents.date else {
            return calendarView
        }

        calendarView.availableDateRange = DateInterval(start: formDate, end: toDate)
        

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
                    .formatted(
                        .dateTime.year().month().day().weekday()
                        .locale(Locale(identifier: "zh_Hans_CN"))
                        )
                 
            }
                .formatted()
            
            print(formatDate)
        }
    }
    
    @objc
    func countWorkDays() {
        let days = selectedDates.count
        
        textView.text = String(days)
    }
}

// MARK: - UICalendarSelectionMultiDateDelegate
extension MyCalendarViewController: UICalendarSelectionMultiDateDelegate {
    
    /// 选择多个日期
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        // 将多选的日期加入到数组里
//        print(dateComponents)
        selectedDates.insert(dateComponents)
    }
    
    /// 取消多选日期的回调
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        // 将日期移除
        selectedDates.remove(dateComponents)
    }
    
    /// 是否可以多选日期
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
        
        let cal = Calendar.current
            .date(from:dateComponents)?
            .formatted(
                .dateTime.weekday()
                )
        if dateComponents.day == 3 || dateComponents.day == 4 || dateComponents.day == 5 || dateComponents.day == 6 || dateComponents.day == 7 {
            return false
        }
        if dateComponents.day == 8 || dateComponents.day == 9 {
            return true
        }
        if cal == "Sun" || cal == "Sat" {
            return false
        } else {
            return true
        }
        
//        return dateComponents.day?.isMultiple(of: <#T##Int#>)

    }
    
    /// 是否可以取消多选的日期
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canDeselectDate dateComponents: DateComponents) -> Bool {
        return true
    }
    
    
}

// MARK: - UICalendarViewDelegate
extension MyCalendarViewController: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        
//        return UICalendarView.Decoration.default(color: .gray, size: .small)
        return .customView{
            let label = UILabel()
            label.text = "WWDC"
            label.textColor = .black
            label.font = .systemFont(ofSize: 8)
            return label
        }
    }

}
