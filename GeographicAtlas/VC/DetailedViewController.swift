//
//  DetailedViewController.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import UIKit

final class DetailedViewController: UIViewController {

    //MARK:  - Constants, variables & outlets
    var  country: Country?
    var tableViewDetailed: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .yellow
        return table
    }()
    
    //MARK: - Init
    
    init(country: Country) {
        super.init(nibName: nil, bundle: nil)
        self.title = "Country name"
        self.country = country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        setOutlets()
        setConstraints()
        
       
    }
    //MARK: - Functions
    private func setOutlets()  {
        view.backgroundColor = .systemBackground
        
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
