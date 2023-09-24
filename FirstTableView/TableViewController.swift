//
//  ViewController.swift
//  FirstTableView
//
//  Created by Дмитрий Пономарев on 06.09.2022.
//

import UIKit
import SnapKit

final class TableViewController: UIViewController {
    
//  MARK: - Properties
    
    private let tableView = UITableView()
    private var exampleOfCell: [Model] = [Model(alcoName: "Gin"), Model(alcoName: "whiski"), Model(alcoName: "wine"), Model(alcoName: "liqueur") ]
    
//  MARK: - LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupView()
        makeConstraints()
    }
}

//MARK: - Extension ViewController

private extension TableViewController {
   
//    MARK: - AddViews
    
    func addViews() {
        view.addSubview(tableView)
        makeConstraints()
        setupView()

    }
    
//  MARK: - makeConstraint
    
    func makeConstraints() {
        tableView.snp.makeConstraints {
            $0 .edges.equalToSuperview()
        }
    }
    
//    MARK: - setupViews
    
    func setupView() {
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    }
}

//  MARK: - Extension DataSource


extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exampleOfCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell  else {
            return UITableViewCell() }
        let cellWithModel = exampleOfCell[indexPath.row]
        cell.configureView(cellWithModel)
        return cell
    }
}

