//
//  HorseScoreTableViewController.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/06/02.
//

import UIKit
import Foundation
import Speech

class HorseScoreTableViewController: UITableViewController, XMLParserDelegate {
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    @IBOutlet var horseScoreTableView: UITableView!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mic: UIBarButtonItem!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    @IBOutlet weak var runImage: UIImageView!
    
    var horseName = NSMutableString()
    var horseNum = NSMutableString()
    
    var hrName = ""
    var hrName_utf8 = ""
    
    
    var keyword = ""
    var keyword_utf8 = ""
    
    var hrNum = ""
    
    var audioController: AudioController

    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    
    @IBAction func micButtonPressed(_ sender: Any) {
        if audioEngine.isRunning{
            audioEngine.stop()
            speechRecognitionRequest?.endAudio()
            mic.tintColor = UIColor.blue
        }else{
            try! startSession()
            mic.tintColor = UIColor.black
        }
    }
    @IBAction func searchButtonPressed(_ sender: Any) {
        keyword = searchTextField.text!
        keyword_utf8 = keyword.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        beginParsing()
    }
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))!
    private var speechRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var speechRecognitionTask: SFSpeechRecognitionTask?
    
    private let audioEngine = AVAudioEngine()
    
    
    let url = "http://apis.data.go.kr/B551015/API15/raceHorseResult?serviceKey=cTaPbuD%2BWjq4Q5oN5t7p8xIL%2BLnP8TUQWU5tQZfbIglvfqQ09w%2FOQ6IqOsKBTuJQCNtUMZnOl3zPnN99a5dnVA%3D%3D&numOfRows=400&hr_name="

    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        
        setupImageViewAnimation()
        //runImage.animationRepeatCount = 10
        runImage.animationDuration = 1.0
        runImage.startAnimating()
        
        audioController.playerEffect(name: SoundFlip)

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

        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String){
        if element.isEqual(to: "hrName"){
            horseName.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "item"){
            if !horseName.isEqual(nil)
            {
                elements.setObject(horseName, forKey: "hrName" as NSCopying)
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
        

        return cell
    }
    
    func authorizeSR(){
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation{
                switch authStatus{
                case .authorized:
                    self.mic.isEnabled = true
                case .denied:
                    self.mic.isEnabled = false
                case .restricted:
                    self.mic.isEnabled = false
                case .notDetermined:
                    self.mic.isEnabled = false
                }
            }
        }
    }
    
    func startSession() throws {
        if let recognitionTask = speechRecognitionTask{
            recognitionTask.cancel()
            self.speechRecognitionTask = nil
        }
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(AVAudioSession.Category.record)
        
        speechRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let recognitionRequest = speechRecognitionRequest else{
            fatalError("SFSpeechAudioBufferRecognitionRequest object creation failed")
        }
        
        let inputNode = audioEngine.inputNode
        recognitionRequest.shouldReportPartialResults = true
        
        speechRecognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest){result, error in
            var finished = false
            
            if let result = result{
                self.searchTextField.text = result.bestTranscription.formattedString
                finished = result.isFinal
            }
            
            if error != nil || finished{
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.speechRecognitionRequest = nil
                self.speechRecognitionTask = nil
                
                self.mic.isEnabled = true
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat){
            (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.speechRecognitionRequest?.append(buffer)
        }
        audioEngine.prepare()
        try audioEngine.start()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if segue.identifier == "SegueToGraph" {
            if let cell = sender as? UITableViewCell{
                let indexPath = tableView.indexPath(for: cell)
            
                hrName = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "hrName") as! NSString as String
                

                
                hrName_utf8 = hrName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            
                
                if let horseScoreGraphViewController = segue.destination as? HorseScoreGraphViewController{
                    horseScoreGraphViewController.url = url + hrName_utf8
                }
            }
        }
    }
    
    private func setupImageViewAnimation() {
        runImage.animationImages = [#imageLiteral(resourceName: "horse1.png"), #imageLiteral(resourceName: "horse2.png"), #imageLiteral(resourceName: "horse3.png"), #imageLiteral(resourceName: "horse4.png"), #imageLiteral(resourceName: "horse5.png"), #imageLiteral(resourceName: "horse6.png"), #imageLiteral(resourceName: "horse7.png"), #imageLiteral(resourceName: "horse8.png"),#imageLiteral(resourceName: "horse9.png"), #imageLiteral(resourceName: "horse10.png"), #imageLiteral(resourceName: "horse11.png"), #imageLiteral(resourceName: "horse12.png")]

    }
    
   
}
