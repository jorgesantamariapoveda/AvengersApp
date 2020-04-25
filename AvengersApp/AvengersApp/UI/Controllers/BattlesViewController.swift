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
    }

}
