//
//  MyTrashCell.swift
//  Smart Bin
//
//  Created by Glorio on 13/06/22.
//

import UIKit

class MyTrashCell: UITableViewCell {
    
    @IBOutlet weak var lblLevel: UILabel!
    
    @IBOutlet weak var lblTimestamp: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
