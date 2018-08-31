//
//  CustomInteractor.swift
//  Friends
//
//  Created by Linh Bouniol on 8/30/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class CustomInteractor: UIPercentDrivenInteractiveTransition {
    
    var navigationController: UINavigationController
    var shouldCompleteTransition = false
    var transitionInProgress = false
    
    init?(for viewController: UIViewController) {
        // Asking VC this its navigationController
        guard let nav = viewController.navigationController else { return nil }
        
        // Assign it to this class
        navigationController = nav

        super.init()
        
        setupBackGesture(view: viewController.view)
    }
    
    private func setupBackGesture(view: UIView) {
        let swipeBackGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleBackGesture(_:)))
        swipeBackGesture.edges = .left
        view.addGestureRecognizer(swipeBackGesture)
    }
    
    @objc private func handleBackGesture(_ gesture : UIScreenEdgePanGestureRecognizer) {
        
        switch gesture.state {
        case .began:
            transitionInProgress = true
            navigationController.popViewController(animated: true)
        case .changed:
            let viewTranslation = gesture.translation(in: gesture.view?.superview)
            let progress = viewTranslation.x / navigationController.view.frame.width
            
            if progress > 0.5 {
                shouldCompleteTransition = true
            } else {
                shouldCompleteTransition = false
            }
            update(progress)
        case .cancelled:
            transitionInProgress = false
            cancel()
        case .ended:
            transitionInProgress = false
            let viewVelocity = gesture.velocity(in: gesture.view?.superview)
            
            if viewVelocity.x > 0 {
                shouldCompleteTransition = true
                finish()
            } else {
                shouldCompleteTransition = false
                cancel()
            }
        default:
            break
        }
    }
}
