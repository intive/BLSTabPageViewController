//
//  BLSTabPageViewController.swift
//  BLSTabPageViewController
//
//  Created by Paweł Knuth on 01.06.2016.
//  Copyright © 2016 Paweł Knuth. All rights reserved.
//

import UIKit

class BLSTabPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPageViewControllerDataSource {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var pageViewController: UIPageViewController?
    
    var delegate: BLSTabPageViewControllerDelegate?
    
    var titles:[String] = []
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.clearColor()
        createPageViewController()
        // For test purposes
        delegate = TestDelegate()
        //
        tabPageData()
        guard let delegate = delegate else {
            return
        }
        
        currentIndex = delegate.tabPageViewControllerCurrentIndex(self)
        
        if let initialViewController = delegate.tabPageViewControllerAtIndex(self, index: currentIndex) {
            pageViewController?.setViewControllers([initialViewController], direction: .Forward, animated: true, completion: nil)
        }
    }
    
    private func createPageViewController() {
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        pageController.dataSource = self
        
        pageViewController = pageController
        
        guard let pageViewController = pageViewController else {
            return
        }
        containerView.addSubview(pageViewController.view)
        
    }
    
    func tabPageData() {
        guard let delegate = delegate else {
            return
        }
        
        titles = delegate.tabPageViewControllerTitles(self)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath)
        
        if let cell = cell as? CollectionViewCell {
            cell.setupCell(titles[indexPath.row], isChosen: false)
        }
        
        return cell
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return delegate?.tabPageViewControllerPrevious(self)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return delegate?.tabPageViewControllerNext(self)
    }
}