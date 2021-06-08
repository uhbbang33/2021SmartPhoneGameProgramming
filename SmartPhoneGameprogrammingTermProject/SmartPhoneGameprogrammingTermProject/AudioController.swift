//
//  AudioController.swift
//  12_Black Jack
//
//  Created by  kpugame on 2021/05/31.
//

import AVFoundation
let SoundFlip = "cardFlip1.wav"
let SoundAgain = "ding.wav"
let SoundLose = "wrong.wav"
let SoundWin = "win.wav"
let SoundChip = "chip.wav"
let AudioEffectFiles = [SoundFlip, SoundAgain, SoundLose, SoundWin, SoundChip]

class AudioController{
    private var audio = [String: AVAudioPlayer]()
    
    var player: AVAudioPlayer?
    
    func preloadAudioEffects(audioFileNames: [String]) {
        for effect in AudioEffectFiles{
            let soundPath = Bundle.main.path(forResource: effect, ofType: nil)
            let soundURL = NSURL.fileURL(withPath: soundPath!)
            
            do{
                player = try AVAudioPlayer(contentsOf: soundURL)
                guard let player = player else{
                    return
                }
                player.numberOfLoops = 0
                player.prepareToPlay()
                
                audio[effect] = player
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    func playerEffect(name:String){
        if let player = audio[name]{
            if player.isPlaying{
                player.currentTime = 0
            } else {
                player.play()
            }
        }
    }
}
