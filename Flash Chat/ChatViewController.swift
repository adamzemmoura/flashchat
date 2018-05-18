//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    // Declare instance variables here
    let messages = ["This is message 1",
                    "This is message 2",
                    "This is message 3",
                    "This is message 4",
                    "This is message 5",
                    "LKAJSDL ALKSJdalsdlakJlakjsd ala sjldkajsd aksjalksjdalksjda  lakjsdlkja sd lkajsldkj "]
    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        //TODO: Set yourself as the delegate of the text field here:
        messageTextfield.delegate = self
        
        
        //TODO: Set the tapGesture here:
        
        

        //TODO: Register your MessageCell.xib file here:
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil),
                                  forCellReuseIdentifier: "customMessageCell")
        
        configureTableView()
        
    }
    
    //TODO: Declare configureTableView here:
    func configureTableView() {
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        
        //TODO: Send the message to Firebase and save it in our database
        
        
    }
    
    //TODO: Create the retrieveMessages method here:
    
    

    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
            try Auth.auth().signOut()
            print("Logging out")
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("Error! There wasa problem logging out!")
        }
        
        
    }
    


}

//MARK: - TableView DataSource Methods
extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        let message = self.messages[indexPath.row]
        
        cell.messageBody.text = message
        
        return cell
    }
    
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    
    //TODO: Declare tableViewTapped here:
    
    
}

//MARK:- TextField Delegate Methods
extension ChatViewController: UITextFieldDelegate {
    
    
    //TODO: Declare textFieldDidBeginEditing here:
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == messageTextfield {
            // keyboard 258 points high
            // increase the height constraint of the message send to include the height of the keyboard
            self.heightConstraint.constant = 308
        }
    }
    
    //TODO: Declare textFieldDidEndEditing here:
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == messageTextfield {
            self.heightConstraint.constant = 50
        }
    }
}
