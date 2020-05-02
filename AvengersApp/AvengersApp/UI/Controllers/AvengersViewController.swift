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
    private let databaseProvider = DatabaseProvider()
    private var avengerType: AvengerType = .Hero
    private var heroes: [Hero] = []
    private var villains: [Villain] = []

    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadAvengers()
        showData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setLastVisitScreenIndex()
    }

    // MARK: - Public functions
    func setAvengerType(type: AvengerType) {
        avengerType = type
    }

    // MARK: - Private functions
    private func setupUI() {
        switch avengerType {
            case .Hero:
                self.title = "Superheros"
                self.view.backgroundColor = .blue

            case .Villain:
                self.title = "Villains"
                self.view.backgroundColor = .red
        }
        self.tabBarItem.title = nil
        configureTableView()
    }

    private func configureTableView() {
        let nib = UINib(nibName: "AvengerTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: AvengerTableViewCell.cellId)

        tableView.delegate = self
        tableView.dataSource = self

        tableView.separatorStyle = .none
    }

    private func loadAvengers() {
        switch avengerType {
            case .Hero:
                loadHeroes()

            case .Villain:
                loadVillains()
        }
    }

    private func loadHeroes() {
        let heroesBD = databaseProvider.loadHeroes()
        if heroesBD.count > 0 {
            heroes.append(contentsOf: heroesBD)
        } else {
            let heroesData = HeroesData()
            let newHeroes = heroesData.createHeroesByDefault()
            heroes.append(contentsOf: newHeroes)
            if databaseProvider.persistAll() == false {
                heroes = []
                print("🤬 persistAll heroes")
            }
        }
    }

    private func loadVillains() {
        let villainsBD = databaseProvider.loadVillains()
        if villainsBD.count > 0 {
            villains.append(contentsOf: villainsBD)
        } else {
            let villainsData = VillainsData()
            let newVillains = villainsData.createVillainsByDefault()
            villains.append(contentsOf: newVillains)
            if databaseProvider.persistAll() == false {
                villains = []
                print("🤬 persistAll villains")
            }
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

}

// MARK: - UITableViewDataSource
extension AvengersViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch avengerType {
            case .Hero:
                return heroes.count

            case .Villain:
                return villains.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AvengerTableViewCell.cellId,
                                                       for: indexPath) as? AvengerTableViewCell else {
            return UITableViewCell()
        }
        switch avengerType {
            case .Hero:
                let hero = heroes[indexPath.row]
                cell.configure(hero: hero)

            case .Villain:
                let villain = villains[indexPath.row]
                cell.configure(villain: villain)
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
        let detailAvengerVC = AvengerDetailViewController()
        switch avengerType {
            case .Hero:
                let hero = heroes[indexPath.row]
                detailAvengerVC.configure(hero: hero, delegate: self)

            case .Villain:
                let villain = villains[indexPath.row]
                detailAvengerVC.configure(villain: villain, delegate: self)
        }
        self.navigationController?.pushViewController(detailAvengerVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

// MARK: - AvengerDetailViewControllerDelegate
extension AvengersViewController: AvengerDetailViewControllerDelegate {

    func onPowerPersist() {
        showData()
    }

}

