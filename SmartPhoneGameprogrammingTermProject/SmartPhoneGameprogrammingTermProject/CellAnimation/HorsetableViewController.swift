//
//  HorsetableViewController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by kpugame on 2021/05/28.
//

import UIKit

class HorsetableViewController: UITableViewController {
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var shireicon: UIImageView!
    @IBOutlet weak var miniatureicon: UIImageView!
    @IBOutlet weak var ponyicon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageViewAnimation()
        iconImage.animationRepeatCount = 1
        iconImage.animationDuration = 1.0
        iconImage.startAnimating()
        
        shireicon.animationRepeatCount = 1
        shireicon.animationDuration = 1.2
        shireicon.startAnimating()
        
        miniatureicon.animationRepeatCount = 1
        miniatureicon.animationDuration = 1.4
        miniatureicon.startAnimating()
        
        ponyicon.animationRepeatCount = 1
        ponyicon.animationDuration = 1.6
        ponyicon.startAnimating()
    }
    
    private func setupImageViewAnimation() {
        iconImage.animationImages = [#imageLiteral(resourceName: "horse1.png"), #imageLiteral(resourceName: "horse2.png"), #imageLiteral(resourceName: "horse3.png"), #imageLiteral(resourceName: "horse4.png"), #imageLiteral(resourceName: "horse5.png"), #imageLiteral(resourceName: "horse6.png"), #imageLiteral(resourceName: "horse7.png"), #imageLiteral(resourceName: "horse8.png"),#imageLiteral(resourceName: "horse9.png"), #imageLiteral(resourceName: "horse10.png"), #imageLiteral(resourceName: "horse11.png"), #imageLiteral(resourceName: "horse12.png")]
        shireicon.animationImages = [#imageLiteral(resourceName: "horse1.png"), #imageLiteral(resourceName: "horse2.png"), #imageLiteral(resourceName: "horse3.png"), #imageLiteral(resourceName: "horse4.png"), #imageLiteral(resourceName: "horse5.png"), #imageLiteral(resourceName: "horse6.png"), #imageLiteral(resourceName: "horse7.png"), #imageLiteral(resourceName: "horse8.png"),#imageLiteral(resourceName: "horse9.png"), #imageLiteral(resourceName: "horse10.png"), #imageLiteral(resourceName: "horse11.png"), #imageLiteral(resourceName: "horse12.png")]
        miniatureicon.animationImages = [#imageLiteral(resourceName: "horse1.png"), #imageLiteral(resourceName: "horse2.png"), #imageLiteral(resourceName: "horse3.png"), #imageLiteral(resourceName: "horse4.png"), #imageLiteral(resourceName: "horse5.png"), #imageLiteral(resourceName: "horse6.png"), #imageLiteral(resourceName: "horse7.png"), #imageLiteral(resourceName: "horse8.png"),#imageLiteral(resourceName: "horse9.png"), #imageLiteral(resourceName: "horse10.png"), #imageLiteral(resourceName: "horse11.png"), #imageLiteral(resourceName: "horse12.png")]
        ponyicon.animationImages = [#imageLiteral(resourceName: "horse1.png"), #imageLiteral(resourceName: "horse2.png"), #imageLiteral(resourceName: "horse3.png"), #imageLiteral(resourceName: "horse4.png"), #imageLiteral(resourceName: "horse5.png"), #imageLiteral(resourceName: "horse6.png"), #imageLiteral(resourceName: "horse7.png"), #imageLiteral(resourceName: "horse8.png"),#imageLiteral(resourceName: "horse9.png"), #imageLiteral(resourceName: "horse10.png"), #imageLiteral(resourceName: "horse11.png"), #imageLiteral(resourceName: "horse12.png")]
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.1)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }

}

