//
//  FriendTableViewCell.swift
//  HobbyTracker
//
//  Created by Lorenzo on 1/14/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    var friend: Friend? {
        didSet {
            nameLabel.text = friend?.name
            hometownLabel.text = friend?.hometown
            hobbyCountLabel.text = "\(friend?.hobbies.count ?? 0)"
        }
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var hobbyCountLabel: UILabel!
    
    
  
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
