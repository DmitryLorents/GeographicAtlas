//
//  DetailedViewController.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit

class DetailedViewController: UIViewController {

    //MARK:  - Constants, variables & outlets
    var tableViewDetailed: UITableView = {
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
        tableViewDetailed.delegate = self
        tableViewDetailed.dataSource = self
    }
    
    private func setConstraints() {
        
    }


}

//MARK: - TableView delegate

extension DetailedViewController: UITableViewDelegate {
    
}

//MARK: - TableView datasource

extension DetailedViewController: UITableViewDataSource {
    
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
