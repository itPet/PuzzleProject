//
//  ViewControllerResult.swift
//  PuzzleProject
//
//  Created by Peter Karlsson on 2018-02-14.
//  Copyright © 2018 Peter Karlsson. All rights reserved.
//

import UIKit

class ViewControllerResult: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var playerList = [Player]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCellResult
        
        let name = playerList[indexPath.row].getName()
        let score = "\(playerList[indexPath.row].getScore())"
        cell.nameLabel.text = name
        cell.scoreLabel.text = score
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(playerList)
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
