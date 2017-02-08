//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Markus Staas on 2/7/17.
//  Copyright © 2017 Markus Staas. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUIState(isRecording: false)
        
    }
    
    func setUIState(isRecording:Bool){
            recordingLabel.text = "Recording in progress..."
            recordButton.isEnabled = false
            stopRecordingButton.isEnabled = isRecording
        if !isRecording {
            recordingLabel.text = "Tap button to record"
            recordButton.isEnabled = true
        }
           }

    @IBAction func recordAudio(_ sender: Any) {
        setUIState(isRecording: true)
        
        /////////////copy code from lesson
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        /////////END copy code from lesson
    
    }
  
    @IBAction func stopRecording(_ sender: Any) {
        setUIState(isRecording: false)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
        performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print ("recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording"{
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        
        }
    }
}
    
    


