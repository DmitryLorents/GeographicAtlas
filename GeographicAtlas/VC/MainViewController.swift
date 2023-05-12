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
    
    var CountryArray: [Country]?
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
    }
    
    private func setConstraints() {
        tableViewCountries.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)

        }
    }


}

//MARK: - TableView delegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detaoledVC = DetailedViewController(country: Country())
        navigationController?.pushViewController(detaoledVC, animated: true)
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
