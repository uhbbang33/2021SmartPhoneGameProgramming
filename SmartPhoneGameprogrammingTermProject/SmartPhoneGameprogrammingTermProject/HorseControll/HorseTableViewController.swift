//
//  HorseTableViewController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by kpugame on 2021/05/23.
//

import UIKit

class HorseTableViewController: UITableViewController {

    let postTitles = ["서러브레드",
                      "샤이어",
                      "미니어처",
                      "포니"]
    
    let postImages = ["서러브레드", "샤이어", "미니어처", "포니"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 258.0
        tableView.rowHeight = UITableView.automaticDimension
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HorseViewCell

        cell.horseImage.image = UIImage(named: postImages[(indexPath as NSIndexPath).row])
        cell.horseLabel.text = postTitles[(indexPath as NSIndexPath).row]
        return cell
    }

    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        let rotationAngleRadians = 90.0 * CGFloat(Double.pi/180.0)
//        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
//        cell.layer.transform = rotationTransform
//
//        UIView.animate(withDuration: 1.0, animations: { cell.layer.transform = CATransform3DIdentity })
//    }

  

}
