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
    //MARK: - Constants and variables
    
    static let reuseID = "MainTableViewCell"
    private let textFormatter = TextFormatter()
    lazy var isOpened: Bool = false
    var completionOpenCell: (() -> Void)?
    var completionShowCell: (() -> Void)?
    var heightConstraint: Constraint!
    
    var grayBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainViewBackground
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    var imageViewFlag: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    var chevronButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.down")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.isUserInteractionEnabled = true
        return button
    }()
    
    var labelCountry: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.text = "Country"
        return label
    }()
    
    var labelCapital: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .capitalLabel
        label.text = "Capital"
        return label
    }()
    
    var labelPopulation: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .capitalLabel
        label.text = "Population:"
        label.isHidden = true
        return label
    }()
    var labelPopulationValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .black
        label.text = "No data"
        label.isHidden = true
        return label
        
    }()
    
    var labelArea: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .capitalLabel
        label.text = "Area:"
        label.isHidden = true
        return label
    }()
    var labelAreaValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .black
        label.text = "No data"
        label.isHidden = true
        return label
    }()
    var labelCurrencies: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .capitalLabel
        label.text = "Currencies:"
        label.isHidden = true
        return label
    }()
    var labelCurrenciesValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .black
        label.text = "No data"
        label.isHidden = true
        return label
    }()
    
    var learnMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.setTitle("Learn more", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 20)
        button.isHidden = true
        return button
    }()
    lazy var hiddenOutlets: [UIView] = {
        [labelPopulation, labelPopulationValue, labelArea, labelAreaValue, labelCurrencies, labelCurrenciesValue, learnMoreButton]
    }()
    
    //MARK: - Load view
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setOutlets()
        setConstraints()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Methods
    
    func setup(with country: Country?) {
        labelCountry.text = country?.name.common
        labelCapital.text = country?.capital?.first
        let imageURL = URL(string: country?.flags.png ?? "")
        imageViewFlag.kf.setImage(with: imageURL)
        //population
        let population = country?.population ?? 0
        let populationString = textFormatter.population(population)
        labelPopulationValue.text = populationString
        //area
        let area = country?.area
        let areaString = textFormatter.area(area)
        labelAreaValue.text = areaString
        //currencies
        let currency = country?.currencies
        let currencyString = textFormatter.currencies(currency)
        labelCurrenciesValue.text = currencyString
        chevronButton.addTarget(nil, action: #selector(openCell), for: .touchUpInside)
        learnMoreButton.addTarget(nil, action: #selector(showCell), for: .touchUpInside)
    }
    
    private func setOutlets() {
        contentView.addSubview(grayBackgroundView)
        grayBackgroundView.addSubview(imageViewFlag)
        grayBackgroundView.addSubview(chevronButton)
        grayBackgroundView.addSubview(labelCapital)
        grayBackgroundView.addSubview(labelCountry)
        grayBackgroundView.addSubview(labelPopulation)
        grayBackgroundView.addSubview(labelPopulationValue)
        grayBackgroundView.addSubview(labelArea)
        grayBackgroundView.addSubview(labelAreaValue)
        grayBackgroundView.addSubview(labelCurrencies)
        grayBackgroundView.addSubview(labelCurrenciesValue)
        grayBackgroundView.addSubview(learnMoreButton)
    }
    
    private func setConstraints() {
        grayBackgroundView.snp.makeConstraints { make in
            var height: CGFloat = (isOpened ? 216 : 72)
            //            make.height.equalTo(height)
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 16))
            heightConstraint =  make.height.equalTo(height).constraint//(height)
        }
        
        imageViewFlag.snp.makeConstraints { make in
            //make.top.leading.bottom.equalToSuperview().inset(12)
            make.top.leading.equalToSuperview().inset(12)
            make.width.equalTo(82)//equalToSuperview().multipliedBy(CGFloat(82/343))
            //            let bottomInset: CGFloat = (isOpened ? 156 : 12)
            //            make.bottom.equalToSuperview().inset(bottomInset)
            let multyplier: CGFloat = 48/82
            make.height.equalTo(imageViewFlag.snp.width).multipliedBy(multyplier)
        }
        
        chevronButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.width.height.equalTo(24)
            make.centerY.equalTo(imageViewFlag)
        }
        
        labelCountry.snp.makeConstraints { make in
            make.top.equalTo(imageViewFlag).inset(4)
            make.leading.equalTo(imageViewFlag.snp.trailing).inset(-12)
            make.trailing.equalTo(chevronButton.snp.leading).inset(-12)
        }
        
        labelCapital.snp.makeConstraints { make in
            make.bottom.equalTo(imageViewFlag).inset(4)
            make.leading.equalTo(labelCountry)
            make.trailing.equalTo(labelCountry)
        }
        
        labelPopulation.snp.makeConstraints { make in
            make.bottom.equalTo(imageViewFlag).inset(-30)
            make.leading.equalTo(imageViewFlag)
        }
        labelPopulationValue.snp.makeConstraints { make in
            make.bottom.equalTo(labelPopulation)
            make.leading.equalTo(labelPopulation.snp.trailing).inset(-4)
        }
        labelArea.snp.makeConstraints { make in
            make.bottom.equalTo(labelPopulation).inset(-26)
            make.leading.equalTo(imageViewFlag)
        }
        labelAreaValue.snp.makeConstraints { make in
            make.bottom.equalTo(labelArea)
            make.leading.equalTo(labelArea.snp.trailing).inset(-4)
        }
        labelCurrencies.snp.makeConstraints { make in
            make.bottom.equalTo(labelArea).inset(-26)
            make.leading.equalTo(imageViewFlag)
        }
        labelCurrenciesValue.snp.makeConstraints { make in
            make.bottom.equalTo(labelCurrencies)
            make.leading.equalTo(labelCurrencies.snp.trailing).inset(-4)
        }
        learnMoreButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelCurrencies.snp.bottom).inset(-26)
            make.height.equalTo(22)
        }
    }
    override func updateConstraints() {
        grayBackgroundView.snp.remakeConstraints { make in
            let height: CGFloat = (isOpened ? 216 : 72)
            heightConstraint =  make.height.equalTo(height).constraint//(height)
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 16))
        }
        super.updateConstraints()
    }
    
    @objc func openCell()  {
        isOpened.toggle()
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.chevronButton.setImage(UIImage(systemName: self.isOpened ? "chevron.up" : "chevron.down"),for: .normal)
            if let completion = self.completionOpenCell {
                completion()
            }
        }
        
        for outlet in self.hiddenOutlets {
            outlet.isHidden = !self.isOpened
        }
    }
    
    @objc func showCell() {
        if let compliton = completionShowCell {
            compliton()
        }
     }
    
}
