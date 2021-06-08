//
//  shireController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by kpugame on 2021/05/28.
//

import UIKit

class shireController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nameLabel: UILabel!
    
    var audioController: AudioController

    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffect(audioFileName: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    var pageImages: [UIImage] = []
        
        var pageViews: [UIImageView?] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            
            audioController.playerEffect(name: SoundChip)
            
            pageImages = [UIImage(named: "shire1.jpg")!,
                          UIImage(named: "shire2.jpg")!,
                        UIImage(named: "shire3.jpg")!,
                        UIImage(named: "shire4.jpg")!,
                        UIImage(named: "shire5.jpg")!]
            
            let pageCount = pageImages.count
            
            pageControl.currentPage = 0
            pageControl.numberOfPages = pageCount
            
            for _ in 0..<pageCount {
                pageViews.append(nil)
            }
            
            let pagesScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count), height: pagesScrollViewSize.height)
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.nameLabel.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                },
                completion: { _ in
                UIView.animate(withDuration: 1.0) {
                    self.nameLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                  }
                })
            
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
