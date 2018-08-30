//
//  AddFriendViewController.swift
//  Friends
//
//  Created by Linh Bouniol on 8/30/18.
//  Copyright © 2018 Linh Bouniol. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var friend: Friend?
    var friendController: FriendController?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var infoTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text, let info = infoTextView.text, let image = imageView.image else { return }
        
        friendController?.createFriend(withName: name, image: image, info: info)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func choosePicture(_ sender: Any) {
        presentImagePickerController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func presentImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        // Get image user picked
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        imageView.image = image
    }
}
