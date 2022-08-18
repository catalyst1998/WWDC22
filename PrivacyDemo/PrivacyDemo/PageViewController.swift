//
//  PageViewController.swift
//  PrivacyDemo
//
//  Created by caisiyi on 2022/8/16.
//

import UIKit

class PageViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pageControl)
    }
    
    
    lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        
        pageControl.center = view.center
        pageControl.numberOfPages = 3
        //设置垂直方向
        pageControl.direction = .bottomToTop
//        pageControl.pageIndicatorTintColor = .gray
//        pageControl.currentPageIndicatorTintColor = .lightGray
        //设置默认的指示器的图片
        pageControl.preferredIndicatorImage = UIImage(systemName: "star")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        //设置当前指示器的图片
        pageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "star.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        return pageControl
    }()
    
    
}
