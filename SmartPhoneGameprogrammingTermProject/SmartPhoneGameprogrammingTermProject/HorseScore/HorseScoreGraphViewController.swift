//
//  HorseScoreGraphViewController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/06/02.
//

import UIKit
import SwiftUI

struct HospitalChart: View
{
    var posts: NSMutableArray
    
    var body: some View
    {
        VStack
        {
            // Text("개인 성적 그래프")
            HStack
            {
                HStack
                {
                    VStack
                    {
                        Spacer()
                        Text((self.posts[0] as! NSDictionary).value(forKey: "ord1CntT") as! NSString as String).font(.footnote).rotationEffect(.degrees(0)).offset(y: 0).zIndex(1)
                        
                        Rectangle().fill(Color.yellow).frame(width: 40, height: (Int((self.posts[0] as! NSDictionary).value(forKey: "ord1CntT") as! NSString as String)! < 1 ? 1 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord1CntT") as! NSString as String)! < 3 ? 3 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord1CntT") as! NSString as String)! < 8 ? 5 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord1CntT") as! NSString as String)! < 10 ? 8 : 9)))) * 10)
                        Text("통산 1착 횟수").font(.footnote).rotationEffect(.degrees(0))
                    }
                    VStack
                    {
                        Spacer()
                        Text((self.posts[0] as! NSDictionary).value(forKey: "ord2CntT") as! NSString as String).font(.footnote).rotationEffect(.degrees(0)).offset(y: 0).zIndex(1)
                        
                        Rectangle().fill(Color.yellow).frame(width: 40, height: (Int((self.posts[0] as! NSDictionary).value(forKey: "ord2CntT") as! NSString as String)! < 1 ? 1 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord2CntT") as! NSString as String)! < 3 ? 3 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord2CntT") as! NSString as String)! < 8 ? 5 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord2CntT") as! NSString as String)! < 10 ? 8 : 9)))) * 10)
                        Text("통산 2착 횟수").font(.footnote).rotationEffect(.degrees(0))
                    }
                    VStack
                    {
                        Spacer()
                        Text((self.posts[0] as! NSDictionary).value(forKey: "ord1CntY") as! NSString as String).font(.footnote).rotationEffect(.degrees(0)).offset(y: 0).zIndex(1)
                        
                        Rectangle().fill(Color.yellow).frame(width: 40, height: (Int((self.posts[0] as! NSDictionary).value(forKey: "ord1CntY") as! NSString as String)! < 1 ? 1 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord1CntY") as! NSString as String)! < 3 ? 3 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord1CntY") as! NSString as String)! < 8 ? 5 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord1CntY") as! NSString as String)! < 10 ? 8 : 9)))) * 10)
                        Text("최근 1착 횟수").font(.footnote).rotationEffect(.degrees(0))
                    }
                    VStack
                    {
                        Spacer()
                        Text((self.posts[0] as! NSDictionary).value(forKey: "ord2CntY") as! NSString as String).font(.footnote).rotationEffect(.degrees(0)).offset(y: 0).zIndex(1)
                        
                        Rectangle().fill(Color.yellow).frame(width: 40, height: (Int((self.posts[0] as! NSDictionary).value(forKey: "ord2CntY") as! NSString as String)! < 1 ? 1 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord2CntY") as! NSString as String)! < 3 ? 3 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord2CntY") as! NSString as String)! < 8 ? 5 : (Int((self.posts[0] as! NSDictionary).value(forKey: "ord2CntY") as! NSString as String)! < 10 ? 8 : 9)))) * 10)
                        Text("최근 2착 횟수").font(.footnote).rotationEffect(.degrees(0))
                    }
                    
                    VStack
                    {
                        Spacer()
                        Text((self.posts[0] as! NSDictionary).value(forKey: "rcCntT") as! NSString as String).font(.footnote).rotationEffect(.degrees(0)).offset(y: 0).zIndex(1)
                        
                        Rectangle().fill(Color.yellow).frame(width: 40, height: (Int((self.posts[0] as! NSDictionary).value(forKey: "rcCntT") as! NSString as String)! < 1 ? 1 : (Int((self.posts[0] as! NSDictionary).value(forKey: "rcCntT") as! NSString as String)! < 3 ? 3 : (Int((self.posts[0] as! NSDictionary).value(forKey: "rcCntT") as! NSString as String)! < 8 ? 5 : (Int((self.posts[0] as! NSDictionary).value(forKey: "rcCntT") as! NSString as String)! < 10 ? 8 : 9)))) * 10)
                        Text("총 출주 횟수").font(.footnote).rotationEffect(.degrees(0))
                    }
                    
                }
            }
        }
    }
}

