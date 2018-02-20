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
    @IBOutlet weak var resultBtn: UIButton!
    
    var playerList = [Player]()
    
    private var timer: Timer?
    private var minutes: Int = 0
    private var seconds: Int = 0
    private var counter: Int = 0
    private var btnPressed: Int = 0
    private var timeList = [String]()
    private var tableViewPlayerNameList = [String]()
    private var pickerViewPlayerNameList = [String]()
    private var selectedRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for player in playerList{
            tableViewPlayerNameList.append(NSLocalizedString("selectPlayer", comment: ""))
            pickerViewPlayerNameList.append(player.getName())
        }
        timerTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    //Buttons pressed
    @IBAction func resultBtnPressed(_ sender: UIButton) {
        increasePlayerScore()
    }
    
    @IBAction func timeLabelTapped(_ sender: UITapGestureRecognizer) {
        addTimeToTableViewAndUpdateTimeLabel()
    }

    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timerCell", for: indexPath) as! TableViewCellMain
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.green
        cell.selectedBackgroundView = bgColorView
        
        if indexPath.row < tableViewPlayerNameList.count {
            cell.nameBtn.setTitle(tableViewPlayerNameList[indexPath.row], for: .normal)
        }
        cell.timeLabel.text = timeList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playerPickerView.isHidden = false
        selectedRow = indexPath.row
    }
    
    //PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewPlayerNameList.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if row == 0 {
            return NSLocalizedString("none", comment: "")
        }
        return pickerViewPlayerNameList[row - 1]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        addRemoveNamesInPickerView(row: row)
        hideAndShowResultBtn()
        
        playerPickerView.selectRow(0, inComponent: 0, animated: false)
        playerPickerView.reloadAllComponents()
        timerTableView.reloadData()
        playerPickerView.isHidden = true
    }
    
    //Functions
    func increasePlayerScore () {
        var increaseScore = playerList.count
        for name in tableViewPlayerNameList {
            let index = playerList.index(where: { (Player) -> Bool in
                Player.getName() == name
            })
            playerList[index!].addScore(increaseScore: increaseScore)
            increaseScore -= 1
        }
    }
    
    func addTimeToTableViewAndUpdateTimeLabel() {
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
    
    func addRemoveNamesInPickerView (row: Int) {
        if row == 0 {
            if tableViewPlayerNameList[selectedRow] != NSLocalizedString("selectPlayer", comment: ""){
                pickerViewPlayerNameList.append(tableViewPlayerNameList[selectedRow])
                tableViewPlayerNameList[selectedRow] = NSLocalizedString("selectPlayer", comment: "")
            }
        }
        else {
            if tableViewPlayerNameList[selectedRow] == NSLocalizedString("selectPlayer", comment: ""){
                tableViewPlayerNameList[selectedRow] = pickerViewPlayerNameList[row - 1]
            }
            else {
                pickerViewPlayerNameList.append(tableViewPlayerNameList[selectedRow])
                tableViewPlayerNameList[selectedRow] = pickerViewPlayerNameList[row - 1]
            }
            pickerViewPlayerNameList.remove(at: row - 1)
        }
    }
    
    func hideAndShowResultBtn() {
        if pickerViewPlayerNameList.count == 0 {
            resultBtn.isHidden = false
        }
        else {
            resultBtn.isHidden = true
        }
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ViewControllerResult
        destination?.playerList = playerList;
    }
    
    //MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

