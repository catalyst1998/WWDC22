//
//  SecondViewController.swift
//  WWDC
//
//  Created by bytedance on 2022/8/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.title = "WWDC iOS16"
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(check))
        self.navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(setting))
        self.navigationItem.rightBarButtonItem = rightButton
        
        

        let button_cal = UIButton(type: .roundedRect)
        button_cal.frame = CGRect(x: 50, y: 100, width: 100, height: 50)
        button_cal.setTitle("新增日历", for: .normal)
        button_cal.backgroundColor = .systemBlue
        button_cal.tintColor = .white
        button_cal.addTarget(self, action: #selector(jumpToCalenderView), for: .touchUpInside)
        view.addSubview(button_cal)
        
        let button_page = UIButton(frame: CGRect(x: 50, y: 200, width: 130, height: 50))
        button_page.setTitle("PageControl", for: .normal)
        button_page.backgroundColor = .systemBlue
        button_page.addTarget(self, action: #selector(jumpToPageControl), for: .touchUpInside)
    
        view.addSubview(button_page)
        
        
        let button_paste = UIButton(frame: CGRect(x: 50, y: 300, width: 130, height: 50))
        button_paste.setTitle("PasteControl", for: .normal)
        button_paste.backgroundColor = .systemBlue
        button_paste.addTarget(self, action: #selector(jumpToPasteControl), for: .touchUpInside)
    
        view.addSubview(button_paste)
        
        let button_window = UIButton(frame: CGRect(x: 250, y: 100, width: 100, height: 50))
        button_window.setTitle("window", for: .normal)
        button_window.backgroundColor = .systemBlue
        button_window.addTarget(self, action: #selector(jumpToWindow), for: .touchUpInside)
    
        view.addSubview(button_window)

    }
    

    @objc
    func jumpToCalenderView() {
        self.navigationController?.pushViewController(MyCalendarViewController(), animated: false)
    }

    @objc
    func jumpToPageControl() {
        self.navigationController?.pushViewController(AfterPageControlViewController(), animated: false)
    }
    
    
    @objc
    func jumpToPasteControl() {
        self.navigationController?.pushViewController(MyPasteViewController(), animated: false)
    }
    
    @objc
    func jumpToWindow() {
        self.navigationController?.pushViewController(MyWindowViewController(), animated: false)
    }
    
    @objc
    func check() {
        print("check")
    }
    
    @objc
    func setting() {
        print("setting")
    }
    

}
