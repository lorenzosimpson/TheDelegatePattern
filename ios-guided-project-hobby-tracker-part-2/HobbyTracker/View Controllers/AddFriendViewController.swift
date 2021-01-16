//
//  AddFriendsViewController.swift
//  HobbyTracker
//
//  Created by Lorenzo on 1/14/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import UIKit

protocol AddFriendDelegate {
    func friendWasCreated(_ friend: Friend)
}

class AddFriendViewController: UIViewController {
    
    var delegate: AddFriendDelegate?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("add friend view loaded")
        nameTextField.delegate = self
    }

    
   
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text,
              let hometown = hometownTextField.text,
              !name.isEmpty,
              !hometown.isEmpty else {
            return
        }
        var friend = Friend(name: name, hometown: hometown, hobbies: [])
        
        // process the data from the form, save it to the friend object's hobbies array
        if let hobby1 = hobby1TextField.text, !hobby1.isEmpty {
            friend.hobbies.append(hobby1)
        }
        
        if let hobby2 = hobby2TextField.text, !hobby2.isEmpty {
            friend.hobbies.append(hobby2)
        }
        
        if let hobby3 = hobby3TextField.text, !hobby3.isEmpty {
            friend.hobbies.append(hobby3)
        }
        
        delegate?.friendWasCreated(friend)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddFriendViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case nameTextField:
                hometownTextField.becomeFirstResponder()
            case hometownTextField:
                hobby1TextField.becomeFirstResponder()
            case hobby1TextField:
                hobby2TextField.becomeFirstResponder()
            case hobby2TextField:
                hobby3TextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
}
