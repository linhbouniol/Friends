//
//  FriendDetailViewController.swift
//  Friends
//
//  Created by Linh Bouniol on 8/30/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    var friend: Friend? {
        didSet {
            updateViews()
        }
    }
    var friendController: FriendController?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        guard let friend = friend else { return }
        self.title = friend.name
        nameLabel?.text = friend.name
        imageView?.image = friend.image
        textView?.text = friend.info
    }
}
