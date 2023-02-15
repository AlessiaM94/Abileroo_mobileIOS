//
//  ActivityCell.swift
//  Abileroo
//
//  Created by abinsula on 06/12/2022.
//

import UIKit

class ActivityCell: UITableViewCell {

   
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure2(item: CommercialActivity) {
        titleLabel.text = item.name
        descriptionLabel.text = item.address
        profileImage?.sd_setImage(with: URL(string: item.image ?? ""))
    }
}
