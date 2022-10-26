//
//  MyDatePickerViewController.swift
//  WWDC
//
//  Created by bytedance on 2022/8/22.
//

import UIKit

class MyDatePickerViewController: UIViewController {
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    lazy var myDatePicker: UIDatePicker = {
        var myDatePicker = UIDatePicker(frame: CGRect(x: 10, y: 50, width:fullScreenSize.width, height: 200))
        
        myDatePicker.datePickerMode = .date
        
        myDatePicker.date = .now
        
        let formate = DateFormatter()
        
        formate.dateFormat = "yyyy-MM-dd"
        
        let fromDate = formate.date(from: "2013-03-12")
        
        myDatePicker.minimumDate = fromDate
        
        let endDate = formate.date(from: "2030-11-30")
        
        myDatePicker.maximumDate = endDate
        
        myDatePicker.center = CGPoint(x: fullScreenSize.width*0.2, y: fullScreenSize.height*0.4)
        
        return myDatePicker
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "iOS15"
        
        view.addSubview(myDatePicker)
        
    }



}
