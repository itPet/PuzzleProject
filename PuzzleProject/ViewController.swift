//
//  ViewController.swift
//  PuzzleProject
//
//  Created by Peter Karlsson on 2018-01-26.
//  Copyright © 2018 Peter Karlsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var playerPickerView: UIPickerView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeOne: UILabel!
    @IBOutlet weak var timeTwo: UILabel!
    @IBOutlet weak var timeThree: UILabel!
    @IBOutlet weak var timeFour: UILabel!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    
    var timer: Timer?
    var minutes: Int = 0
    var seconds: Int = 0
    var playerList = [Player (name: "Peter"), Player (name: "Olof"), Player(name: "Hilda"), Player(name: "Nils")]
    var counter: Int = 0
    var btnPressed: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func timeLabelTapped(_ sender: UITapGestureRecognizer) {
        if counter == 0 {
            timeLabel.text = "0:0"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimeLabel), userInfo: nil, repeats: true)
        }

        if counter == 1 {
            timeOne.text = "1.  \(String(minutes)):\(String(seconds))"
        }
        
        if counter == 2 {
            timeTwo.text = "2.  \(String(minutes)):\(String(seconds))"
        }
        
        if counter == 3 {
            timeThree.text = "3.  \(String(minutes)):\(String(seconds))"
        }
        
        if counter == 4 {
            timeFour.text = "4.  \(String(minutes)):\(String(seconds))"
        }
        
        counter = counter + 1
    }
    
    @objc func updateTimeLabel() {
        seconds = seconds + 1
        if seconds == 60 {
            minutes = minutes + 1
            seconds = 0
        }
        
        timeLabel.text = String(minutes) + ":" + String(seconds)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playerList.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if row == 0 {
            return "none"
        }
        return playerList[row - 1].getName()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if btnPressed == 1 {
            setButtonTitle(button: btnOne, row: row)
        } else if btnPressed == 2 {
            setButtonTitle(button: btnTwo, row: row)
        } else if btnPressed == 3 {
            setButtonTitle(button: btnThree, row: row)
        } else if btnPressed == 4 {
            setButtonTitle(button: btnFour, row: row)
        }
        
        showButtonsHidePicker()
    }
    
    func setButtonTitle (button: UIButton!, row: Int) {
        if row == 0 {
            button.setTitle("", for: .normal)
        } else {
            button.setTitle(playerList[row - 1].getName(), for: .normal)
        }
    }
    
    @IBAction func btnOnePressed(_ sender: UIButton) {
        hideButtonsShowPicker()
        btnPressed = 1
    }
    
    @IBAction func btnTwoPressed(_ sender: UIButton) {
        hideButtonsShowPicker()
        btnPressed = 2
    }
    
    @IBAction func btnThreePressed(_ sender: UIButton) {
        hideButtonsShowPicker()
        btnPressed = 3
    }
    
    @IBAction func btnFourPressed(_ sender: UIButton) {
        hideButtonsShowPicker()
        btnPressed = 4
    }
    
    func hideButtonsShowPicker(){
        btnOne.isHidden = true
        btnTwo.isHidden = true
        btnThree.isHidden = true
        btnFour.isHidden = true
        playerPickerView.isHidden = false
    }
    
    func showButtonsHidePicker() {
        btnOne.isHidden = false
        btnTwo.isHidden = false
        btnThree.isHidden = false
        btnFour.isHidden = false
        playerPickerView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

