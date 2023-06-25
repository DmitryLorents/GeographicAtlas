//
//  ViewController.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit
import SnapKit
import SkeletonView

class MainViewController: UIViewController {
    
    //MARK:  - Constants, variables & outlets
    
    var countriesSorted: [String: Countries]? {
        didSet {
            print("Countries downloaded")
            tableViewCountries.hideSkeleton(transition: .crossDissolve(1))
            //activitiIndicator.stopAnimating()
//            UIView.animate(withDuration: 1, delay: 0) {
//                self.tableViewCountries.alpha = 1
//            }
            
            self.tableViewCountries.reloadData()
        }
    }
    
    let networkManager = DownloadManager()
    
    let activitiIndicator =  UIActivityIndicatorView(style: .large)
    var tableViewCountries: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isSkeletonable = true
        return table
    }()
    let smallCellHeight: CGFloat = 84
    let bigCellHeight: CGFloat = 228
    
    //MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        setOutlets()
        setConstraints()
        fetchCountries()
        
        
    }
    //MARK: - Functions
    private func setOutlets()  {
        
        view.backgroundColor = .systemBackground
        title = "World countries"
        
        tableViewCountries.delegate = self
        tableViewCountries.dataSource = self
        tableViewCountries.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: MainTableViewCell.reuseID)
        tableViewCountries.rowHeight = UITableView.automaticDimension
        tableViewCountries.estimatedRowHeight = smallCellHeight
        view.addSubview(tableViewCountries)
        tableViewCountries.separatorStyle = .none
        
        activitiIndicator.translatesAutoresizingMaskIntoConstraints = false
        activitiIndicator.hidesWhenStopped  = true
        view.addSubview(activitiIndicator)
    }
    
    private func setConstraints() {
        
        tableViewCountries.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        activitiIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func fetchCountries() {
        tableViewCountries.showAnimatedGradientSkeleton()
//        activitiIndicator.startAnimating()
//        UIView.animate(withDuration: 0.5, delay: 0) {
//            self.tableViewCountries.alpha = 0.3
//        }
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

//MARK: - TableView delegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        guard let countriesSorted = countriesSorted else {return 0}
        let countriesArray = countriesSorted[key]
        return countriesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID) as? MainTableViewCell else {return UITableViewCell()}
        let key = Region.key(for: indexPath.section)
        
        guard let countryArray = countriesSorted?[key] else {return UITableViewCell() }
        let country = countryArray[indexPath.row]
        cell.setup(with: country)
        cell.completionOpenCell = {
            tableView.performBatchUpdates {
                cell.updateConstraints()
            }
            cell.completionShowCell = { [weak self] in
                guard let self = self else {return}
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
