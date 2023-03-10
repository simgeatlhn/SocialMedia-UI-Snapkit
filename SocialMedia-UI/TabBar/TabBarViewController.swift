//
//  TabBarViewController.swift
//  SocialMedia-UI
//
//  Created by simge on 7.03.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
       
        let vc1 = UINavigationController(rootViewController: FeedViewController())
       
        let vc2 = UINavigationController(rootViewController: FeedViewController())
    
        let vc3 = UINavigationController(rootViewController: FeedViewController())
        
        let vc4 = UINavigationController(rootViewController: FeedViewController())
        
        let vc5 = UINavigationController(rootViewController: FeedViewController())
  
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.backgroundColor =  .white
        self.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        guard let items = self.tabBar.items else { return }
        let images = ["house.fill","magnifyingglass", "plus.app", "play.laptopcomputer", "person.fill"]
        for item  in 0..<items.count {
            items[item].image = UIImage(systemName: images[item])
        }
    }
}
