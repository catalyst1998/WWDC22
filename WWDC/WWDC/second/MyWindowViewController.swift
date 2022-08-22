//
//  MyWindowViewController.swift
//  WWDC
//
//  Created by bytedance on 2022/8/22.
//

import UIKit

class MyWindowViewController: UIViewController {
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    
    override func loadView() {
        super.loadView()
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label.text = UIDevice.current.name
        
        view.addSubview(label)
    }
    

        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        UIScreen.main即将被废弃
    //      建议使用(UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen
            
            if let orientation = windowScene?.interfaceOrientation {
                if orientation == .portrait {
                    windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations:.landscapeLeft))
                } else {
                    windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations:.portrait))
                }
            }

    
        }
    
    

}
