//
//  PagedScrollViewController_pony.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by kpugame on 2021/05/19.
//

import UIKit

class PagedScrollViewController_pony: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var pageImages: [UIImage] = []
    
    var pageViews: [UIImageView?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageImages = [UIImage(named: "photo1.png")!,
                      UIImage(named: "photo2.png")!,
                    UIImage(named: "photo3.png")!,
                    UIImage(named: "photo4.png")!,
                    UIImage(named: "photo5.png")!]
        
        let pageCount = pageImages.count
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count), height: pagesScrollViewSize.height)
        
        
        loadVisblePages()
    }
    func loadPage(_ page: Int) {
        if page < 0 || page >= pageImages.count {
            return
        }
        
        if pageViews[page] != nil {
            
        }
        else {
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .scaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(_ page: Int) {
        if page < 0 || page >= pageImages.count {
            return
        }
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisblePages() {
        let pageWidth = scrollView.frame.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        pageControl.currentPage = page
        
        let firstPage = page - 1
        let lastPage = page + 1
        
        for index in 0..<firstPage+1 {
            purgePage(index)
        }
        for index in firstPage ... lastPage {
            loadPage(index)
        }
        for index in lastPage+1 ..< pageImages.count+1 {
            purgePage(index)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        loadVisblePages()
    }
}
