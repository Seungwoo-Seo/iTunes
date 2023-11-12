//
//  SearchViewController.swift
//  iTunes
//
//  Created by 서승우 on 2023/11/10.
//

import UIKit

final class SearchViewController: BaseViewController {
    lazy var searchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "게임, 앱, 스토리 등"
        controller.searchBar.delegate = self
        return controller
    }()
    lazy var tableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.dataSource = self
        view.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.identifier)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func bind() {

    }

    override func initialAttributes() {
        super.initialAttributes()

        view.backgroundColor = .systemBackground

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "검색"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }

    override func initialHierarchy() {
        super.initialHierarchy()

        view.addSubview(tableView)
    }

    override func initialLayout() {
        super.initialLayout()

        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchResultCell.identifier,
            for: indexPath
        ) as? SearchResultCell else {return UITableViewCell()}

        cell.textLabel?.text = "\(indexPath)"
        
        return cell
    }

}

extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }

}

