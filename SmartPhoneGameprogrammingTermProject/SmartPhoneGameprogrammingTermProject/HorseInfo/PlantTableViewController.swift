//
//  SearchHorseInfo.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/05/19.
//

import UIKit

class PlantTableViewController: UITableViewController, XMLParserDelegate {
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var horseName = NSMutableString()
    var horseBirthday = NSMutableString()
    
    var hrName = ""
    var hrName_utf8 = ""
    
    var keyword = ""
    var keyword_utf8 = ""
    
    @IBOutlet weak var searchKeyword: UITextField!
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        keyword = searchKeyword.text!
        keyword_utf8 = keyword.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        
        beginParsing()
    }
    
    @IBAction func doneToTableViewController(segue: UIStoryboardSegue){
        
    }
    
    @IBOutlet weak var plantInfoTbData: UITableView!
    //@IBOutlet weak var plantInfoTBData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
    }
    
    let url = "http://openapi.nature.go.kr/openapi/service/rest/PlantService/plntIlstrSearch?serviceKey=cTaPbuD%2BWjq4Q5oN5t7p8xIL%2BLnP8TUQWU5tQZfbIglvfqQ09w%2FOQ6IqOsKBTuJQCNtUMZnOl3zPnN99a5dnVA%3D%3D&numOfRows=20&sw="
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url + keyword_utf8))!)!
        parser.delegate = self
        parser.parse()
        plantInfoTbData!.reloadData()
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
        if element.isEqual(to: "plantGnrlNm"){
            horseName.append(string)
        } else if element.isEqual(to: "familyKorNm"){
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "name") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "date") as! NSString as String
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "SegueToHorseDetail" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                hrName = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "name") as! NSString as String
                
                hrName_utf8 = hrName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                
                if let plantDetailTableViewController = segue.destination as? PlantDetailTableViewController{
                    plantDetailTableViewController.url = url + "&sw=" + hrName_utf8 + "&st=3"
                }
            }
        }
    }
}
