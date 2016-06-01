//
//  BLSTabPageViewControllerDelegate.swift
//  BLSTabPageViewController
//
//  Created by Paweł Knuth on 01.06.2016.
//  Copyright © 2016 Paweł Knuth. All rights reserved.
//

import UIKit

protocol BLSTabPageViewControllerDelegate {
    func tabPageViewControllerTitles(sender: BLSTabPageViewController) -> [String]
    
    func tabPageViewControllerNext(sender: BLSTabPageViewController) -> UIViewController?
    func tabPageViewControllerPrevious(sender: BLSTabPageViewController) -> UIViewController?
    func tabPageViewControllerAtIndex(sender: BLSTabPageViewController, index: Int) -> UIViewController?
    
    func tabPageViewControllerCurrentIndex(sender: BLSTabPageViewController) -> Int
}
