//
//  SearchCell.swift
//  Sartaba
//
//  Created by ori mizrachi on 2/2/16.
//  Copyright © 2016 Bipolar. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var textlbl: UITextView!
    @IBOutlet weak var imageShowi: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
