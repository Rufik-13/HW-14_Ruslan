//
//  Model.swift
//  HW-14_Ruslan
//
//  Created by Ruslan Medetbayev on 14.07.2023.
//

import Foundation


struct Model {
    let image: String
    let label: String
    let countLabel: String
}

extension Model {
    static let models: [[Model]] = [
        [Model(image: "image1", label: "Recents", countLabel: "99"),
         Model(image: "image2", label: "Friends", countLabel: "99"),
         Model(image: "image3", label: "Favorites", countLabel: "99"),
         Model(image: "image4", label: "Nature", countLabel: "99"),
         Model(image: "image5", label: "Vacation", countLabel: "99")
        ],
        [Model(image: "video", label: "Videos", countLabel: "99"),
         Model(image: "person.crop.square", label: "Selfies", countLabel: "99"),
         Model(image: "cube", label: "Portrait", countLabel: "99"),
         Model(image: "pano", label: "Panoramas", countLabel: "99"),
         Model(image: "square.3.layers.3d.down.right", label: "Bursts", countLabel: "99"),
         Model(image: "camera.metering.center.weighted", label: "Screenshots", countLabel: "99"),
         Model(image: "record.circle", label: "Screen Recordings", countLabel: "99")
        ],
        [Model(image: "square.and.arrow.down", label: "Imports", countLabel: "99"),
         Model(image: "eye.slash", label: "Hidden", countLabel: "99"),
         Model(image: "trash", label: "Recently deleted", countLabel: "99")
        ]
    ]
}
