//
//  ModelController.swift
//  page
//
//  Created by u16suzu on 2015/11/25.
//  Copyright © 2015年 IGNIS LTD. All rights reserved.
//

import UIKit

// データソース｡ ビューコントローラではない
class ModelController: NSObject, UIPageViewControllerDataSource {

    var pageData: [String] = []

    override init() {
        super.init()
        let dateFormatter = NSDateFormatter()
        pageData = dateFormatter.monthSymbols
    }

    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> DataViewController? {
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }

        let dataViewController = storyboard.instantiateViewControllerWithIdentifier("DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
        dataViewController.index = index
        return dataViewController
    }

    func indexOfViewController(viewController: DataViewController) -> Int {
        return pageData.indexOf(viewController.dataObject) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    // 次のページ
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    // 前のページ
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index++
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}

