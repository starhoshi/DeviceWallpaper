//
//  WallpaperListViewController.swift
//  DeviceWallpaper
//
//  Created by Kensuke Hoshikawa on 2017/04/11.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit

final class WallpaperListViewController: UIViewController {
    let tableView = UITableView(frame: .zero, style: .plain)
    var presenter: WallpaperListPresentation!
    var wallpapers: [WallpapersType] = [] {
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
}

extension WallpaperListViewController: WallpaperListView {
    func show(wallpapers: [WallpapersType]) {
        self.wallpapers = wallpapers
    }
}

extension WallpaperListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(wallpaper: wallpapers[indexPath.row])
    }
}

extension WallpaperListViewController: UITableViewDataSource {
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
