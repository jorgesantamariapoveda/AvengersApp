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
    private let idCell = "AvengerTableViewCell"

    // MARK: - Life cycle functions
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
        let nib = UINib(nibName: "AvengerTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: idCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

    // MARK: - Public functions
    func setAvengerType(type: AvengerType) {
        avengerType = type
    }

}

// MARK: - UITableViewDataSource
extension AvengersViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as? AvengerTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

}

// MARK: - UITableViewDelegate
extension AvengersViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

