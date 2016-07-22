//
//  GameLoadViewController.swift
//  transcendence
//
//  Created by Tim Harris on 7/20/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import UIKit

class GameLoadViewController: UIViewController {
    
    
    @IBOutlet weak var gameLoadTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameLoadTableView.delegate = self
        gameLoadTableView.dataSource = self
    }
    
    @IBAction func backToTitleScrean(segue: UIStoryboardSegue) {
        
    }
    
    func askToLoadGameSave(saveToAskFor: Int) {
        
    }
}

extension GameLoadViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! GameLoadViewCell
        return cell
    }
}


class GameLoadViewCell: UITableViewCell {
    @IBOutlet weak var gameLoadTitleLabel: UILabel!
    @IBOutlet weak var gameLoadPlaytimeLabel: UILabel!
    @IBOutlet weak var gameLoadProgressLabel: UILabel!
    @IBOutlet weak var gameLoadProfileImageView: UIImageView!
    
    
    
}