struct HospitalInfo: View
{
    var posts: NSMutableArray
    var station: WeatherStation
    
    
    var body: some View
    {
        TabView
        {
            HospitalChart(posts: self.posts).tabItem({
                Image(systemName: "gamecontroller")
                Text("개인 성적 그래프")
            })
        }.frame(width: 400, height: 300)
    }
}


class HorseScoreGraphViewController: UIViewController, XMLParserDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    
    var url : String?
    
    var posts = NSMutableArray()
    
    var parser = XMLParser()
    
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var ord1CntT = NSMutableString()   // 통산 1착
    var ord2CntT = NSMutableString()   // 통산 2착
    //var winRateT = NSMutableString()   // 통산 승리
    
    var rcCntT = NSMutableString()   // 통산 출주 횟수
    var ord1CntY = NSMutableString()   // 최근 1착
    var ord2CntY = NSMutableString()   // 최근 2착
    //var winRateY = NSMutableString()   // 최근 승리
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url!))!)!
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if(elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            
            ord1CntT = NSMutableString()
            ord1CntT = ""
            
            ord2CntT = NSMutableString()
            ord2CntT = ""
            
            ord1CntY = NSMutableString()
            ord1CntY = ""
            
            ord2CntY = NSMutableString()
            ord2CntY = ""
            
            rcCntT = NSMutableString()
            rcCntT = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "ord1CntT"){
            ord1CntT.append(string)
        }
        else if element.isEqual(to: "ord2CntT")
        {
            ord2CntT.append(string)
        }
        else if element.isEqual(to: "ord1CntY")
        {
            ord1CntY.append(string)
        }
        else if element.isEqual(to: "ord2CntY")
        {
            ord2CntY.append(string)
        }
        else if element.isEqual(to: "rcCntT")
        {
            rcCntT.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if(elementName as NSString).isEqual(to: "item")
        {
            if !ord1CntT.isEqual(nil)
            {
                 elements.setObject(ord1CntT, forKey: "ord1CntT" as NSCopying)
                //posts.setObject(ord1CntT, forKey: "ord1CntT" as NSCopying)
            }
            if !ord2CntT.isEqual(nil)
            {
                elements.setObject(ord2CntT, forKey: "ord2CntT" as NSCopying)
                //posts.setObject(ord2CntT, forKey: "ord2CntT" as NSCopying)
            }
            if !ord1CntY.isEqual(nil)
            {
                elements.setObject(ord1CntY, forKey: "ord1CntY" as NSCopying)
                //posts.setObject(ord1CntY, forKey: "ord1CntY" as NSCopying)
            }
            if !ord2CntY.isEqual(nil)
            {
                elements.setObject(ord2CntY, forKey: "ord2CntY" as NSCopying)
                //posts.setObject(ord2CntY, forKey: "ord2CntY" as NSCopying)
            }
            if !rcCntT.isEqual(nil)
            {
                elements.setObject(rcCntT, forKey: "rcCntT" as NSCopying)
            }
            posts.add(elements)
            print(posts)
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        titleLabel.center.x -= view.bounds.width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        updateSwiftUI()
        
        UIView.animate(withDuration: 1.5, delay: 0.5,
                                   usingSpringWithDamping: 0.3,
                                   initialSpringVelocity: 0.5,
                                   options: [], animations: {
            self.titleLabel.center.x += self.view.bounds.width
            }, completion: nil)
    }
    
    func updateSwiftUI()
    {
        let stations = WeatherInformation()
        
        let swiftUIController = UIHostingController(rootView: HospitalInfo(posts: posts, station: (stations?.stations[0])!))
        
        addChild(swiftUIController)
        swiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(swiftUIController.view)
        
        swiftUIController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        swiftUIController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        swiftUIController.didMove(toParent: self)
    }
    
    
    
}

