//
//  CellPayment.swift
//  Abileroo
//
//  Created by abinsula on 20/03/23.
//

import UIKit
class CellPayment: UITableViewCell {
    
    @IBOutlet weak var quantitaBuy: UILabel!
    @IBOutlet weak var prizeP: UILabel!
    
    @IBOutlet weak var namePbuy: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
