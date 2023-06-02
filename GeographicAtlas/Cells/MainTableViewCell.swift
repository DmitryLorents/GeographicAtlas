//
//  MainTableViewCell.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit
import SnapKit
import Kingfisher

class MainTableViewCell: UITableViewCell {
    
    static let reuseID = "MainTableViewCell"
    
    var grayBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mainViewBackground
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    var imageViewFlag: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    var chevronImageView: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "chevron.down"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .black
        view.isUserInteractionEnabled = true
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
        contentView.addSubview(grayBackgroundView)
        grayBackgroundView.addSubview(imageViewFlag)
        grayBackgroundView.addSubview(chevronImageView)
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
        let imageURL = URL(string: country?.flags.png ?? "")
        imageViewFlag.kf.setImage(with: imageURL)
    }
    
    private func setConstraints() {
        grayBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 16))
        }
        
        imageViewFlag.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(12)
            make.height.equalTo(imageViewFlag.snp.width).multipliedBy(0.5)
        }
        
        chevronImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.width.height.equalTo(24)
            make.centerY.equalToSuperview()
        }
        
        labelCountry.snp.makeConstraints { make in
            make.top.equalTo(imageViewFlag).inset(4)
            make.leading.equalTo(imageViewFlag.snp.trailing).inset(-12)
            make.trailing.equalTo(chevronImageView.snp.leading).inset(-12)
        }
        
        labelCapital.snp.makeConstraints { make in
            make.bottom.equalTo(imageViewFlag).inset(4)
            make.leading.equalTo(labelCountry)
            make.trailing.equalTo(labelCountry)
        }
        
    }
    
}
