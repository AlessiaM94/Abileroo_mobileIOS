//
//  ActCellProd.swift
//  Abileroo
//
//  Created by abinsula on 15/12/2022.
//

import UIKit

class ActCellProd: UITableViewCell {
    @IBOutlet weak var NomProd: UILabel!
    @IBOutlet weak var DescProd: UILabel!
    @IBOutlet weak var Prezzo: UILabel!
    @IBOutlet weak var ImagePr: UIImageView!
    
    @IBOutlet weak var bottonePiu: UIButton!
    
    @IBOutlet weak var bottoneMeno: UIButton!
    @IBOutlet weak var contatore: UILabel!
    var counter: Int = 0
    
    @IBAction func bottonePiuAction(_ sender: Any) {
        counter = counter + 1
        contatore.text = counter.description
    }
    
    @IBAction func bottoneMenoAction(_ sender: Any) {
        counter = counter - 1
        contatore.text = counter.description
        if(counter < 0) {
            contatore.text = String(0)
            bottonePiuAction(counter > 0)
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
    func configure(item: Products){
        DescProd.text = item.description
        NomProd.text = item.name
        Prezzo.text = String(item.price ?? 0.00) + " €"
        ImagePr?.sd_setImage(with: URL(string: item.productImage ?? ""))
        
    }
}
