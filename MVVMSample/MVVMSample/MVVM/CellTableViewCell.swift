//
//  CellTableViewCell.swift
//  MVVMSample
//
//  Created by Mayuresh Rao on 12/3/20.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    var data:Model? {
        didSet {
            if let data = data {
                
            }
        }
    }
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var colorCircle: UIView!
    @IBOutlet private weak var colorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
