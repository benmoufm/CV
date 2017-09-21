//
//  FormationViewController.swift
//  CV
//
//  Created by Mélodie Benmouffek on 14/09/2017.
//  Copyright © 2017 Mélodie Benmouffek. All rights reserved.
//

import Foundation
import UIKit

class FormationViewController: UIViewController,
    FormationViewContract,
    FormationCollectionViewDataSourceDelegate {

    var presenter: FormationPresenter?
    let navigationBar = UINavigationBar()
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
    let dataSource = FormationCollectionViewDataSource()
    let formationIntroductionLabel = UILabel()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "formation_navigation_title_text".localized
        tabBarItem.title = "formation_navigation_title_text".localized
        tabBarItem.image = #imageLiteral(resourceName: "schoolIcon")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - FormationViewContract

    func configure(with viewModel: FormationControllerViewModel) {
        formationIntroductionLabel.text = viewModel.formationIntroductionText
        dataSource.update(with: viewModel.collectionView)
        collectionView.reloadData()
    }

    // MARK: - FormationCollectionViewDataSourceDelegate

    func formationCollectionViewDataSource(_ dataSource: FormationCollectionViewDataSource) {
        let formationDetailViewController = ViewControllerFactory.sharedInstance.formationDetailViewController()
        navigationController?.pushViewController(formationDetailViewController, animated: true)
    }

    func reloadFormationCollectionViewDataSource(_ dataSource: FormationCollectionViewDataSource) {
        collectionView.reloadData()
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.navigationTitleTextColor]
    }

    private func setupFormationIntroductionLabel() {
        formationIntroductionLabel.numberOfLines = 0
        formationIntroductionLabel.textAlignment = .center
        formationIntroductionLabel.textColor = UIColor.textColor
    }

    private func setupCollectionView() {
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = view.backgroundColor
        dataSource.configure(collectionView)
        dataSource.delegate = self
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
    }

    private func setupLayout() {
        view.addSubview(navigationBar)
        view.addSubview(formationIntroductionLabel)
        view.addSubview(collectionView)

        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 130.0).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        formationIntroductionLabel.translatesAutoresizingMaskIntoConstraints = false
        formationIntroductionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formationIntroductionLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
    }

    private func setup() {
        view.backgroundColor = UIColor.backgroundColor
        setupNavigationBar()
        setupFormationIntroductionLabel()
        setupCollectionView()
        setupLayout()
    }
}
