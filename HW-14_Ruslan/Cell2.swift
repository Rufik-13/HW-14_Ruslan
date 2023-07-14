//
//  Cell2.swift
//  HW-14_Ruslan
//
//  Created by Ruslan Medetbayev on 14.07.2023.
//

import UIKit

class Cell2: UICollectionViewCell {
    
    static let identifier = "cell2"
    
    
    func configuration(model: Model) {
        self.image.image = UIImage(systemName: model.image)
        cellNameLabel.text = model.label
        imageCountLabel.text = model.countLabel
    }
    
    
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.contentMode = .center
        return imageView
    }()
    
    public lazy var cellNameLabel: UILabel = {
        let leftlabel = UILabel()
        leftlabel.textColor = .systemBlue
        leftlabel.font = .systemFont(ofSize: 20, weight: .regular)
        return leftlabel
    }()

    private lazy var imageCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .systemGray
        return imageView
    }()




    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Error")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        
    }

    // MARK: - Setup

    private func setupViews() {
        contentView.addSubview(image)
        contentView.addSubview(cellNameLabel)
        contentView.addSubview(imageCountLabel)
        contentView.addSubview(arrowImage)
        
    }

    private func setupConstraints() {
        image.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)
        }
        cellNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
        }
        arrowImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.height.equalTo(16)
            make.width.equalTo(8)
        }
        imageCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(arrowImage.snp.leading).offset(-5)
            make.centerY.equalToSuperview()
        }
        
    }
    
}

