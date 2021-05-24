//
//  AlbumController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by kpugame on 2021/05/22.
//

import UIKit

class AlbumController: UITableViewController {
    
    @IBOutlet weak var thoroughbredImage: UIImageView!
    @IBOutlet weak var shireImage: UIImageView!
    @IBOutlet weak var miniatureImage: UIImageView!
    @IBOutlet weak var ponyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rotation()
    }
    
    func rotation()
    {
        UIView.animate(withDuration: 2.0, animations: {
            self.thoroughbredImage.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
            })
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 0
    }

   

}
