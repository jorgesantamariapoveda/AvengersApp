//
//  BattleTableViewCell.swift
//  AvengersApp
//
//  Created by Jorge on 26/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

final class BattleTableViewCell: UITableViewCell {

    // MARK: - IBOutles
    @IBOutlet weak var titleBattle: UILabel!
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var colorViewHero: UIView!
    @IBOutlet weak var imageVillain: UIImageView!
    @IBOutlet weak var colorViewVillain: UIView!

    // MARK: - Properties
    static let cellId: String = String(describing: BattleTableViewCell.self)

    private var battle: Battle?

    // MARK: - Life cycle functions
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func prepareForReuse() {
        battle = nil

        loadBattleData()
    }

    // MARK: - Public functions
    func configure(battle: Battle) {
        self.battle = battle

        loadBattleData()
    }

    // MARK: - Private functions
    private func setupUI() {
        imageHero.layer.cornerRadius = 8
        colorViewHero.layer.cornerRadius = 2
        
        imageVillain.layer.cornerRadius = 8
        colorViewVillain.layer.cornerRadius = 2
    }

    private func loadBattleData() {
        if let battle = self.battle,
            let hero = battle.hero,
            let villain = battle.villain {
            titleBattle.text = battle.title
            imageHero.image = UIImage(named: hero.image ?? "")
            imageVillain.image = UIImage(named: villain.image ?? "")
            let winnerType = WinnerType.init(rawValue: Int(battle.winner))
            colorViewHero.backgroundColor = winnerType?.colorHero
            colorViewVillain.backgroundColor = winnerType?.colorVillain
        } else {
            titleBattle.text = nil
            imageHero.image = nil
            imageVillain.image = nil
            colorViewHero.backgroundColor = .black
            colorViewVillain.backgroundColor = .black
        }
    }

}
