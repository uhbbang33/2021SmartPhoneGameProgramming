import UIKit

class PlantDetailTableViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet var detailTableView: UITableView!
    
    var url : String?
    
    var parser = XMLParser()
    
    let postsname : [String] = ["상세정보유무", "과국명", "과명", "속국명", "속명", "비추천명", "국명"]
    
    var posts : [String] = ["","","","","","",""]
    
    var element = NSString()
    
    var detailYn = NSMutableString()
    var familyKorNm = NSMutableString()
    var familyNm = NSMutableString()
    var genusKorNm = NSMutableString()
    var genusNm = NSMutableString()
    var notRcmmGnrlNm = NSMutableString()
    var plantGnrlNm = NSMutableString()
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url!))!)!
        parser.delegate = self
        parser.parse()
        detailTableView!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "item")
        {
            posts = ["","","","","","","","","","","","","",""]
            
            detailYn = NSMutableString()
            detailYn = ""
            familyKorNm = NSMutableString()
            familyKorNm = ""
            familyNm = NSMutableString()
            familyNm = ""
            genusKorNm = NSMutableString()
            genusKorNm = ""
            genusNm = NSMutableString()
            genusNm = ""
            notRcmmGnrlNm = NSMutableString()
            notRcmmGnrlNm = ""
            plantGnrlNm = NSMutableString()
            plantGnrlNm = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "detailYn"){
            detailYn.append(string)
        } else if element.isEqual(to: "familyKorNm"){
            familyKorNm.append(string)
        }else if element.isEqual(to: "familyNm"){
            familyNm.append(string)
        }else if element.isEqual(to: "genusKorNm"){
            genusKorNm.append(string)
        }else if element.isEqual(to: "genusNm"){
            genusNm.append(string)
        }else if element.isEqual(to: "notRcmmGnrlNm"){
            notRcmmGnrlNm.append(string)
        }else if element.isEqual(to: "plantGnrlNm"){
            plantGnrlNm.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if(elementName as NSString).isEqual(to: "item"){
            if !detailYn.isEqual(nil){
                posts[0] = detailYn as String
            }
            if !familyKorNm.isEqual(nil){
                posts[1] = familyKorNm as String
            }
            if !familyNm.isEqual(nil){
                posts[2] = familyNm as String
            }
            if !genusKorNm.isEqual(nil){
                posts[3] = genusKorNm as String
            }
            if !genusNm.isEqual(nil){
                posts[4] = genusNm as String
            }
            if !notRcmmGnrlNm.isEqual(nil){
                posts[5] = notRcmmGnrlNm as String
            }
            if !plantGnrlNm.isEqual(nil){
                posts[6] = plantGnrlNm as String
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beginParsing()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postsname.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
        cell.textLabel?.text = postsname[indexPath.row]
        cell.detailTextLabel?.text = posts[indexPath.row]
        return cell
    }

}

