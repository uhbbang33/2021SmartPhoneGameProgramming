//
//  HorseScoreTableViewController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/06/02.
//

import UIKit


class HorseScoreTableViewController: UITableViewController, XMLParserDelegate {
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    @IBOutlet var horseScoreTableView: UITableView!
    
    var horseName = NSMutableString()
    var horseNum = NSMutableString()
    
    var hrName = ""
    var hrName_utf8 = ""
    
    
    var keyword = ""
    var keyword_utf8 = ""
    
    var hrNum = ""
    
    @IBOutlet weak var numLabel: UILabel!
    
    
    let url = "http://apis.data.go.kr/B551015/API15/raceHorseResult?serviceKey=cTaPbuD%2BWjq4Q5oN5t7p8xIL%2BLnP8TUQWU5tQZfbIglvfqQ09w%2FOQ6IqOsKBTuJQCNtUMZnOl3zPnN99a5dnVA%3D%3D&numOfRows=300&hr_name="

    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
    }
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url + keyword_utf8))!)!
        parser.delegate = self
        parser.parse()
        horseScoreTableView!.reloadData()
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]){
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            horseName = NSMutableString()
            horseName = ""
            horseNum = NSMutableString()
            horseNum = ""
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String){
        if element.isEqual(to: "hrName"){
            horseName.append(string)
        }
        else if element.isEqual(to: "hrNo")
        {
            horseNum.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "item"){
            if !horseName.isEqual(nil)
            {
                elements.setObject(horseName, forKey: "hrName" as NSCopying)
            }
            if !horseNum.isEqual(nil)
            {
                elements.setObject(horseNum, forKey: "hrNo" as NSCopying)
            }
            posts.add(elements)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "hrName") as! NSString as String
        
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "hrNo") as! NSString as String
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if segue.identifier == "SegueToGraph" {
            if let cell = sender as? UITableViewCell{
                let indexPath = tableView.indexPath(for: cell)
            
                hrName = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "hrName") as! NSString as String
                
                hrNum = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "hrNo") as! NSString as String
                
                hrName_utf8 = hrName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            
                
                if let horseScoreGraphViewController = segue.destination as? HorseScoreGraphViewController{
                    horseScoreGraphViewController.url = url + hrName_utf8
                }
            }
        }
    }
}
