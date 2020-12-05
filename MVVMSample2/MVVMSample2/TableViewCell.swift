//
//  TableViewCell.swift
//  MVVMSample2
//
//  Created by Mayuresh Rao on 12/3/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    var data:Model? {
        didSet {
            if let data = data {
                colorCircle.backgroundColor = data.color
                colorView.backgroundColor = data.color.withAlphaComponent(0.5)
                colorName.text = data.text
            }
        }
    }
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var colorCircle: UIView!
    @IBOutlet private weak var colorName: UILabel!
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupView()
    }
    
    private func setupView() {
        colorView.layer.cornerRadius = 38
        colorView.layer.masksToBounds = true
//        colorCircle.layer.cornerRadius = 30
//        colorCircle.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
