//
//  MainTableViewCell.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let reuseID = "MainTableViewCell"
    var imageViewFlag: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        contentView.addSubview(imageViewFlag)
        
        setConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with country: Country) {
        
    }
    
    private func setConstraints() {
        imageViewFlag.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(12)
            make.width.equalTo(82)
            make.height.equalTo(imageViewFlag.snp.width).multipliedBy(0.5)
        }
    }
    
}
