//
//  ViewControllerAddPlayer.swift
//  PuzzleProject
//
//  Created by Peter Karlsson on 2018-02-14.
//  Copyright © 2018 Peter Karlsson. All rights reserved.
//

import UIKit

class ViewControllerAddPlayer: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var playerList = [Player]()
    @IBOutlet weak var addPlayerTextField: UITextField!
    @IBOutlet weak var firstScreenTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = playerList[indexPath.row].getName()
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //firstScreenTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ViewController
        destination?.playerList = playerList;
        
    }
    
    @IBAction func addPlayerBtnPressed(_ sender: UIButton) {
        playerList.append(Player(name: addPlayerTextField.text!))
        addPlayerTextField.text = ""
        firstScreenTableView.reloadData()
        
        //let indexPath = IndexPath(row: playerList.count - 1, section: 0)
        //firstScreenTableView.beginUpdates()
        //firstScreenTableView.insertRows(at: [indexPath], with: .automatic)
        //firstScreenTableView.endUpdates()
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
