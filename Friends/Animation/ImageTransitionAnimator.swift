//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Linh Bouniol on 8/30/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var fromImageView: UIImageView!
    var toImageView: UIImageView!
    var fromNameLabel: UILabel!
    var toNameLabel: UILabel!
//    var toInfoTextView: UITextView! // no animation
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to),
            let toView = transitionContext.view(forKey: .to) else { return }
        
        // temporary view that is the super view of anything we're animating
        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        containerView.addSubview(toView)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        
        toView.layoutIfNeeded()
        
        // Start and end frames for image view and label
        let startImageFrame = fromImageView.bounds
        let endImageFrame = toImageView.bounds
        let startLabelFrame = fromNameLabel.bounds
        let endLabelFrame = toNameLabel.bounds
        
//        let tempImageView = UIImageView(image: fromImageView.image)
        let tempImageView = UIImageView()
        containerView.addSubview(tempImageView)
        tempImageView.image = fromImageView.image
        tempImageView.contentMode = fromImageView.contentMode   // this will correct the sizing of the image, since we changed it in the storyboard to be aspect fit
        tempImageView.frame = fromImageView.convert(startImageFrame, to: containerView)
        
        let tempLabel = UILabel()
        containerView.addSubview(tempLabel)
        tempLabel.text = fromNameLabel.text
        tempLabel.textColor = fromNameLabel.textColor
        tempLabel.font = fromNameLabel.font
        tempLabel.textAlignment = fromNameLabel.textAlignment
        tempLabel.frame = fromNameLabel.convert(startLabelFrame, to: containerView)
        
        fromImageView.alpha = 0.0
        fromNameLabel.alpha = 0.0
        toImageView.alpha = 0.0
        toNameLabel.alpha = 0.0
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            tempImageView.frame = self.toImageView.convert(endImageFrame, to: containerView)
            tempLabel.frame = self.toNameLabel.convert(endLabelFrame, to: containerView)
            toView.alpha = 1.0
        }) { (success) in
            // reset
            self.fromImageView.alpha = 1.0
            self.fromNameLabel.alpha = 1.0
            self.toImageView.alpha = 1.0
            self.toNameLabel.alpha = 1.0
            
            tempImageView.removeFromSuperview()
            tempLabel.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
    
}
