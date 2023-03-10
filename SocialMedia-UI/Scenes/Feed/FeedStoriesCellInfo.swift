//
//  FeedStoriesCellInfo.swift
//  SocialMedia-UI
//
//  Created by simge on 7.03.2023.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
