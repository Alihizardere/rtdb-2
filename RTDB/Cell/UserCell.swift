//
//  UserCell.swift
//  RTDB
//
//  Created by alihizardere on 28.07.2024.
//

import UIKit

class UserCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  static let identifier = "UserCell"

  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
