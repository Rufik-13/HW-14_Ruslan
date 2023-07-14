//
//  Cell.swift
//  HW-14_Ruslan
//
//  Created by Ruslan Medetbayev on 14.07.2023.
//

import UIKit

class Cell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    
    func configuration(model: Model) {
        self.image.image = UIImage(named: model.image)
        self.percentLabel.text = model.label
        
    }
    
    
    
    // MARK: - Oulets
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        image.layer.shadowColor = UIColor.white.cgColor
        image.layer.shadowOpacity = 0.3
        image.layer.shadowOffset = .zero
        image.layer.shadowRadius = 10
        image.layer.shouldRasterize = true
        image.layer.rasterizationScale = UIScreen.main.scale
        
        return image
    }()
    
    lazy var percentLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
//        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    

    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        
        addSubview(mainStack)
        mainStack.addArrangedSubview(image)
        contentView.addSubview(percentLabel)

    }
    
    private func setupLayout() {
        
        mainStack.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(150)
        }
        
        percentLabel.snp.makeConstraints { make in
            make.top.equalTo(mainStack.snp.bottom).offset(5)
            make.leading.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        self.image.image = nil
    }
    
    
    
    
}
