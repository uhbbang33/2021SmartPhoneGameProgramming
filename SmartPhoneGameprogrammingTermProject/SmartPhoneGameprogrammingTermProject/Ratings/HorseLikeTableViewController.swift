//
//  HorseLikeTableViewController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/06/08.
//

import UIKit

class HorseLikeTableViewController: UITableViewController {
    var horses: [Horse] = horsesData
    
    var keyword = ""
    var keyword_utf8 = ""
    
    @IBOutlet var tb: UITableView!
    
    var audioController: AudioController

    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioController.playerEffect(name: SoundFlip)

    }
    
    @IBAction func cancelToHorsesViewController(segue: UIStoryboardSegue){
    }
    @IBAction func saveToHorseDetail(segue: UIStoryboardSegue){
        if let horseDetailsViewController = segue.source as? HorseRatingDetailsTableViewController{
            if let horse = horseDetailsViewController.horse{
                horses.append(horse)
                
                let indexPath = IndexPath(row: horses.count - 1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HorseCell", for: indexPath) as! HorseTableViewCell
        
        let horse = horses[indexPath.row] as Horse
        cell.horse = horse
        //cell.textLabel?.text = horse.name
        //cell.detailTextLabel?.text = horse.rating

//        if let nameLabel = cell.viewWithTag(100) as? UILabel{
//            nameLabel.text = horse.name
//        }
//        if let ratingImageView = cell.viewWithTag(102) as? UIImageView{
//            ratingImageView.image = self.imageForRating(rating: horse.rating)
//        }

        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.identifier == "SegueToDetail" {
//            if let cell = sender as? UITableViewCell {
//                //let indexPath = tableView.indexPath(for: cell)
//
//                keyword = tb.cellForRowAtIndexPath(sender.indexPath) as!
//                keyword_utf8 = keyword.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
//
//                if let horseInfoDetailTableViewController = segue.destination as? HorseInfoDetailTableViewController{
//                    horseInfoDetailTableViewController.url = "http://apis.data.go.kr/B551015/API8/raceHorseInfo?serviceKey=cTaPbuD%2BWjq4Q5oN5t7p8xIL%2BLnP8TUQWU5tQZfbIglvfqQ09w%2FOQ6IqOsKBTuJQCNtUMZnOl3zPnN99a5dnVA%3D%3D&numOfRows=20&pageNo=1&hr_name=" + keyword_utf8
//                }
//            }
//        }
//    }
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
