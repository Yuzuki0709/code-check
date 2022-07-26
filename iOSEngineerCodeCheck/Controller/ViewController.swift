//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var repositoryTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var repositorys: [GitRepository] = [] {
        didSet {
            self.repositoryTableView.reloadData()
        }
    }
    
    var selectionRepository: GitRepository? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.placeholder = "GitHubのリポジトリを検索できるよー"
        searchBar.delegate = self
        
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Detail"{
            guard let destination = segue.destination as? DetailViewController else { return }
            guard let selectionRepository = selectionRepository else { return }

            destination.repository = selectionRepository
        }
        
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // ↓こうすれば初期のテキストを消せる
        searchBar.text = ""
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let word = searchBar.text,
              !word.isEmpty else { return }
        
        GitAPI.searchRepository(keyword: word) { repositorys in
            self.repositorys = repositorys
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositorys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = repositoryTableView.dequeueReusableCell(
            withIdentifier: RepositoryTableViewCell.identifier,
            for: indexPath
        ) as? RepositoryTableViewCell else { return UITableViewCell() }
        
        let repository = repositorys[indexPath.row]
        cell.setup(repository: repository)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 画面遷移時に呼ばれる
        selectionRepository = repositorys[indexPath.row]
        performSegue(withIdentifier: "Detail", sender: self)
        
    }
}
