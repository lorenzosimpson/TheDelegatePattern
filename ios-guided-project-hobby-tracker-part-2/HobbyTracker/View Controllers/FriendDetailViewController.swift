//
//  FriendsDetailViewController.swift
//  HobbyTracker
//
//  Created by Lorenzo on 1/14/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var hobbyListTextView: UITextView!
    
    
    var friend: Friend?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        var hobbyText = ""
        for hobby in friend.hobbies {
            hobbyText += "\(hobby)\n"
        }
        
        hobbyListTextView.text = hobbyText
    }

}
