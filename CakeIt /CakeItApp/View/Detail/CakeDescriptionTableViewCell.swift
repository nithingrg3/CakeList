//
//  CakeDescriptionTableViewCell.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import UIKit

class CakeDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
