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
    private let databaseProvider = DatabaseProvider()
    private var battles: [Battle] = []

    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadBattles()
        showData()
        setLastVisitScreenIndex()
    }

    // MARK: - Private functions
    private func setupUI() {
        self.title = "Battles"
        self.view.backgroundColor = .green
        self.tabBarItem.title = nil

        addBattleButton.layer.cornerRadius = addBattleButton.bounds.size.height / 2.0

        configureTableView()
    }

    private func configureTableView() {
        let nib = UINib(nibName: "BattleTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: BattleTableViewCell.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

    private func loadBattles() {
        battles = []
        let battlesBD = databaseProvider.loadBattles()
        if battlesBD.count > 0 {
            battles.append(contentsOf: battlesBD)
        }
    }

    private func showData() {
        tableView.reloadData()
    }

    private func setLastVisitScreenIndex() {
        if let index = self.tabBarController?.selectedIndex {
            databaseProvider.setLastVisitScreenIndex(index: index)
        }
    }

    // MARK: - IBActions
    @IBAction func addBattleButtonTapped(_ sender: UIButton) {
        let newBattleVC = NewBattleViewController()
        newBattleVC.configure(delegate: self)

        let newBattleNavController = UINavigationController(rootViewController: newBattleVC)
        newBattleNavController.modalTransitionStyle = .coverVertical
        newBattleNavController.modalPresentationStyle = .overFullScreen

        self.present(newBattleNavController, animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDataSource
extension BattlesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return battles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                                    withIdentifier: BattleTableViewCell.cellId,
                                    for: indexPath) as? BattleTableViewCell else {
            return UITableViewCell()
        }
        let battle = battles[indexPath.row]
        cell.configure(battle: battle)
        return cell
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        switch editingStyle {
            case .delete:
                if indexPath.row < battles.count {
                    let battle = battles[indexPath.row]
                    if databaseProvider.deleteBatte(battle: battle) == true {
                        loadBattles()
                        showData()
                    }
                }

            default:
                break
        }
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

// MARK: - NewBattleViewControllerDelegate
extension BattlesViewController: NewBattleViewControllerDelegate {

    func onCreateNewBattle() {
        if databaseProvider.persistAll() == true {
            loadBattles()
            showData()
        } else {
            print("🤬 persistAll heroes")
        }
    }

}


