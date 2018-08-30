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
        guard let toVC = toVC as? FriendDetailViewController else { return nil }
        
        let _ = toVC.view
        
        imageTransitionAnimator.fromImageView = sourceCell?.picture
        imageTransitionAnimator.toImageView = toVC.imageView
        imageTransitionAnimator.fromNameLabel = sourceCell?.nameLabel
        imageTransitionAnimator.toNameLabel = toVC.nameLabel
        
        return imageTransitionAnimator
    }
}
