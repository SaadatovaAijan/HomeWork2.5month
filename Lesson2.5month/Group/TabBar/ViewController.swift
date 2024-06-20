//
//  ViewController.swift
//  Lesson2.5month
//
//  Created by Aijan Saadatova on 13/6/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private lazy var mainTabBar: MainTabBar = {
        let view = MainTabBar()
        view.setup(backgroundColor: .systemBlue, images: ["house", "plus.circle", "person"])
        view.layer.cornerRadius = 20
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.isHidden = true
        setupConstraints()
        configureViewControllers()
    }

    private func setupConstraints() {
        view.addSubview(mainTabBar)
        mainTabBar.translatesAutoresizingMaskIntoConstraints = false
        mainTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        mainTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        mainTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        mainTabBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func configureViewControllers() {
        var homeView = HomeView()
        homeView.title = "Home"
        let vc1 = UINavigationController(rootViewController: homeView)
        
        var expendsAddView = ExpendsAddView()
        expendsAddView.title = "Expends"
        let vc2 = UINavigationController(rootViewController: expendsAddView)
        
        var profileView = ProfileView()
        profileView.title = "Profile"
        let vc3 = UINavigationController(rootViewController: profileView)
        
        viewControllers = [vc1, vc2, vc3]
    }
    
}

extension MainTabBarController: MainTabBarDelegate {
    func didTabButtonTap(tag: Int) {
        selectedIndex = tag
    }
}
