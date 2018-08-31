//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Linh Bouniol on 8/30/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    // This allows us to know which cell we are animating from. The segue is passing the info about the cell to here
    var sourceCell: FriendTableViewCell?
    
    var imageTransitionAnimator = ImageTransitionAnimator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // Get the destination vc
        
//        guard let toVC = toVC as? FriendDetailViewController else { return nil }
        
        if let toVC = toVC as? FriendDetailViewController {
            
            // this makes sure that the animation would run only when we're going from the FriendsTableVC to the FriendDetailVC, return nil otherwise
            guard operation == .push else { return nil }
            
            let _ = toVC.view
            
            imageTransitionAnimator.fromImageView = sourceCell?.picture
            imageTransitionAnimator.toImageView = toVC.imageView
            imageTransitionAnimator.fromNameLabel = sourceCell?.nameLabel
            imageTransitionAnimator.toNameLabel = toVC.nameLabel
            
            return imageTransitionAnimator
        }
        
        if let fromVC = fromVC as? FriendDetailViewController {
            
            // If there is another VC connected to FriendDetail, we don't want to animation when going to there. 
            // this makes sure that the animation would run only when we're going back from the FriendDetailVC to the FriendsTableVC, return nil otherwise
            guard operation == .pop else { return nil }
            
            // Don't need .view, b/c view is already loaded
            
            imageTransitionAnimator.fromImageView = fromVC.imageView
            imageTransitionAnimator.toImageView = sourceCell?.picture
            imageTransitionAnimator.fromNameLabel = fromVC.nameLabel
            imageTransitionAnimator.toNameLabel = sourceCell?.nameLabel
            
            return imageTransitionAnimator
        }
        
        return nil // was in the guard as well
    }
}
