//
//  TestDelegate.swift
//  BLSTabPageViewController
//
//  Created by Paweł Knuth on 01.06.2016.
//  Copyright © 2016 Paweł Knuth. All rights reserved.
//

import UIKit

class TestDelegate: BLSTabPageViewControllerDelegate {
    func tabPageViewControllerTitles(sender: BLSTabPageViewController) -> [String] {
        return ["One", "Two", "Three", "Four", "Six", "Seven"]
    }
    
    func tabPageViewControllerNext(sender: BLSTabPageViewController) -> UIViewController? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Third")
    }
    func tabPageViewControllerPrevious(sender: BLSTabPageViewController) -> UIViewController? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("First")
    }
    func tabPageViewControllerAtIndex(sender: BLSTabPageViewController, index: Int) -> UIViewController? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Second")
    }
    
    func tabPageViewControllerCurrentIndex(sender: BLSTabPageViewController) -> Int {
        return 0
    }
}