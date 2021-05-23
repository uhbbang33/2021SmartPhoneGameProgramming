//
//  SearchHorseInfo.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/05/19.
//

import UIKit

class HorseInfoTableView: UIViewController, XMLParserDelegate, UITableViewDataSource {
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var horseName = NSMutableString()
    var horseBirthday = NSMutableString()
    
    var hrName = ""
    var hrName_utf8 = ""

//    @IBAction func doneToTableViewController(segue: segueToHorseInfoDetail){
//    }
    
    @IBOutlet weak var horseInfoTBData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
    }
    
    let addr = "http://apis.data.go.kr/B551015/API8/raceHorseInfo"
    let key = "cTaPbuD%2BWjq4Q5oN5t7p8xIL%2BLnP8TUQWU5tQZfbIglvfqQ09w%2FOQ6IqOsKBTuJQCNtUMZnOl3zPnN99a5dnVA%3D%3D"
    let others = "?numOfRows=10&pageNo=1"

    var url : String?
    
    func beginParsing()
    {
        url = addr + others + "&serviceKey=" + key
        posts = []
        parser = XMLParser(contentsOf: (URL(string: addr + others + "&serviceKey=" + key ))!)!
        parser.delegate = self
        parser.parse()
        horseInfoTBData!.reloadData()
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]){
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            horseName = NSMutableString()
            horseName = ""
            horseBirthday = NSMutableString()
            horseBirthday = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String){
        if element.isEqual(to: "hrName"){
            horseName.append(string)
        } else if element.isEqual(to: "birthday"){
            horseBirthday.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "item"){
            if !horseName.isEqual(nil)
            {
                elements.setObject(horseName, forKey: "name" as NSCopying)
            }
            if !horseBirthday.isEqual(nil){
                elements.setObject(horseBirthday, forKey: "date" as NSCopying)
            }
            posts.add(elements)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "name") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "date") as! NSString as String
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToDetailInfo" {
            if let navController = segue.destination as? UINavigationController{
                if let horseInfoTableviewController = navController.topViewController as? HorseInfoDetailTableViewController {
                    horseInfoTableviewController.hrName = hrName as! NSMutableString
                }
            }
        }
        
        
//        if segue.identifier == "segueToHorseInfoDetail"{
//            if let cell = sender as? UITableViewCell{   // cell?
//                let indexPath = tableView.indexPath(for: cell)
//                hrName = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forkey:"name") as! NSString as String
//
//                hrName_utf8 = hrName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlUserAllowed)!
//                if let horseInfoTableViewController = segue.destination as? HorseInfoTableViewController{
//                    horseInfoTableViewController.url = url + "&name=" + hrName_utf8
//                }
//
//            }
//        }
    }
}

