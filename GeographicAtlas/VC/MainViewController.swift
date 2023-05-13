//
//  ViewController.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    //MARK:  - Constants, variables & outlets
    
    var countries: Countries? {
        didSet  {
            print("Countries downloaded")
            activitiIndicator.stopAnimating()
            UIView.animate(withDuration: 1, delay: 0) {
                self.tableViewCountries.alpha = 1
            }
            
            self.tableViewCountries.reloadData()
        }
    }
    let networkManager = DownloadManager()
    
    let activitiIndicator =  UIActivityIndicatorView(style: .large)
    var tableViewCountries: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
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
        view.addSubview(tableViewCountries)
        tableViewCountries.backgroundColor = .yellow
        
        activitiIndicator.translatesAutoresizingMaskIntoConstraints = false
        activitiIndicator.hidesWhenStopped  = true
        //activitiIndicator.color = .systemBlue
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
        
        activitiIndicator.startAnimating()
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.tableViewCountries.alpha = 0.3
        }
        networkManager.getCountries { result in
            switch result {
            case.failure(let error): print(error.localizedDescription)
            case.success(let resultCountries):
                
                DispatchQueue.main.async {
                    self.countries = resultCountries
                }
            }
        }
    }
    
}

//MARK: - TableView delegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let detaoledVC = DetailedViewController(country: nil)
                navigationController?.pushViewController(detaoledVC, animated: true)
//        countries?.forEach({ country in
//            print(country.name)
//        })
    }
}

//MARK: - TableView datasource

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID) as? MainTableViewCell else {return UITableViewCell()}
        //cell.setup(with: Country())
        return cell
    }
    
}
