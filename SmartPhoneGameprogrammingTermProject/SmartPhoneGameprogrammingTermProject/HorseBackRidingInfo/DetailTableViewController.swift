//
//  DetailTableViewController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/06/07.
//

import UIKit

class DetailTableViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet var tb: UITableView!
    var url : String?
    
    var parser = XMLParser()
    
    let postsname : [String] = ["사업장명", "사업장주소", "대표자명", "대표자이메일", "대표자전화번호", "휴무일", "운영시간",  "승마장유형", "대표코치", "마필보유두수", "실무자명"]
    
    var posts : [String] = ["","","","","","","","","","",""]
    
    var element = NSString()
    
    var bsshNm = NSMutableString()
    var bsshAddr1 = NSMutableString()
    var rprsntvNm = NSMutableString()
    var rprsntvEmail = NSMutableString()
    var rprsntvPhone = NSMutableString()
    var rstde = NSMutableString()
    var operationTime = NSMutableString()
    var hrareatynm = NSMutableString()
    var reprsntcoach = NSMutableString()
    var hresum = NSMutableString()
    var staffnm = NSMutableString()
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url!))!)!
        parser.delegate = self
        parser.parse()
        tb!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "item")
        {
            posts = ["","","","","","","","","","",""]
            
            bsshNm = NSMutableString()
            bsshNm = ""
            bsshAddr1 = NSMutableString()
            bsshAddr1 = ""
            rprsntvNm = NSMutableString()
            rprsntvNm = ""
            rprsntvEmail = NSMutableString()
            rprsntvEmail = ""
            rprsntvPhone = NSMutableString()
            rprsntvPhone = ""
            rstde = NSMutableString()
            rstde = ""
            operationTime = NSMutableString()
            operationTime = ""
            hrareatynm = NSMutableString()
            hrareatynm = ""
            reprsntcoach = NSMutableString()
            reprsntcoach = ""
            hresum = NSMutableString()
            hresum = ""
            staffnm = NSMutableString()
            staffnm = ""
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "bsshNm"){
            bsshNm.append(string)
        } else if element.isEqual(to: "bsshAddr1"){
            bsshAddr1.append(string)
        }else if element.isEqual(to: "rprsntvNm"){
            rprsntvNm.append(string)
        }else if element.isEqual(to: "rprsntvEmail"){
            rprsntvEmail.append(string)
        }else if element.isEqual(to: "rprsntvPhone"){
            rprsntvPhone.append(string)
        }else if element.isEqual(to: "rstde"){
            rstde.append(string)
        }else if element.isEqual(to: "operationTime"){
            operationTime.append(string)
        }else if element.isEqual(to: "hrareatynm"){
            hrareatynm.append(string)
        }else if element.isEqual(to: "reprsntcoach"){
            reprsntcoach.append(string)
        }else if element.isEqual(to: "hresum"){
            hresum.append(string)
        }else if element.isEqual(to: "staffnm"){
            staffnm.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if(elementName as NSString).isEqual(to: "item"){
            if !bsshNm.isEqual(nil){
                posts[0] = bsshNm as String
            }
            if !bsshAddr1.isEqual(nil){
                posts[1] = bsshAddr1 as String
            }
            if !rprsntvNm.isEqual(nil){
                posts[2] = rprsntvNm as String
            }
            if !rprsntvEmail.isEqual(nil){
                posts[3] = rprsntvEmail as String
            }
            if !rprsntvPhone.isEqual(nil){
                posts[4] = rprsntvPhone as String
            }
            if !rstde.isEqual(nil){
                posts[5] = rstde as String
            }
            if !operationTime.isEqual(nil){
                posts[6] = operationTime as String
            }
            if !hrareatynm.isEqual(nil){
                posts[7] = hrareatynm as String
            }
            if !reprsntcoach.isEqual(nil){
                posts[8] = reprsntcoach as String
            }
            if !hresum.isEqual(nil){
                posts[9] = hresum as String
            }
            if !staffnm.isEqual(nil){
                posts[10] = staffnm as String
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsname.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
        cell.textLabel?.text = postsname[indexPath.row]
        cell.detailTextLabel?.text = posts[indexPath.row]
        return cell
    }

}
