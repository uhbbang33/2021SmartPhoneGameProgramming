//
//  HorseRatingDetailsTableViewController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/06/08.
//

import UIKit

class HorseRatingDetailsTableViewController: UITableViewController {
    
    var horse: Horse?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var rating: Int = 1{
        didSet{
            ratingImageView.image? = imageForRating(rating: rating)!
        }
    }
    
    @IBOutlet weak var ratingImageView: UIImageView!
    
    func imageForRating(rating: Int) -> UIImage?{
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    @IBAction func unwindWithSelectedStar(segue: UIStoryboardSegue){
        if let starPickerViewController = segue.source as? StarTableViewController{
            rating = starPickerViewController.rating
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "SaveHorseDetail"{
            horse = Horse(name: nameTextField.text!, rating: rating)
        }
        
        if segue.identifier == "PickStar"{
            if let starPickerViewController = segue.destination as? StarTableViewController{
                starPickerViewController.rating = rating
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingImageView.image = imageForRating(rating: rating)
    }

}
