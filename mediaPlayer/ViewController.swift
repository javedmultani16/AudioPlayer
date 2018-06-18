//
//  ViewController.swift
//  mediaPlayer
//
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController,AVAudioPlayerDelegate {

    var player:AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // set URL of the sound
   
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPlaySound(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "ring", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            
            player.play()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
}

