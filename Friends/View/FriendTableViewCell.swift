//
//  FriendTableViewCell.swift
//  Friends
//
//  Created by Linh Bouniol on 8/30/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateViews() {
        guard let friend = friend else { return }
        nameLabel?.text = friend.name
        picture?.image = friend.image
        
        picture?.layer.cornerRadius = 8
        picture?.clipsToBounds = true
    }
}
