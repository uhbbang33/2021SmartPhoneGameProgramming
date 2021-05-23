//
//  SearchHorseInfo.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/05/19.
//

import UIKit

class SearchHorseRecord: UIViewController, XMLParserDelegate, UITableViewDataSource {
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var horseName = NSMutableString()
    var horseAge = NSMutableString()

    @IBOutlet weak var tbData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
    }
    
    let url = "http://apis.data.go.kr/B551015/API15/raceHorseResult"
    let key = "cTaPbuD%2BWjq4Q5oN5t7p8xIL%2BLnP8TUQWU5tQZfbIglvfqQ09w%2FOQ6IqOsKBTuJQCNtUMZnOl3zPnN99a5dnVA%3D%3D"

    // parser오브젝트 초기화하고 NSXMLParserDelegate로 설정하고 XML 파싱 시작
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url + "?serviceKey=" + key))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
    }

    // parser가 새로운 element를 발견하면 변수를 생성한다.
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]){
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            horseName = NSMutableString()
            horseName = ""
            horseAge = NSMutableString()
            horseAge = ""
        }
    }
    
    // 말 이름과 나이를 발견하면 horseName과 horseAge에 넣는다.
    func parser(_ parser: XMLParser, foundCharacters string: String){
        if element.isEqual(to: "hrName"){
            horseName.append(string)
        } else if element.isEqual(to: "age"){
            horseAge.append(string)
        }
    }
    
    // element의 끝에서 feed데이터를 dictionary에 저장
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "item"){
            if !horseName.isEqual(nil)
            {
                elements.setObject(horseName, forKey: "title" as NSCopying)
            }
            if !horseAge.isEqual(nil){
                elements.setObject(horseAge, forKey: "date" as NSCopying)
            }
            posts.add(elements)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "title") as! NSString as String
        cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "date") as! NSString as String
        
        return cell
    }
}
