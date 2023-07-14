//
//  SectionHeader.swift
//  HW-14_Ruslan
//
//  Created by Ruslan Medetbayev on 14.07.2023.
//

import UIKit
import SnapKit

class SectionHeader: UICollectionReusableView {

    static let identifier = "SectionHeader"

    // MARK: - Outlets

    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(title)
    }

    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
        
}
