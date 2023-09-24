//
//  NewsFeedTableViewCell.swift
//  VKApplication
//
//  Created by Дмитрий Пономарев on 17.06.2023.
//


import UIKit

final class CustomCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        alcoNameLabel.text = nil
    }
    
    //MARK: - UI properties
    
    private let alcoNameLabel = UILabel()
    
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configureView(_ itemModel: Model) {
        
        alcoNameLabel.text = itemModel.alcoName
    }
}


//MARK: - Private methods

private extension CustomCell {
    
    //MARK: - setup UI
    
    func setup() {
        setupViews()
        addViews()
        makeConstraints()
        
    }
    
    //MARK: - addViews
    
    func addViews() {
        contentView.addSubview(alcoNameLabel)
    }
    
    //MARK: - makeConstraints
    
    func makeConstraints() {
        
        alcoNameLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
    
    //MARK: - setupViews
    
    func setupViews() {
        alcoNameLabel.numberOfLines = 0
    }
}
