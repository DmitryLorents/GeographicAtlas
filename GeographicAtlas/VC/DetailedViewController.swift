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
    var imageViewCountry: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius  = 8
        return imageView
    }()
    var tableViewDetailed: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
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
        setupBackButton()
        setConstraints()
        
       
    }
    //MARK: - Functions
    private func setOutlets()  {
        view.backgroundColor = .systemBackground
        
        imageViewCountry.backgroundColor = .systemGray6
        view.addSubview(imageViewCountry)
        
        tableViewDetailed.delegate = self
        tableViewDetailed.dataSource = self
        tableViewDetailed.backgroundColor = .cyan
        view.addSubview(tableViewDetailed)
    }
    
    private func setConstraints() {
        
        imageViewCountry.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(193)
        }
        
        tableViewDetailed.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(imageViewCountry.snp.bottom).inset(-22)
        }
    }
    
    private func setupBackButton() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(backButtonAction))
    }

    @objc func backButtonAction()  {
        navigationController?.popViewController(animated: true)
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
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
   
}
