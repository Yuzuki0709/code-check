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
    
    // APIで受け取るレポジトリの配列
    var repositorys: [GitRepository] = [] {
        didSet {
            self.repositoryTableView.reloadData()
        }
    }
    
    // 画面遷移時に渡すレポジトリ
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
        
        // テキストが空だったらreturnする
        guard let word = searchBar.text,
              !word.isEmpty else { return }
        
        // GitAPIでレポジトリをサーチする
        GitAPI.searchRepository(keyword: word) { repositorys in
            self.repositorys = repositorys
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositorys.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = repositoryTableView.dequeueReusableCell(
            withIdentifier: RepositoryTableViewCell.identifier,
            for: indexPath
        ) as? RepositoryTableViewCell else { return UITableViewCell() }
        
        let repository = repositorys[indexPath.row]
        
        // RepositoryTableViewCellのsetup関数を呼び出す
        cell.setup(repository: repository)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 画面遷移時に呼ばれる
        selectionRepository = repositorys[indexPath.row]
        performSegue(withIdentifier: "Detail", sender: self)
        
    }
}