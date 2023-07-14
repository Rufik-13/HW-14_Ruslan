//
//  ImageOops.swift
//  Shturm
//
//  Created by Ruslan Medetbayev on 13.07.2023.
//

import UIKit

class ImageOops: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "oops")
        setupBackgroundViews()
    }
    

    private func setupBackgroundViews() {
        let backgroundImage1 = UIImageView(image: UIImage(named: "oops"))
        view.addSubview(backgroundImage1)
        backgroundImage1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
    }

}
