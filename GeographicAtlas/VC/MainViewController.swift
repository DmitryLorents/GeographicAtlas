//
//  ViewController.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK:  - Constants, variables & outlets
    var tableViewCountries: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .yellow
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
        tableViewCountries.delegate = self
        tableViewCountries.dataSource = self
    }
    
    private func setConstraints() {
        tableViewCountries
    }


}

//MARK: - TableView delegate

extension MainViewController: UITableViewDelegate {
    
}

//MARK: - TableView datasource

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
