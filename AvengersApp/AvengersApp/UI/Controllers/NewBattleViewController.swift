//
//  NewBattleViewController.swift
//  AvengersApp
//
//  Created by Jorge on 26/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

protocol NewBattleViewControllerDelegate: AnyObject {
    func onNewBattle()
}

final class NewBattleViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleBattle: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroButton: UIButton!
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var villainButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!

    private let databaseProvider = DatabaseProvider()
    private var battles: [Battle] = []
    private var heroes: [Hero] = []
    private var villains: [Villain] = []
    private var hero: Hero?
    private var villain: Villain?
    private weak var delegate: NewBattleViewControllerDelegate?

    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadBattles()
        loadHeroes()
        loadVillains()
        setupTitleBattle()
    }

    // MARK: - Public functions
    func configure(delegate: NewBattleViewControllerDelegate) {
        self.delegate = delegate
    }

    // MARK: - Private functions
    private func setupUI() {
        self.title = "New battle"
        heroImage.layer.cornerRadius = 8
        heroImage.alpha = 0.5
        villainImage.layer.cornerRadius = 8
        villainImage.alpha = 0.5
    }

    private func loadBattles() {
        self.battles.append(contentsOf: databaseProvider.loadBattles())
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

    private func loadHeroData() {
        if let image = UIImage(named: hero?.image ?? "") {
            heroImage.image = image
            heroImage.alpha = 1
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

    private func loadVillainData() {
        if let image = UIImage(named: villain?.image ?? "") {
            villainImage.image = image
            villainImage.alpha = 1
        }
    }

    private func setupTitleBattle() {
        let numBattles = battles.count + 1
        self.titleBattle.text = "Battle \(numBattles)"
    }

    private func createNewBattle(hero: Hero, villain: Villain) -> Bool {
        if let newBattle = databaseProvider.createBattle() {
            newBattle.title = self.titleBattle.text
            newBattle.hero = hero
            newBattle.villain = villain
            newBattle.winner = getWinner(hero: hero, villain: villain).valueInt16
            return true
        } else {
            return false
        }
    }

    private func getWinner(hero: Hero, villain: Villain) -> WinnerType {
        let powerHero = hero.power.randomPower()
        let powerVillain = villain.power.randomPower()
        if powerHero >= powerVillain {
            return .Hero
        } else {
            return .Villain
        }
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    // MARK: - IBActions
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func heroButtonTapped(_ sender: UIButton) {
        if let pos = heroes.posRandom() {
            hero = heroes[pos]
            loadHeroData()
        }
    }

    @IBAction func villainButtonTapped(_ sender: UIButton) {
        if let pos = villains.posRandom() {
            villain = villains[pos]
            loadVillainData()
        }
    }

    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        if let hero = self.hero,
            let villain = self.villain {
            if createNewBattle(hero: hero, villain: villain) == true {
                delegate?.onNewBattle()
                self.dismiss(animated: true, completion: nil)
            } else {
                print("😡 Error new battle")
            }
        } else {
            showAlert(title: "Info", message: "Debe seleccionar primero los vengadores")
        }
    }

}
