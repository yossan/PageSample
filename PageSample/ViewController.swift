//
//  ViewController.swift
//  PageSample
//
//  Created by Kosuke Yoshimoto on 2019/11/30.
//  Copyright © 2019 Kosuke Yoshimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var currentNumber: Int = 0
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayPageViewController()
    }

    func displayPageViewController() {
        let pageCtr = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.addChild(pageCtr)
        pageCtr.view.frame = self.view.bounds
        pageCtr.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(pageCtr.view)
        pageCtr.didMove(toParent: self)
        pageCtr.dataSource = self
        
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.isOpaque = true
        let first = self.contentViewController(at: 1)!
        pageCtr.setViewControllers([first], direction: .forward, animated: false, completion: nil)
    }
    
    func contentViewController(at number: Int) -> ContentViewController? {
        let content = self.storyboard!.instantiateViewController(identifier: "ContentViewController") as! ContentViewController
        content.number = number
        content.view.backgroundColor = .lightGray
        self.currentNumber = number
        return content;
    }
    
    
    // Returns the view controller before the given view controller.
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let content = viewController as! ContentViewController
        let number = content.number
        if number == 1 {
            return nil
        }
        
        return self.contentViewController(at: number - 1)
    }

    

    // Returns the view controller after the given view controller. nilを返すと終了
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let content = viewController as! ContentViewController
        let number = content.number
        if number >= 5 {
            return nil
        }
        
        return self.contentViewController(at: number + 1)
    }


    // # Supporting a Page Indicator

    
    // Returns the number of items to be reflected in the page indicator.
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }


    // Returns the index of the selected item to be reflected in the page indicator.
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentNumber - 1
    }
}

