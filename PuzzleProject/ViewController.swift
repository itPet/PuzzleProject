//
//  ViewController.swift
//  PuzzleProject
//
//  Created by Peter Karlsson on 2018-01-26.
//  Copyright © 2018 Peter Karlsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource
    {
    
    @IBOutlet weak var playerPickerView: UIPickerView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerTableView: UITableView!

    
    var timer: Timer?
    var minutes: Int = 0
    var seconds: Int = 0
    var playerList = [Player]()
    var counter: Int = 0
    var btnPressed: Int = 0
    var timeList = [String]()
    var temporaryPlayerNameList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timerCell", for: indexPath) as! TableViewCellMain
        
        if indexPath.row < temporaryPlayerNameList.count {
            cell.nameBtn.setTitle(temporaryPlayerNameList[indexPath.row], for: .normal)
        }
        cell.timeLabel.text = timeList[indexPath.row]
        return cell
    }
    
    @IBAction func nameBtnPressed(_ sender: UIButton) {
        playerPickerView.isHidden = false
        timerTableView.isHidden = true
        
        tableView(<#T##tableView: UITableView##UITableView#>, cellForRowAt: <#T##IndexPath#>)
    }
    
    
    @IBAction func timeLabelTapped(_ sender: UITapGestureRecognizer) {
        if counter == 0 {
            timeLabel.text = "0:0"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimeLabel), userInfo: nil, repeats: true)
        } else if counter < playerList.count + 1 {
            timeList.append(timeLabel.text!)
            timerTableView.reloadData()
        }
        
        if counter == playerList.count {
            if let timer = self.timer {
                timer.invalidate()
            }
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
        if row == 0 {
            
        }
        temporaryPlayerNameList.append(playerList[row - 1].getName())
        timerTableView.reloadData()
        playerPickerView.isHidden = true
        timerTableView.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ViewControllerResult
        destination?.playerList = playerList;
    }
    
    func setButtonTitle (button: UIButton!, row: Int) {
        if row == 0 {
            button.setTitle("", for: .normal)
        } else {
            button.setTitle(playerList[row - 1].getName(), for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

