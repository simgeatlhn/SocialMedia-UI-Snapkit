//
//  LogoView.swift
//  SocialMedia-UI
//
//  Created by simge on 7.03.2023.
//

import UIKit
import SnapKit

class LogoView: UIView {
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Constants
    private enum UIConstants {
        static let logoWidth: CGFloat = 104
        static let logoHeight: CGFloat = 30
    }
    
    func configure() {
        addSubview(imageView)
        makeImageView()
    }
    
    private var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "instagram-logo")
        return view
    }()
}

private extension LogoView {
    private func makeImageView() {
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstants.logoWidth)
            make.height.equalTo(UIConstants.logoHeight)
        }
    }
}
