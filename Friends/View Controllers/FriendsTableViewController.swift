//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Linh Bouniol on 8/30/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let friendController = FriendController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendController.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell

        let friend = friendController.friends[indexPath.row]
        cell.friend = friend

        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let friend = friendController.friends[indexPath.row]
            friendController.delete(friend: friend)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? FriendDetailViewController {
            detailVC.friendController = friendController // this doesn't seem to be happeneing - forgot to set the ViewController in storyboard?
            
            if segue.identifier == "ShowDetail" {
                guard let index = tableView.indexPathForSelectedRow?.row else { return }
                let friend = friendController.friends[index]
                detailVC.friend = friend
            }
        }
        
        if let addVC = segue.destination as? AddFriendViewController {
            addVC.friendController = friendController
        }
    }
}
