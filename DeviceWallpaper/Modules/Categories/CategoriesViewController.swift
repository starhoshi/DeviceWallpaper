//
//  CategoriesViewController.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    let tableView = UITableView(frame: .zero, style: .plain)
    var presenter: CategoriesPresentation!
    var wallpapers: [CategoriesType] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Menu"
        view = tableView
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CategoriesViewController: CategoriesView {
    func showWallpapers(_ wallpapers: [CategoriesType]) {
        self.wallpapers = wallpapers
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        log?.debug(indexPath)
    }
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wallpapers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = wallpapers[indexPath.row].title
        return cell
    }
}
