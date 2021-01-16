//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Lorenzo on 1/14/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var friends: [Friend] = [Friend(name: "lorenzo", hometown: "milan", hobbies: ["a", "b", "c"])]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriendModalSegue" {
            if let addFriendVC = segue.destination as? AddFriendViewController {
                addFriendVC.delegate = self
            }
        } else if segue.identifier == "ShowFriendDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
               let friendDetailVC = segue.destination as? FriendDetailViewController {
                friendDetailVC.friend = friends[indexPath.row]
    
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    if let index = self.tableView.indexPathForSelectedRow{
        self.tableView.deselectRow(at: index, animated: true)
        }
    }
}

extension FriendsTableViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { fatalError("cell must have reuse identifier and be of type friendtableviewcell") }
       
        let friend = friends[indexPath.row]
        cell.friend = friend
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            friends.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

extension FriendsTableViewController: AddFriendDelegate {
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
