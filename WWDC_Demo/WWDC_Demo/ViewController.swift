//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by bytedance on 2022/8/20.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
 
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 400))
        
        scrollView.delegate = self
  
        let imageView1 = UIImageView(image: UIImage(named: "01.jpg")?.withRenderingMode(.alwaysOriginal))
//        imageView1.sizeToFit()
        
        imageView1.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 400)
        
        let imageView2 = UIImageView(image: UIImage(named: "02.jpg")?.withRenderingMode(.alwaysOriginal))
        
        imageView2.frame = CGRect(x: scrollView.frame.width, y: 100, width: self.view.bounds.width, height: 400)
        
//        imageView2.sizeToFit()
        
        let imageView3 = UIImageView(image: UIImage(named: "03.jpg")?.withRenderingMode(.alwaysOriginal))
        
//        imageView3.sizeToFit()
        
        imageView3.frame = CGRect(x: scrollView.frame.width*2, y: 100, width: self.view.bounds.width, height: 400)

        let imageView4 = UIImageView(image: UIImage(named: "04.jpg")?.withRenderingMode(.alwaysOriginal))
        
//        imageView4.sizeToFit()
        
        imageView4.frame = CGRect(x: scrollView.frame.width*3, y: 100, width: self.view.bounds.width, height: 400)

        scrollView.addSubview(imageView1)
        scrollView.addSubview(imageView2)
        scrollView.addSubview(imageView3)
        scrollView.addSubview(imageView4)
        
//        scrollView.alwaysBounceHorizontal = true
        
        scrollView.isDirectionalLockEnabled = true
        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width*4, height: 280)
        
    
        
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x:self.view.frame.width*0.28, y: 500, width: 200, height: 30))
        
         pageControl.numberOfPages = 4
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.preferredIndicatorImage = UIImage(systemName: "star")
        pageControl.backgroundColor = .white
         
        pageControl.addTarget(self, action: #selector(changeImage), for: .valueChanged)
        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        self.view.addSubview(scrollView)
        
        self.view.addSubview(pageControl)
  
    }
    
   
    @objc func changeImage(){
        scrollView.setContentOffset(CGPoint(x: pageControl.currentPage * Int(self.view.frame.width), y: 100), animated: false)
//        scrollView.contentOffset =
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page: Int = Int(scrollView.contentOffset.x / self.view.frame.width)
        
        pageControl.currentPage = page
    }

}

