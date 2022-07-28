//
//  RepositoryTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 岩本竜斗 on 2022/07/26.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    static let identifier = "RepositoryTableViewCell"
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    /// それぞれのUILabelにテキストをセットする関数
    /// 初期化時必ず呼び出す
    /// - Parameter repository: セットするレポジトリ
    func setup(repository: GitRepository) {
        nameLabel.text = repository.fullName
        detailLabel.text = repository.language
        
        guard let imageURLString = repository.owner?.avatarURL,
              let imageURL = URL(string: imageURLString)
        else { return }
        
        avatarImageView.kf.setImage(with: imageURL)
    }
}
