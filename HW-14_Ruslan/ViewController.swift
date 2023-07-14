//
//  ViewController.swift
//  HW-14_Ruslan
//
//  Created by Ruslan Medetbayev on 14.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var models: [[Model]]?
    
    
    // MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        collectionView.register(Cell2.self, forCellWithReuseIdentifier: Cell2.identifier)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Albums"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        models = Model.models
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.bottom.equalTo(view)
        }
    }
    
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.45))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(180), heightDimension: .fractionalHeight(0.55))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                     heightDimension: .estimated(60))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 10)
                return sectionLayout
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(50))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                     heightDimension: .estimated(60))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 15, trailing: 10)
                return layoutSection
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(50))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                    heightDimension: .estimated(60))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 10)
                return layoutSection
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.45))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(180), heightDimension: .fractionalHeight(0.5))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                return sectionLayout
            }
        }
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0: return Model.models[section].count
        case 1: return Model.models[section].count
        case 2: return Model.models[section].count
        default: return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = Model.models[indexPath.section][indexPath.row]
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else { fatalError("invalid cell") }
            cell.configuration(model: model)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell2.identifier, for: indexPath) as? Cell2 else { fatalError("invalid cell") }
            cell.configuration(model: model)
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell2.identifier, for: indexPath) as? Cell2 else { fatalError("invalid cell") }
            cell.configuration(model: model)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath)
            
            return cell
        }
    }
    
    func  collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
            header.title.text = "My Albums"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
            header.title.text = "Media Types"
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
            header.title.text = "Utilities"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
            header.title.text = "Albums"
            return header
        }
    }
    
    
}

