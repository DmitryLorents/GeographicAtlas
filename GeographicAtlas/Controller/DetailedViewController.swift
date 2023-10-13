//
//  DetailedViewController.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit
import SkeletonView

final class DetailedViewController: UIViewController {
    
    //MARK:  - Constants, variables & outlets
    private let heightOfStandardRow: CGFloat = 70
    private var heightOfSixthRow: CGFloat  = 70
    private var heightOfFifthRow: CGFloat  = 70
    
    private var  country: Country? {
        didSet {
            //increase cell height in case of multy line string
            self.heightOfSixthRow = heightOfStandardRow + CGFloat(20 * ((self.country?.timezones.count ?? 1)-1))
            self.heightOfFifthRow = heightOfStandardRow + CGFloat(20 * ((self.country?.currencies?.dictionary.count ?? 1)-1))
            DispatchQueue.main.async {
                //set view appearance
                self.view.hideSkeleton(transition: .crossDissolve(1))
                self.tableViewDetailed.reloadData()
                self.title = self.country?.name.common
                //get image
                let urlString =   self.country?.flags.png ?? ""
                let imageURL = URL(string: urlString)
                self.imageViewCountry.kf.setImage(with: imageURL )
                
            }
        }
    }
    private var tableData: [(name: String, value: String)]? = nil
    private let networkManager = DownloadManager()
    private let textFormatter = TextFormatter()
    private var imageViewCountry: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius  = 8
        imageView.isSkeletonable = true
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    private lazy var tableViewDetailed: UITableView = {
        let table = UITableView()
        table.isSkeletonable = true
        table.register(DetailedTableViewCell.self, forCellReuseIdentifier: DetailedTableViewCell.reuseID)
        table.estimatedRowHeight = heightOfStandardRow
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    
    //MARK: - Init
    
    init(CCA2: String) {
        super.init(nibName: nil, bundle: nil)
        view.showAnimatedGradientSkeleton(transition: .crossDissolve(1))
        networkManager.getCountriesInfo(CCA2: CCA2) { result in
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let countries):
                self.country = countries.first
            }
        }
        
    }
    
    init(country: Country?) {
        super.init(nibName: nil, bundle: nil)
        self.country = country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupBackButton()
        setConstraints()
    }
    
    //MARK: - Functions
    
    private func setViews()  {
        view.isSkeletonable = true
        view.backgroundColor = .systemBackground
        view.addSubview(tableViewDetailed)
        view.addSubview(imageViewCountry)
    }
    
    private func setConstraints() {
        
        imageViewCountry.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(imageViewCountry.snp.width).multipliedBy(0.5625)
        }
        
        tableViewDetailed.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(imageViewCountry.snp.bottom).inset(-22)
        }
    }
    //create String data for cell's labels
    private func setDataForCell(index: IndexPath) -> (topText: String, bottomText: String?) {
        switch index.row {
        case 0: return ("Region", country?.region.rawValue )
        case 1:
            let capital: String = country?.capital?.first ?? "No data"
            return ("Capital", capital )
        case 2:
            let coordinatesString = textFormatter.coordinates(country?.capitalInfo.latlng)
            return ("Capital coordinates", coordinatesString )
        case 3:
            let population = country?.population ?? 0
            let populationString = textFormatter.population(population)
            return ("Population", populationString )
        case 4:
            let area = country?.area
            let areaString = textFormatter.area(area)
            return ("Area", areaString)
        case 5:
            let currency = country?.currencies
            let currencyString = textFormatter.currencies(currency)
            return ("Currency", currencyString )
        case 6:  let timeZoneString = TextFormatter().timeZones(country?.timezones)
            return ("Timezones", timeZoneString )
        default: return ("TopText", "BottomText" )
        }
        
    }
    
    private func setupBackButton() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(backButtonAction))
    }
    
    @objc private func backButtonAction()  {
        navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - TableView delegate

extension DetailedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 5: return heightOfFifthRow
        case 6: return heightOfSixthRow
        default: return heightOfStandardRow
        }
    }
    
}

//MARK: - TableView skeleton data source

extension DetailedViewController: SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        DetailedTableViewCell.reuseID
    }
}

//MARK: - TableView datasource

extension DetailedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailedTableViewCell.reuseID, for: indexPath) as? DetailedTableViewCell else {return .init() }
        let dataForCell = setDataForCell(index: indexPath)
        cell.setup(dataForCell)
        return cell
    }
    
    
}
