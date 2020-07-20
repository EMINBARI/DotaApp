//
//  ItemTableViewCell.swift
//  DotaApp
//
//  Created by Emin Bari on 18.07.2020.
//  Copyright © 2020 Emin Bari. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(imageName: String, title: String){
        
        guard let imageUrl: URL = URL(string: imageName) else{return}
        if let data = try? Data(contentsOf: imageUrl) {
            itemImage.image = UIImage(data: data)
        }
        
        itemNameLabel.text = title
    }
}
