//
//  ViewController.swift
//  DetectiveStory
//
//  Created by Maksym Ponomarchuk on 10.02.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    var story = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designButtons()
        updateUI()
        story.startMusic()
        
    }
    
    func designButtons() {
        
        soundButton.layer.borderColor = UIColor.black.cgColor
        soundButton.layer.borderWidth = 1
        soundButton.layer.cornerRadius = 10
        
        button1.layer.borderColor = UIColor.black.cgColor
        button1.layer.borderWidth = 1
        button1.layer.cornerRadius = 10
        button1.backgroundColor = UIColor.init(displayP3Red: 0.7, green: 0.7, blue: 1, alpha: 0.4)
        
        button2.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = 10
        button2.backgroundColor = UIColor.init(displayP3Red: 0.7, green: 0.7, blue: 1, alpha: 0.4)
        
    }
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        let playerChoice = sender.tag
        let currentStory = story.choice(playerChoice)
        if currentStory == 41 {
            button1.isHidden = true
            button2.isHidden = true
        }
        updateUI()
    }
    
    @IBAction func soundPush(_ sender: UIButton) {
        if sender.titleLabel?.text == "ON" {
            story.musicPause()
            sender.setTitle("OFF", for: .normal)
        } else {
            story.musicContinue()
            sender.setTitle("ON", for: .normal)
        }
    }
    
    func updateUI(){
        textLabel.text = story.getStory()
        button1.setTitle(story.getButton1(), for: .normal)
        button2.setTitle(story.getButton2(), for: .normal)
    }
}

