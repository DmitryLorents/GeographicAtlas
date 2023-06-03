//
//  DetailedTableViewCell.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit
import SnapKit

class DetailedTableViewCell: UITableViewCell {
    
    static let reuseID = "DetailedTableViewCell"
    
    var labelPoint: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.text = "."
        label.textAlignment = .center
        return label
    }()
    
    var labelTop: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .capitalLabel
        label.text = "Text"
        return label
    }()
    
    var labelBottom: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProText-Regular", size: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Text"
        return label
    }()
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupOutlets()
        setConstraints()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupOutlets() {
        addSubview(labelPoint)
        addSubview(labelTop)
        addSubview(labelBottom)
    }
    
    private func setConstraints() {
        labelPoint.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-45)
            make.leading.equalToSuperview().inset(16)
//            make.width.equalTo(24)
//            make.height.equalTo(24)
        }
        
        labelTop.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(32+16)
        }
        
        labelBottom.snp.makeConstraints { make in
            make.top.equalTo(labelTop.snp.bottom).inset(-4 )
            make.leading.equalTo(labelTop)
        }
        
    }
    
    func setup(_ tupleData: (topText: String, bottomText: String?)) {
        labelTop.text = tupleData.topText
        labelBottom.text = tupleData.bottomText ?? "No data"
    }
    
}
