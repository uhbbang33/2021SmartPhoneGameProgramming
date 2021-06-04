import UIKit
import Foundation
import Speech

class HorseInfoTableViewController: UITableViewController, XMLParserDelegate {
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

    @IBOutlet weak var horseInfoTBData: UITableView!
    
    @IBOutlet weak var searchKeyword: UITextField!
    
    @IBOutlet weak var micButton: UIBarButtonItem!
    
    @IBAction func micButtonPressed(_ sender: Any) {
        if audioEngine.isRunning{
            audioEngine.stop()
            speechRecognitionRequest?.endAudio()
            micButton.tintColor = UIColor.blue
        }else{
            try! startSession()
            micButton.tintColor = UIColor.black
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        keyword = searchKeyword.text!
        keyword_utf8 = keyword.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        beginParsing()
    }
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))!
    private var speechRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var speechRecognitionTask: SFSpeechRecognitionTask?
    
    private let audioEngine = AVAudioEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
        authorizeSR()
    }
    
    let url = "http://apis.data.go.kr/B551015/API8/raceHorseInfo?serviceKey=cTaPbuD%2BWjq4Q5oN5t7p8xIL%2BLnP8TUQWU5tQZfbIglvfqQ09w%2FOQ6IqOsKBTuJQCNtUMZnOl3zPnN99a5dnVA%3D%3D&numOfRows=20&pageNo=1&hr_name="
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url + keyword_utf8 ))!)!
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
    
    func authorizeSR(){
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation{
                switch authStatus{
                case .authorized:
                    self.micButton.isEnabled = true
                case .denied:
                    self.micButton.isEnabled = false
                case .restricted:
                    self.micButton.isEnabled = false
                case .notDetermined:
                    self.micButton.isEnabled = false
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
                self.searchKeyword.text = result.bestTranscription.formattedString
                finished = result.isFinal
            }
            
            if error != nil || finished{
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.speechRecognitionRequest = nil
                self.speechRecognitionTask = nil
                
                self.micButton.isEnabled = true
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
        if segue.identifier == "segueToHorseDetail" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                hrName = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey: "name") as! NSString as String
                
                hrName_utf8 = hrName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                
                if let horseInfoDetailTableViewController = segue.destination as? HorseInfoDetailTableViewController{
                    horseInfoDetailTableViewController.url = url + hrName_utf8
                }
            }
        }
        
    }
}
