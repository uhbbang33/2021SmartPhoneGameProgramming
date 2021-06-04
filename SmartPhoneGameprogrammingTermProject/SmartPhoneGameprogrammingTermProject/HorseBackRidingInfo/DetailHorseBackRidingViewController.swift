
import UIKit
import MapKit

class DetailHorseBackRidingViewController: UIViewController, /*XMLParserDelegate,*/ UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var tb: UITableView!
    
    var url : String?
    
    var parser = XMLParser()
    
    let postsname : [String] = ["승마장일련번호", "사업장명", "사업장주소", "사업장상세주소", "대표자명", "대표자이메일", "대표자전화번호", "휴무일", "홈페이지", "운영시간", "사업자등록번호", "승마장유형", "협력승마시설유형", "대표코치", "마핑보유두수", "교육프로그램", "참여프로그램","보험만료일", "승마장소개글", "실무자명"]
    
    var posts : [String] = ["","","","","","","","","","","","","","","","","","","",""]
    
    var element = NSString()
    
    var hraSeq = NSMutableString()
    var bsshNm = NSMutableString()
    var bsshAddr1 = NSMutableString()
    var bsshAddr2 = NSMutableString()
    var rprsntvNm = NSMutableString()
    var rprsntvEmail = NSMutableString()
    var rprsntvPhone = NSMutableString()
    var rstde = NSMutableString()
    var homepage = NSMutableString()
    var operationTime = NSMutableString()
    var bizregnum = NSMutableString()
    var hrareatynm = NSMutableString()
    var corprHrridingFcltyTyText = NSMutableString()
    var reprsntcoach = NSMutableString()
    var hresum = NSMutableString()
    var edcProgrmText = NSMutableString()
    var ptnProgrmText = NSMutableString()
    var insrexprndt = NSMutableString()
    var hrareaintrcnsntnc = NSMutableString()
    var staffnm = NSMutableString()
    
    
    func addPost(){
                    if !hraSeq.isEqual(nil){
                        posts[0] = hraSeq as String
                    }
                    if !bsshNm.isEqual(nil){
                        posts[1] = bsshNm as String
                    }
                    if !bsshAddr1.isEqual(nil){
                        posts[2] = bsshAddr1 as String
                    }
                    if !bsshAddr2.isEqual(nil){
                        posts[3] = bsshAddr2 as String
                    }
                    if !rprsntvNm.isEqual(nil){
                        posts[4] = rprsntvNm as String
                    }
                    if !rprsntvEmail.isEqual(nil){
                        posts[5] = rprsntvEmail as String
                    }
                    if !rprsntvPhone.isEqual(nil){
                        posts[6] = rprsntvPhone as String
                    }
                    if !rstde.isEqual(nil){
                        posts[7] = rstde as String
                    }
                    if !homepage.isEqual(nil){
                        posts[8] = homepage as String
                    }
                    if !operationTime.isEqual(nil){
                        posts[9] = operationTime as String
                    }
                    if !bizregnum.isEqual(nil){
                        posts[10] = bizregnum as String
                    }
                    if !hrareatynm.isEqual(nil){
                        posts[11] = hrareatynm as String
                    }
                    if !corprHrridingFcltyTyText.isEqual(nil){
                        posts[12] = corprHrridingFcltyTyText as String
                    }
                    if !reprsntcoach.isEqual(nil){
                        posts[13] = reprsntcoach as String
                    }
                    if !hresum.isEqual(nil){
                        posts[14] = hresum as String
                    }
                    if !edcProgrmText.isEqual(nil){
                        posts[15] = edcProgrmText as String
                    }
                    if !ptnProgrmText.isEqual(nil){
                        posts[16] = ptnProgrmText as String
                    }
                    if !insrexprndt.isEqual(nil){
                        posts[17] = insrexprndt as String
                    }
                    if !hrareaintrcnsntnc.isEqual(nil){
                        posts[18] = hrareaintrcnsntnc as String
                    }
                    if !staffnm.isEqual(nil){
                        posts[19] = staffnm as String
                    }
    }
