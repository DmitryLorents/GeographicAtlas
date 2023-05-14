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
    
    var labelCountry: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.text = "Country"
        return label
    }()
    
    var labelCapital: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .capitalLabel
        label.text = "Capital"
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        contentView.addSubview(imageViewFlag)
        contentView.addSubview(labelCapital)
        contentView.addSubview(labelCountry)
        setConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with country: Country?) {
        labelCountry.text = country?.name.common
        labelCapital.text = country?.capital?.first
    }
    
    private func setConstraints() {
        imageViewFlag.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(12)
            make.width.equalTo(82)
            make.height.equalTo(imageViewFlag.snp.width).multipliedBy(0.5)
        }
        
        labelCountry.snp.makeConstraints { make in
            make.top.equalTo(imageViewFlag)
            make.leading.equalTo(imageViewFlag.snp.trailing).inset(-12)
        }
        
        labelCapital.snp.makeConstraints { make in
            make.bottom.equalTo(imageViewFlag)
            make.leading.equalTo(labelCountry)
        }
        
    }
    
}
