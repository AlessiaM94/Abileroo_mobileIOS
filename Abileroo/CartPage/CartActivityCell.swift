//
//  CartActivityCell.swift
//  Abileroo
//
//  Created by abinsula on 01/03/23.
//

import UIKit

class CartActivityCell: UITableViewCell {

    
    @IBOutlet weak var quantitaProd: UILabel!
    
    @IBOutlet weak var nomeProdCart: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
