//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Markus Staas on 2/7/17.
//  Copyright © 2017 Markus Staas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        
    }

    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in progress..."
        recordButton.isEnabled = false
        stopButton.isEnabled = true
    
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Tap to record"
        recordButton.isEnabled = true
        stopButton.isEnabled = false
    }
    
}

