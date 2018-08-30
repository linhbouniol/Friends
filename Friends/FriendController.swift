//
//  FriendController.swift
//  Friends
//
//  Created by Linh Bouniol on 8/30/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class FriendController {
    
    var friends: [Friend] = []
    
    func createFriend(withName name: String, image: UIImage?, info: String) {
        let friend = Friend(name: name, image: image, info: info)
        friends.append(friend)
    }
    
    func update(friend: Friend, withName name: String, image: UIImage?, info: String) {
        guard let index = friends.index(of: friend) else { return }
        
        var scratch = friend
        scratch.name = name
        scratch.image = image
        scratch.info = info
        
        friends.remove(at: index)
        friends.insert(scratch, at: index)
    }
    
    func delete(friend: Friend) {
        guard let index = friends.index(of: friend) else { return }
        
        friends.remove(at: index)
    }
    
}
