//
//  HomeView.swift
//  Lesson2.5month
//
//  Created by Aijan Saadatova on 13/6/24.
//

import UIKit

class HomeView: UIViewController {
    
    private lazy var homeBottomView: HomeBottomView = {
        let view = HomeBottomView()
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(homeBottomView)
        homeBottomView.translatesAutoresizingMaskIntoConstraints = false
        homeBottomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:
                                                300).isActive = true
        homeBottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        homeBottomView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        homeBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

class HomeBottomView: UIView {
    
    private lazy var horizontalCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "hor_cell")
        return view
    }()
    
    private lazy var verticalCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ver_cell")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(horizontalCollectionView)
        addSubview(verticalCollectionView)
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        horizontalCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        horizontalCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        horizontalCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        horizontalCollectionView.heightAnchor.constraint(equalToConstant: frame.width / 3).isActive =
        true
        
        verticalCollectionView.topAnchor.constraint(equalTo: horizontalCollectionView.topAnchor, constant: 20).isActive = true
        verticalCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        verticalCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        verticalCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension HomeBottomView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == horizontalCollectionView {
            return 5
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == horizontalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hor_cell", for: indexPath)
            cell.backgroundColor = .green
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ver_cell", for: indexPath)
            cell.backgroundColor = .purple
            return cell
        }
    }
}

extension HomeBottomView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.width / 3)
    }
}

class A: UICollectionViewCell {
    static var reuseId = "hor_cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
                   
    }
}

class B: UICollectionViewCell {
    static var reuseld = "ver_cell"
    
    override init(frame: CGRect) {
        super.init (frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented" )
    }
}
