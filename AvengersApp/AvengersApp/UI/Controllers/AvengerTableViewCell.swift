//
//  AvengerTableViewCell.swift
//  AvengersApp
//
//  Created by Jorge on 26/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

final class AvengerTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var imageAvenger: UIImageView!
    @IBOutlet weak var nameAvenger: UILabel!
    @IBOutlet weak var powerAvengerButton: UIButton!
    
    // MARK: - Properties
    static let cellId: String = String(describing: AvengerTableViewCell.self)
    private var hero: Hero?
    private var villain: Villain?
    private weak var delegate: AvengerPowerViewControllerDelegate?

    // MARK: - Life cycle functions
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func prepareForReuse() {
        hero = nil
        villain = nil

        loadAvengerData()
    }

    // MARK: - Public functions
    func configure(hero: Hero? = nil, villain: Villain? = nil) {
        self.hero = hero
        self.villain = villain

        loadAvengerData()
    }

    // MARK: - Private functions
    private func setupUI() {
        imageAvenger.layer.cornerRadius = 8
    }

    private func loadAvengerData() {
        if let hero = self.hero {
            nameAvenger.text = hero.name
            if let image = UIImage(named: hero.image ?? "") {
                imageAvenger.image = image
            }
            let imageButton = hero.power.imagePower()
            powerAvengerButton.setImage(imageButton, for: .normal)
        } else if let villain = self.villain {
            nameAvenger.text = villain.name
            if let image = UIImage(named: villain.image ?? "") {
                imageAvenger.image = image
            }
            let imageButton = villain.power.imagePower()
            powerAvengerButton.setImage(imageButton, for: .normal)
        } else {
            nameAvenger.text = nil
            imageAvenger.image = nil
            powerAvengerButton.setImage(nil, for: .normal)
        }
    }

}
