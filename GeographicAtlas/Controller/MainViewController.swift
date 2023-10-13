//
//  ViewController.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit
import SnapKit
import SkeletonView

final class MainViewController: UIViewController {
    
    //MARK:  - Constants, variables & outlets
    
    private var countriesSorted: [String: Countries]? {
        didSet {
            print("Countries downloaded")
            tableViewCountries.hideSkeleton(transition: .crossDissolve(1))
            
            self.tableViewCountries.reloadData()
        }
    }
    
    private let networkManager = DownloadManager()
    private lazy var tableViewCountries: UITableView = {
        let table = UITableView()
        table.isSkeletonable = true
        table.dataSource = self
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseID)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 84
        table.separatorStyle = .none
        return table
    }()
    
    //MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        fetchCountries()
        
        
    }
    //MARK: - Functions
    private func setViews()  {
        
        view.backgroundColor = .systemBackground
        title = "World countries"
        view.addSubview(tableViewCountries)
    }
    
    private func setConstraints() {
        
        tableViewCountries.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func fetchCountries() {
        tableViewCountries.showAnimatedGradientSkeleton()
        networkManager.getCountriesInfo(CCA2: nil) { result in
            switch result {
            case.failure(let error): print(error.localizedDescription)
            case.success(let resultCountries):
                DispatchQueue.main.async {
                    self.countriesSorted = self.networkManager.sorting(resultCountries)
                }
            }
        }
    }
    
}

//MARK: -Skeleton Data Source

extension MainViewController: SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        MainTableViewCell.reuseID
        
    }
}

//MARK: - TableView datasource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Region.key(for: section).uppercased()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        countriesSorted?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Region.key(for: section)
        guard let countriesSorted else {return 0}
        let countriesArray = countriesSorted[key]
        return countriesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID) as? MainTableViewCell else {return .init()}
        let key = Region.key(for: indexPath.section)
        
        guard let countryArray = countriesSorted?[key] else {return .init() }
        let country = countryArray[indexPath.row]
        cell.setup(with: country)
        cell.completionOpenCell = {
            tableView.performBatchUpdates {
                cell.updateConstraints()
            }
            cell.completionShowCell = { [weak self] in
                guard let self else {return}
                let key = Region.key(for: indexPath.section)
                guard let countryArray = self.countriesSorted?[key] else {
                    print("No countryArray")
                    return }
                let country = countryArray[indexPath.row]
                let detailedVC = DetailedViewController(CCA2: country.cca2)
                self.navigationController?.pushViewController(detailedVC, animated: true)
            }
        }
        return cell
    }
}
