//
//  ViewController.swift
//  PrivacyDemoBefore16
//
//  Created by caisiyi on 2022/8/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(textField)
    }

    lazy var textField: UITextField = {
        var textField = UITextField(frame: CGRect(x: 40, y: 40, width: 150, height: 50))
        
        textField.backgroundColor = .gray
        
        let name = UIDevice.current.name
        textField.text = name
        return textField
    }()

}

