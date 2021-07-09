//
//  CatalogueCell.swift
//  LearnVIPER
//
//  Created by zein rezky chandra on 09/07/21.
//

import UIKit

class CatalogueCell: UITableViewCell {

    @IBOutlet weak var contentDesc: UILabel!
    @IBOutlet weak var contentTitle: UILabel!
    
    var object: CatalogueDataModel? {
        didSet {
            configCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell() {
        guard let obj = object else { return }
        contentTitle.text = obj.name
        contentDesc.text = obj.description
    }
}
