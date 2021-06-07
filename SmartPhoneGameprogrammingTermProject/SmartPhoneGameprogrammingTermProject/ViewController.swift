//
//  ViewController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/05/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    override func viewWillAppear(_ animated: Bool)
    {
        menuLabel.alpha = 0.0
    }

    override func viewDidAppear(_ animated: Bool)
    {
        UIView.animate(withDuration: 1.0, delay: 0.1, options: [],
            animations: {
                self.menuLabel.alpha = 1.0
            }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuLabel.font = UIFont.boldSystemFont(ofSize: 50.0)
        
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25.0)
        button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25.0)
        button4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28.0)
    }

}