//    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
//    {
//        element = elementName as NSString
//        if(elementName as NSString).isEqual(to: "item")
//        {
//            posts = ["","","","","","","","","","","","","","","","","","","",""]
//
//            hraSeq = NSMutableString()
//            hraSeq = ""
//            bsshNm = NSMutableString()
//            bsshNm = ""
//            bsshAddr1 = NSMutableString()
//            bsshAddr1 = ""
//            bsshAddr2 = NSMutableString()
//            bsshAddr2 = ""
//            rprsntvNm = NSMutableString()
//            rprsntvNm = ""
//            rprsntvEmail = NSMutableString()
//            rprsntvEmail = ""
//            rprsntvPhone = NSMutableString()
//            rprsntvPhone = ""
//            rstde = NSMutableString()
//            rstde = ""
//            homepage = NSMutableString()
//            homepage = ""
//            operationTime = NSMutableString()
//            operationTime = ""
//            bizregnum = NSMutableString()
//            bizregnum = ""
//            hrareatynm = NSMutableString()
//            hrareatynm = ""
//            corprHrridingFcltyTyText = NSMutableString()
//            corprHrridingFcltyTyText = ""
//            reprsntcoach = NSMutableString()
//            reprsntcoach = ""
//            hresum = NSMutableString()
//            hresum = ""
//            edcProgrmText = NSMutableString()
//            edcProgrmText = ""
//            ptnProgrmText = NSMutableString()
//            ptnProgrmText = ""
//            insrexprndt = NSMutableString()
//            insrexprndt = ""
//            hrareaintrcnsntnc = NSMutableString()
//            hrareaintrcnsntnc = ""
//            staffnm = NSMutableString()
//            staffnm = ""
//        }
//    }
//
//    func parser(_ parser: XMLParser, foundCharacters string: String)
//    {
//        if element.isEqual(to: "hraSeq"){
//            hraSeq.append(string)
//        } else if element.isEqual(to: "bsshNm"){
//            bsshNm.append(string)
//        }else if element.isEqual(to: "bsshAddr1"){
//            bsshAddr1.append(string)
//        }else if element.isEqual(to: "bsshAddr2"){
//            bsshAddr2.append(string)
//        }else if element.isEqual(to: "rprsntvNm"){
//            rprsntvNm.append(string)
//        }else if element.isEqual(to: "rprsntvEmail"){
//            rprsntvEmail.append(string)
//        }else if element.isEqual(to: "rprsntvPhone"){
//            rprsntvPhone.append(string)
//        }else if element.isEqual(to: "rstde"){
//            rstde.append(string)
//        }else if element.isEqual(to: "homepage"){
//            homepage.append(string)
//        }else if element.isEqual(to: "operationTime"){
//            operationTime.append(string)
//        }else if element.isEqual(to: "bizregnum"){
//            bizregnum.append(string)
//        }else if element.isEqual(to: "hrareatynm"){
//            hrareatynm.append(string)
//        }else if element.isEqual(to: "corprHrridingFcltyTyText"){
//            corprHrridingFcltyTyText.append(string)
//        }else if element.isEqual(to: "reprsntcoach"){
//            reprsntcoach.append(string)
//        }else if element.isEqual(to: "hresum"){
//            hresum.append(string)
//        }else if element.isEqual(to: "edcProgrmText"){
//            edcProgrmText.append(string)
//        }else if element.isEqual(to: "ptnProgrmText"){
//            ptnProgrmText.append(string)
//        }else if element.isEqual(to: "insrexprndt"){
//            insrexprndt.append(string)
//        }else if element.isEqual(to: "hrareaintrcnsntnc"){
//            hrareaintrcnsntnc.append(string)
//        }else if element.isEqual(to: "staffnm"){
//            staffnm.append(string)
//        }
//    }
//
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
//    {
//        if(elementName as NSString).isEqual(to: "item"){
//            if !hraSeq.isEqual(nil){
//                posts[0] = hraSeq as String
//            }
//            if !bsshNm.isEqual(nil){
//                posts[1] = bsshNm as String
//            }
//            if !bsshAddr1.isEqual(nil){
//                posts[2] = bsshAddr1 as String
//            }
//            if !bsshAddr2.isEqual(nil){
//                posts[3] = bsshAddr2 as String
//            }
//            if !rprsntvNm.isEqual(nil){
//                posts[4] = rprsntvNm as String
//            }
//            if !rprsntvEmail.isEqual(nil){
//                posts[5] = rprsntvEmail as String
//            }
//            if !rprsntvPhone.isEqual(nil){
//                posts[6] = rprsntvPhone as String
//            }
//            if !rstde.isEqual(nil){
//                posts[7] = rstde as String
//            }
//            if !homepage.isEqual(nil){
//                posts[8] = homepage as String
//            }
//            if !operationTime.isEqual(nil){
//                posts[9] = operationTime as String
//            }
//            if !bizregnum.isEqual(nil){
//                posts[10] = bizregnum as String
//            }
//            if !hrareatynm.isEqual(nil){
//                posts[11] = hrareatynm as String
//            }
//            if !corprHrridingFcltyTyText.isEqual(nil){
//                posts[12] = corprHrridingFcltyTyText as String
//            }
//            if !reprsntcoach.isEqual(nil){
//                posts[13] = reprsntcoach as String
//            }
//            if !hresum.isEqual(nil){
//                posts[14] = hresum as String
//            }
//            if !edcProgrmText.isEqual(nil){
//                posts[15] = edcProgrmText as String
//            }
//            if !ptnProgrmText.isEqual(nil){
//                posts[16] = ptnProgrmText as String
//            }
//            if !insrexprndt.isEqual(nil){
//                posts[17] = insrexprndt as String
//            }
//            if !hrareaintrcnsntnc.isEqual(nil){
//                posts[18] = hrareaintrcnsntnc as String
//            }
//            if !staffnm.isEqual(nil){
//                posts[19] = staffnm as String
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //beginParsing()
        addPost()
        
        tb.delegate = self
        tb.dataSource = self
    }
    
//    func beginParsing()
//    {
//        posts = []
//        parser = XMLParser(contentsOf: (URL(string: url!))!)!
//        parser.delegate = self
//        parser.parse()
//
//        tb!.reloadData()
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsname.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = postsname[indexPath.row]
        cell.detailTextLabel?.text = posts[indexPath.row]
        return cell
    }
}

