//
//  DetailedTableViewCell.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit
import SnapKit

final class DetailedTableViewCell: UITableViewCell {
    
    static let reuseID = String(describing: DetailedTableViewCell.self)
    
    private var labelPoint: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.text = "."
        label.textAlignment = .center
        label.isSkeletonable = true
        label.isHiddenWhenSkeletonIsActive = true
        return label
    }()
    
    private var labelTop: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .capitalLabel
        label.text = "Text"
        label.isSkeletonable = true
        return label
    }()
    
    private var labelBottom: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProText-Regular", size: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Text"
        label.isSkeletonable = true
        return label
    }()
    
    // Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

    }
    
    private func setupViews() {
        self.isSkeletonable = true
        contentView.isSkeletonable = true
        contentView.addSubview(labelPoint)
        contentView.addSubview(labelTop)
        contentView.addSubview(labelBottom)
    }
    
    private func setConstraints() {
        
        labelPoint.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-45)
            make.leading.equalToSuperview().inset(16)
        }
        
        labelTop.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(32+16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        labelBottom.snp.makeConstraints { make in
            make.top.equalTo(labelTop.snp.bottom).inset(-4 )
            make.leading.trailing.equalTo(labelTop)
        }
        
    }
    //set cell data
    func setup(_ tupleData: (topText: String, bottomText: String?)) {
        labelTop.text = tupleData.topText
        labelBottom.text = tupleData.bottomText ?? "No data"
    }
    
}
