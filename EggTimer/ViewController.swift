//  Sabah Naveed
//  SceneDelegate.swift
//  EggTimer
//
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
                        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        //reset
        progressBar.progress = 0.0
        secondsPassed  = 0
        
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            
            let percentDone = Float(secondsPassed)/Float(totalTime)
            print(percentDone)
                        
            progressBar.progress = percentDone

        } else {
            timer.invalidate()

            titleLabel.text = "DONE"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    
    
}
