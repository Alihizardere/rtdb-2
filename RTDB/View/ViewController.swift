//
//  ViewController.swift
//  RTDB
//
//  Created by alihizardere on 27.07.2024.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  var users = [User]()
  var ref: DatabaseReference!

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: UserCell.identifier, bundle: nil), forCellReuseIdentifier: UserCell.identifier)
<<<<<<< HEAD
    //fdslfdsfdsfdsmlfdmfds
    
=======
      print("Doğukan")
>>>>>>> b6cbede7615e5563e9fb8d8d5a4cd647aeefc0ce
  }
    
  override func viewWillAppear(_ animated: Bool) {
    getKey()
  }

  private func getData(_ key: String) {
    self.users = [User]()
    let newRef = Database.database().reference().child("users").child(key)
    newRef.observeSingleEvent(of: .value) { snapshot in
      let dictionary = snapshot.value as? [String: Any] ?? ["ele boş": ""]
      let name = dictionary["username"] as? String ?? "ele hoş"
      DispatchQueue.main.async {
        self.users.append(.init(id: key, name: name))
        self.tableView.reloadData()
      }
    }
  }

  private func getKey() {
    let ref = Database.database().reference().child("users")
    ref.observeSingleEvent(of: .value) { snapshot in
      for children in snapshot.children {
        let key = (children as AnyObject).key as String
        print("*****\(key)")
        self.getData(key)
      }
    }
  }

  @IBAction func addPlayer(_ sender: Any) {

  }
  
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as! UserCell
    let user = users[indexPath.row]
    cell.nameLabel.text = user.name
    return cell
  }
  

}

