//
//  CustomTableViewCell.swift
//  NetworkTest
//
//  Created by Adham Samer on 17/12/2023.
//

import UIKit

protocol CustomCellProtocol {
  func configureCell(data: Recipe)
}
class CustomTableViewCell: UITableViewCell {

  @IBOutlet weak var nameText: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
// MARK: - CustomCellProtocol
extension CustomTableViewCell: CustomCellProtocol {
  func configureCell(data: Recipe) {
    nameText.text = data.name
  }
  
}
