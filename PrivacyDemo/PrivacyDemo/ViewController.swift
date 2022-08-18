//
//  ViewController.swift
//  PrivacyDemo
//
//  Created by caisiyi on 2022/8/15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(textField)
//        view.addSubview(pasteControl)
//        view.addSubview(calendarView)
        
        let button: UIButton = UIButton(frame: CGRect(x: 30, y: 50, width: 200, height: 50))
        button.backgroundColor = .lightGray
        button.setTitle("jumpToPageControl", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(jumpToPageControl), for: .touchUpInside)

        view.addSubview(button)
        
    }
    
    
    @objc
    func jumpToPageControl(sender:UIButton){
        let pageControl = PageViewController()
        self.present(pageControl,animated: true)
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        UIScreen.main即将被废弃
////        建议使用(UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen
//        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
//        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeLeft))
//
//    }
    
    lazy var calendarView: UICalendarView = {
        let calendarView = UICalendarView(frame: CGRect(x: 20, y: 20, width: 250, height: 300))
        calendarView.backgroundColor = .white
        calendarView.tintColor = .blue
        calendarView.calendar = Calendar(identifier: Foundation.Calendar.Identifier.gregorian)
        calendarView.locale = Locale(identifier: "zh_Hans_CN")
        calendarView.delegate = self
        
        //日期多选
        let mutiDateSelection = UICalendarSelectionMultiDate(delegate: self)
        calendarView.selectionBehavior = mutiDateSelection
        return calendarView
    }()
    
    
    var selectedDates: Set<DateComponents> = []{
        didSet{
            //格式化日期
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
    
    
    
    
    
    
    lazy var textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 200, width: UIScreen.main.bounds.width-50, height: 40))
        textField.borderStyle = .roundedRect
        
        let name = UIDevice.current.name
        
        textField.text = name
    
        return textField
    }()
    
    lazy var pasteControl: UIPasteControl = {
        //创建配置config
        let config = UIPasteControl.Configuration()
        //配置背景颜色
        config.baseBackgroundColor = .blue
        //配置形状
        config.cornerStyle = .capsule
        //配置显示模式
        config.displayMode = .iconAndLabel
        //创建UIPasteControl
        let pasteControl = UIPasteControl(configuration: config)
        //设置target 获取pasteboard中的内容后粘贴的位置
        pasteControl.target = textField
        pasteControl.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        pasteControl.center = view.center
        
        return pasteControl
    }()


}

// MARK: - UICalendarSelectionMultiDateDelegate
extension ViewController: UICalendarSelectionMultiDateDelegate {
    // MARK: 选择了日期
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        selectedDates.insert(dateComponents)
    }

    // MARK: 取消选择了日期
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        selectedDates.remove(dateComponents)
    }

    // MARK: 是否能够选择日期
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate,
                            canSelectDate dateComponents: DateComponents) -> Bool {
//        guard let day = dateComponents.day else {
//            return false
//        }
        // 只能选择偶数日
        return true
    }

    // MARK: 是否能够取消选择日期
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate,
                            canDeselectDate dateComponents: DateComponents) -> Bool {
        return true
    }
}

// MARK: - UICalendarViewDelegate
extension ViewController: UICalendarViewDelegate {
    // MARK: 装饰视图，显示在日历数字下边区域
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents)
        -> UICalendarView.Decoration? {

        return UICalendarView.Decoration.default(color: .gray, size: .small)
    }
}
