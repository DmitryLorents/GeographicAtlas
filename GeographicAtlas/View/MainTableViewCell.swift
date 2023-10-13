//
//  MainTableViewCell.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class MainTableViewCell: UITableViewCell {
    
    //MARK: - Constants and variables
    static let reuseID = String(describing: MainTableViewCell.self)
    private let textFormatter = TextFormatter()
    private var isOpened: Bool = false
    var completionOpenCell: (() -> Void)?
    var completionShowCell: (() -> Void)?
    private var heightConstraint: Constraint!
    
    private var grayBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainViewBackground
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.isSkeletonable = true
        return view
    }()
    
    private var imageViewFlag: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.isSkeletonable = true
        return view
    }()
    
    private var chevronButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.down")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.isUserInteractionEnabled = true
        button.isSkeletonable = true
        return button
    }()
    
    private var labelCountry: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.text = "Country"
        label.isSkeletonable = true
        return label
    }()
    
    private var labelCapital: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .capitalLabel
        label.text = "Capital"
        label.isSkeletonable = true
        return label
    }()
    
    private var labelPopulation: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .capitalLabel
        label.text = "Population:"
        label.isHidden = true
        label.isSkeletonable = true
        return label
    }()
    private var labelPopulationValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .black
        label.text = "No data"
        label.isHidden = true
        label.isSkeletonable = true
        return label
        
    }()
    
    private var labelArea: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .capitalLabel
        label.text = "Area:"
        label.isHidden = true
        label.isSkeletonable = true
        return label
    }()
    private var labelAreaValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .black
        label.text = "No data"
        label.isHidden = true
        label.isSkeletonable = true
        return label
    }()
    private var labelCurrencies: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .capitalLabel
        label.text = "Currencies:"
        label.isHidden = true
        label.isSkeletonable = true
        return label
    }()
    private var labelCurrenciesValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .black
        label.text = "No data"
        label.isHidden = true
        label.isSkeletonable = true
        return label
    }()
    
    private var learnMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.setTitle("Learn more", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 20)
        button.isHidden = true
        button.isSkeletonable = true
        return button
    }()
    //use to hide views
    private lazy var hiddenOutlets: [UIView] = {
        [labelPopulation, labelPopulationValue, labelArea, labelAreaValue, labelCurrencies, labelCurrenciesValue, learnMoreButton]
    }()
    
    //MARK: - Load view
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.isOpened = false
        updateConstraints()
    }
    
    //MARK: - Methods
    
    //set cell data
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
        setChevronButtonImage()
        
    }
    
    private func setViews() {
        self.isSkeletonable = true
        chevronButton.addTarget(nil, action: #selector(openCell), for: .touchUpInside)
        learnMoreButton.addTarget(nil, action: #selector(showCell), for: .touchUpInside)
        contentView.isSkeletonable = true
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
            let height: CGFloat = (isOpened ? 216 : 72)
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 16))
            heightConstraint =  make.height.equalTo(height).constraint
        }
        
        imageViewFlag.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(12)
            make.width.equalTo(82)
            make.height.equalTo(imageViewFlag.snp.width).multipliedBy(48.0/82.0)
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
        
        //resize cell when open button tapped
        grayBackgroundView.snp.remakeConstraints { make in
            let height: CGFloat = (isOpened ? 216 : 72)
            heightConstraint =  make.height.equalTo(height).constraint
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 16))
        }
        super.updateConstraints()
    }
    
    private func setChevronButtonImage() {
        self.chevronButton.setImage(UIImage(systemName: self.isOpened ? "chevron.up" : "chevron.down"),for: .normal)
    }
    
    @objc private func openCell()  {
        isOpened.toggle()
        setChevronButtonImage()
        UIView.animate(withDuration: 0.3, delay: 0) {
            if let completion = self.completionOpenCell {
                completion()
            }
        }
        
        for outlet in self.hiddenOutlets {
            outlet.isHidden = !self.isOpened
        }
    }
    
    @objc private func showCell() {
        if let compliton = completionShowCell {
            compliton()
        }
    }
    
}
