//
//  BattleTableViewCell.swift
//  AvengersApp
//
//  Created by Jorge on 26/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class BattleTableViewCell: UITableViewCell {

    // MARK: - IBOutles
    @IBOutlet weak var titleBattle: UILabel!
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var colorViewHero: UIView!
    @IBOutlet weak var imageVillain: UIImageView!
    @IBOutlet weak var colorViewVillain: UIView!

    // MARK: - Lyfe cycle
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func prepareForReuse() {
        print("Reutilizar celda battle")
    }

    // MARK: - Private functions
    private func setupUI() {
        imageHero.layer.cornerRadius = 8
        colorViewHero.layer.cornerRadius = 2
        
        imageVillain.layer.cornerRadius = 8
        colorViewVillain.layer.cornerRadius = 2
    }

}
