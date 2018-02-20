//
//  ViewControllerAddPlayer.swift
//  PuzzleProject
//
//  Created by Peter Karlsson on 2018-02-14.
//  Copyright © 2018 Peter Karlsson. All rights reserved.
//

import UIKit

class ViewControllerAddPlayer: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addPlayerTextField: UITextField!
    @IBOutlet weak var firstScreenTableView: UITableView!
    @IBOutlet weak var addPlayerBtn: UIButton!
    
    var playerList = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstScreenTableView.tableFooterView = UIView(frame: CGRect.zero)
        addPlayerBtn.layer.cornerRadius = 10
        addPlayerBtn.clipsToBounds = true
    }
    
    //Buttons
    @IBAction func addPlayerBtnPressed(_ sender: UIButton) {
        playerList.append(Player(name: addPlayerTextField.text!))
        addPlayerTextField.text = ""
        firstScreenTableView.reloadData()
    }
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellAddPlayer", for: indexPath)
        cell.textLabel?.text = playerList[indexPath.row].getName()
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.green
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ViewController
        destination?.playerList = playerList;
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
