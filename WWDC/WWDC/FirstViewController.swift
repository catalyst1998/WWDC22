//
//  ViewController.swift
//  WWDC
//
//  Created by bytedance on 2022/8/22.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.title = "WWDC iOS15"
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(check))
        self.navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(setting))
        self.navigationItem.rightBarButtonItem = rightButton
        
        // 原始日历button
        let button_1 = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 50))
        button_1.setTitle("原始日历", for: .normal)
        button_1.backgroundColor = .systemBrown
        button_1.addTarget(self, action: #selector(jumpToDatePickerView), for: .touchUpInside)
        view.addSubview(button_1)
        
        
       // 原始PageControl
        let button_2 = UIButton(frame: CGRect(x: 50, y: 200, width: 130, height: 50))
        button_2.setTitle("PageControl", for: .normal)
        button_2.backgroundColor = .systemBrown
        button_2.addTarget(self, action: #selector(jumpToBeforePageControl), for: .touchUpInside)
        view.addSubview(button_2)
        
        
        
    }
    
    
    
    @objc
    func check() {
        print("check")
    }
    
    @objc
    func setting() {
        print("setting")
    }
    
    @objc
    func jumpToDatePickerView() {
        self.navigationController?.pushViewController(MyDatePickerViewController(), animated: false)
    }
    
    
    @objc
    func jumpToBeforePageControl() {
        self.navigationController?.pushViewController(BeforePageViewController(), animated: false)
    }
    

}

