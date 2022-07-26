//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var stargazersLabel: UILabel!
    @IBOutlet weak var wachersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    
    var repository: GitRepository? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setText()
        getImage()
    }
    
    private func setText() {
        
        guard let repository = repository else { return }
        
        titleLabel.text = repository.fullName ?? ""
        languageLabel.text = "Written in \(repository.language ?? "")"
        stargazersLabel.text = "\(repository.stargazersCount ?? 0) stars"
        wachersLabel.text = "\(repository.watchersCount ?? 0) watchers"
        forksLabel.text = "\(repository.forksCount ?? 0) forks"
        issuesLabel.text = "\(repository.openIssuesCount ?? 0) open issues"
    }
    
    private func getImage(){
        
        guard let owner = repository?.owner else { return }
        guard let imageURLString = owner.avatarURL else { return }
        guard let imageURL = URL(string: imageURLString) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { (data, res, err) in
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        .resume()
    }
    
}
