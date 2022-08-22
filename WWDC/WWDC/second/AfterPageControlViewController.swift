//
//  AfterPageControlViewController.swift
//  WWDC
//
//  Created by bytedance on 2022/8/22.
//

import UIKit

class AfterPageControlViewController: UIViewController {
    
    override func viewDidLoad() {
        view.addSubview(pageControl)
    }
    
    
    lazy var pageControl: UIPageControl = {
       let pageControl = UIPageControl(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        
        pageControl.backgroundStyle = .automatic
        pageControl.backgroundColor = .gray
        pageControl.numberOfPages = 10
        
        pageControl.pageIndicatorTintColor = .red
        pageControl.currentPageIndicatorTintColor = .blue
        
//        @available(iOS 16.0, *)
//        open var direction: UIPageControl.Direction

        pageControl.direction = .topToBottom
        
//        @available(iOS 16.0, *)
//        open var preferredCurrentPageIndicatorImage: UIImage?
        pageControl.preferredIndicatorImage = UIImage(systemName: "star")
        pageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "star.fill")
        
        
//            open func setCurrentPageIndicatorImage(_ image: UIImage?, forPage page: Int)
        pageControl.setCurrentPageIndicatorImage(UIImage(systemName: "pencil"), forPage: 3)
        
        return pageControl
    }()

}
