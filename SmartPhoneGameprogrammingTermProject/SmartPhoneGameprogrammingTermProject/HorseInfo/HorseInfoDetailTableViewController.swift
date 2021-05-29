import UIKit

class HorseInfoDetailTableViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet var detailTableView: UITableView!
    
    var url : String?
    
    var parser = XMLParser()
    
    let postsname : [String] = ["마명", "마번", "출생지", "성별", "생년월일", "등급", "조교사명", "조교사번호", "마주명", "마주번호", "부마명", "부마번", "모마명", "모마번"]
    
    var posts : [String] = ["","","","","","","","","","","","","",""]
    
    var element = NSString()
    
    var hrName = NSMutableString()
    var hrNo = NSMutableString()
    var name = NSMutableString()
    var sex = NSMutableString()
    var birthday = NSMutableString()
    var rank = NSMutableString()
    var trName = NSMutableString()
    var trNo = NSMutableString()
    var owName = NSMutableString()
    var owNo = NSMutableString()
    var faHrName = NSMutableString()
    var faHrNo = NSMutableString()
    var moHrName = NSMutableString()
    var moHrNo = NSMutableString()
    
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
            
            hrName = NSMutableString()
            hrName = ""
            hrNo = NSMutableString()
            hrNo = ""
            name = NSMutableString()
            name = ""
            sex = NSMutableString()
            sex = ""
            birthday = NSMutableString()
            birthday = ""
            rank = NSMutableString()
            rank = ""
            trName = NSMutableString()
            trName = ""
            trNo = NSMutableString()
            trNo = ""
            owName = NSMutableString()
            owName = ""
            owNo = NSMutableString()
            owNo = ""
            faHrName = NSMutableString()
            faHrName = ""
            faHrNo = NSMutableString()
            faHrNo = ""
            moHrName = NSMutableString()
            moHrName = ""
            moHrNo = NSMutableString()
            moHrNo = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "hrName"){
            hrName.append(string)
        } else if element.isEqual(to: "hrNo"){
            hrNo.append(string)
        }else if element.isEqual(to: "name"){
            name.append(string)
        }else if element.isEqual(to: "sex"){
            sex.append(string)
        }else if element.isEqual(to: "birthday"){
            birthday.append(string)
        }else if element.isEqual(to: "rank"){
            rank.append(string)
        }else if element.isEqual(to: "trName"){
            trName.append(string)
        }else if element.isEqual(to: "trNo"){
            trNo.append(string)
        }else if element.isEqual(to: "owName"){
            owName.append(string)
        }else if element.isEqual(to: "owNo"){
            owNo.append(string)
        }else if element.isEqual(to: "faHrName"){
            faHrName.append(string)
        }else if element.isEqual(to: "faHrNo"){
            faHrNo.append(string)
        }else if element.isEqual(to: "moHrName"){
            moHrName.append(string)
        }else if element.isEqual(to: "moHrNo"){
            moHrNo.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if(elementName as NSString).isEqual(to: "item"){
            if !hrName.isEqual(nil){
                posts[0] = hrName as String
            }
            if !hrNo.isEqual(nil){
                posts[1] = hrNo as String
            }
            if !name.isEqual(nil){
                posts[2] = name as String
            }
            if !sex.isEqual(nil){
                posts[3] = sex as String
            }
            if !birthday.isEqual(nil){
                posts[4] = birthday as String
            }
            if !rank.isEqual(nil){
                posts[5] = rank as String
            }
            if !trName.isEqual(nil){
                posts[6] = trName as String
            }
            if !trNo.isEqual(nil){
                posts[7] = trNo as String
            }
            if !owName.isEqual(nil){
                posts[8] = owName as String
            }
            if !owNo.isEqual(nil){
                posts[9] = owNo as String
            }
            if !faHrName.isEqual(nil){
                posts[10] = faHrName as String
            }
            if !faHrNo.isEqual(nil){
                posts[11] = faHrNo as String
            }
            if !moHrName.isEqual(nil){
                posts[12] = moHrName as String
            }
            if !moHrNo.isEqual(nil){
                posts[13] = moHrNo as String
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beginParsing()
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

