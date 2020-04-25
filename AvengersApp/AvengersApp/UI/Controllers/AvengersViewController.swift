//
//  AvengersViewController.swift
//  AvengersApp
//
//  Created by Jorge on 19/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

final class AvengersViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    private var avengerType: AvengerType?

    // MARK: - Lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private functions
    private func setupUI() {
        guard let type = avengerType else { return }
        switch type {
            case .Hero:
                self.title = "Superheros"
                self.view.backgroundColor = .blue
                self.tabBarItem.title = nil

            case .Villain:
                self.title = "Villains"
                self.view.backgroundColor = .red
                self.tabBarItem.title = nil
        }
    }

    // MARK: - Public functions
    func setAvengerType(type: AvengerType) {
        avengerType = type
    }

}

