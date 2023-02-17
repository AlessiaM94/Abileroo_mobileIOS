//
//  ActivityPreferCell.swift
//  Abileroo
//
//  Created by abinsula on 15/02/23.
//

import UIKit

class ActivityPreferCell: UITableViewCell{
    @IBOutlet weak var immagineAttPref: UIImageView!
    @IBOutlet weak var NomeAttPref: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    /*func configure3(item: Products){
        NomeAttPref.text = item.name
        
    }*/
}

