//
//  ActCellProd.swift
//  Abileroo
//
//  Created by abinsula on 15/12/2022.
//

import UIKit

class ActCellProd: UITableViewCell {
    @IBOutlet weak var NameProd: UILabel!
    @IBOutlet weak var Prezzo: UILabel!
    @IBOutlet weak var descrProd: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
