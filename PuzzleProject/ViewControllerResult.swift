//
//  ViewControllerResult.swift
//  PuzzleProject
//
//  Created by Peter Karlsson on 2018-02-14.
//  Copyright © 2018 Peter Karlsson. All rights reserved.
//

import UIKit

class ViewControllerResult: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var resultTableView: UITableView!
    var playerList = [Player]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            print("nu sorteras listan")
            playerList.sort(by: { (first: Player, second: Player) -> Bool in
                first.getScore() > second.getScore()
            })
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCellResult
        cell.nameLabel.text = playerList[indexPath.row].getName()
        cell.scoreLabel.text = "\(playerList[indexPath.row].getScore())"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
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
