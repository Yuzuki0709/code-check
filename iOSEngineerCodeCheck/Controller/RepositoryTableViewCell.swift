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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func setup(repository: GitRepository) {
        nameLabel.text = repository.fullName
        detailLabel.text = repository.language
    }
}
