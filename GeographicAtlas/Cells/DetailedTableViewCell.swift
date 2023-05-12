//
//  DetailedTableViewCell.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit

class DetailedTableViewCell: UITableViewCell {
    
    static let reuseID = "DetailedTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor  = .green
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
