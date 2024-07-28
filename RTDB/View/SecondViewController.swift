//
//  SecondViewController.swift
//  RTDB
//
//  Created by alihizardere on 28.07.2024.
//

import UIKit
import FirebaseDatabase

class SecondViewController: UIViewController {
  @IBOutlet weak var textField: UITextField!
  var ref: DatabaseReference!
  var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
      ref = Database.database().reference()
    }


  @IBAction func addPlayer(_ sender: Any) {
        guard let userName = textField.text, !userName.isEmpty else {
          print("Kullanıcı adı boş olamaz")
          return
        }
    
        let userID = ref.child("users").childByAutoId().key ?? UUID().uuidString
        let newUser = ["username": userName]
        ref.child("users").child(userID).setValue(newUser)
    
        let user = User(id: userID, name: userName)
        users.append(user)
        textField.text = ""
  }
}
