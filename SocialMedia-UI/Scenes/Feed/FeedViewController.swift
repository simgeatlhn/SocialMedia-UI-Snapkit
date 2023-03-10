//
//  FeedViewController.swift
//  SocialMedia-UI
//
//  Created by simge on 7.03.2023.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "profile")!, username: "simge", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "profile")!, username: "simge", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "profile")!, username: "simge", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "profile")!, username: "simge", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "profile")!, username: "simge", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "profile")!, username: "simge", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "profile")!, username: "simge", isAddButtonVisible: true, isNewStory: false),
        ]),
        
            .post(FeedPostItemInfo(userImage: UIImage(named: "profile")!, username: "simge", postSubtitle: "Sponsored", postImage: UIImage(named: "post")!, numberOfLikes: 123, comment: CommentShortInfo(username: "simge", commentText: "nice week :)"))),
        
            .post(FeedPostItemInfo(userImage: UIImage(named: "profile")!, username: "simge", postSubtitle: "Sponsored", postImage: UIImage(named: "post")!, numberOfLikes: 123, comment: CommentShortInfo(username: "simge", commentText: "nice week :)"))),
        
            .post(FeedPostItemInfo(userImage: UIImage(named: "profile")!, username: "simge", postSubtitle: "Sponsored", postImage: UIImage(named: "post")!, numberOfLikes: 123, comment: CommentShortInfo(username: "simge", commentText: "nice week :)"))),
        
            .post(FeedPostItemInfo(userImage: UIImage(named: "profile")!, username: "simge", postSubtitle: "Sponsored", postImage: UIImage(named: "post")!, numberOfLikes: 123, comment: CommentShortInfo(username: "simge", commentText: "nice week :)"))),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        drawDesşgn()
    }
    
    func configure () {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        
        tableView.dataSource = self
        tableView.separatorColor = .clear //**
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
    }
    
    func drawDesşgn() {
        view.addSubview(tableView)
        makeTableView()
    }
}


private extension FeedViewController {
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return[logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        
        let favBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(didTapFavButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return[directBarButtonItem, favBarButtonItem]
        
    }
    
    @objc func didTapFavButton() {
        print("fav")
    }
    
    @objc func didTapDirectButton() {
        print("direct")
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Takip ettiklerin", image: UIImage(systemName: "person.2")) {_ in
            print("takip ettiklerim")
        }
        
        let favsItem = UIAction(title: "Fvaoriler", image: UIImage(systemName: "star")) {_ in
            print("Favoriler")
        }
        
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

private extension FeedViewController {
    private func makeTableView() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
            
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}
