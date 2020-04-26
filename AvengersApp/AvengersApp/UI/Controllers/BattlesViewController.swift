//
//  BattlesViewController.swift
//  AvengersApp
//
//  Created by Jorge on 25/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

final class BattlesViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBattleButton: UIButton!

    // MARK: - Properties
    private let idCell = "BattleTableViewCell"

    // MARK: - Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private functions
    private func setupUI() {
        self.title = "Battles"
        self.view.backgroundColor = .green
        self.tabBarItem.title = nil

        addBattleButton.layer.cornerRadius = addBattleButton.bounds.size.height / 2.0

        let nib = UINib(nibName: "BattleTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: idCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

}

// MARK: - UITableViewDataSource
extension BattlesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as? BattleTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

}

// MARK: - UITableViewDelegate
extension BattlesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


