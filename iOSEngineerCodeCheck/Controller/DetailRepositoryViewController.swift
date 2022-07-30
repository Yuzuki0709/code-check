//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import Kingfisher
import SafariServices

class DetailRepositoryViewController: UIViewController {
    
    static let identifier = "DetailRepositoryViewController"
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var stargazersLabel: UILabel!
    @IBOutlet weak var wachersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    
    @IBOutlet weak var goWebButton: UIButton!
    
    // 表示するレポジトリ
    var repository: GitRepository? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goWebButton.addTarget(self, action: #selector(goWebButtonTapped(_:)), for: .touchUpInside)
        
        setText()
        avatarImageGet()
    }
    
    
    /// それぞれのUILabelにテキストをセットする関数
    private func setText() {
        
        guard let repository = repository else { return }
        
        titleLabel.text = repository.fullName ?? ""
        stargazersLabel.text = "\(repository.stargazersCount ?? 0) stars"
        wachersLabel.text = "\(repository.watchersCount ?? 0) watchers"
        forksLabel.text = "\(repository.forksCount ?? 0) forks"
        issuesLabel.text = "\(repository.openIssuesCount ?? 0) open issues"
        
        // 言語が空だったら何も表示しない
        if let language = repository.language {
            languageLabel.text = "Written in \(language)"
        } else {
            languageLabel.text = ""
        }
    }
    
    /// レポジトリのオーナーのアバター画像をセットする関数
    private func avatarImageGet(){
        
        guard let owner = repository?.owner else { return }
        guard let imageURLString = owner.avatarURL else { return }
        guard let imageURL = URL(string: imageURLString) else { return }
        
        avatarImageView.kf.setImage(with: imageURL)
    }
    
    @objc private func goWebButtonTapped(_ sender: UIButton) {
        guard let urlString = repository?.htmlURL,
              let url = URL(string: urlString) else { return }
        
        // レポジトリの詳細をSafariで表示する
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        
        present(safariViewController, animated: true)
    }
}

extension DetailRepositoryViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}
