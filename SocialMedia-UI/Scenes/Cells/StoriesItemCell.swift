//
//  StoriesItemCell.swift
//  SocialMedia-UI
//
//  Created by simge on 7.03.2023.
//

import UIKit
import SnapKit

class StoriesItemCell: UICollectionViewCell {
    
    func configure(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image //data
        usernameLabel.text = info.username
        plusButton.isHidden = info.isAddButtonVisible
        circleImageView.isHidden = info.isNewStory
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum UIConstans {
        static let imageView: CGFloat = 60
        static let imageToInset: CGFloat = 6
        static let labelToCellInset: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        static let usernameFontSize: CGFloat = 12
        static let plusButtonSize: CGFloat = 20
        static let circleSize: CGFloat = 72
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstans.imageView / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstans.usernameFontSize)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "add-story-button"), for: .normal)
        return button
    }()
    
    private let circleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "story-ring")
        return view
    }()
}

private extension StoriesItemCell {
    func initialize() {
        addSubview(imageView)
        addSubview(usernameLabel)
        addSubview(plusButton)
        addSubview(circleImageView)
        
        makeImageView()
        makeUserName()
        makePlusButton()
        makeCircleImageView()
    }
}

private extension StoriesItemCell {
    func makeImageView() {
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstans.imageView)
            make.leading.top.trailing.equalToSuperview().inset(UIConstans.imageToInset)
        }
    }
    
    func makeUserName() {
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstans.labelToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstans.imageToLabelOffset)
            
        }
    }
    
    func makePlusButton() {
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(UIConstans.plusButtonSize)
            
        }
    }
    
    func makeCircleImageView() {
        circleImageView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(UIConstans.circleSize)
        }
    }
}
