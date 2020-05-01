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
    private var avengerType: AvengerType = .Hero
    private var hero: Hero?
    private var villain: Villain?

    // MARK: - Life cycle functions
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func prepareForReuse() {
        avengerType = .Hero
        hero = nil
        villain = nil

        loadAvengerData()
    }

    // MARK: - Public functions
    func configure(avengerType: AvengerType, hero: Hero?, villain: Villain?) {
        self.avengerType = avengerType
        self.hero = hero
        self.villain = villain

        loadAvengerData()
    }

    // MARK: - Private functions
    private func setupUI() {
        imageAvenger.layer.cornerRadius = 8
    }

    private func loadAvengerData() {
        switch avengerType {
            case .Hero:
                nameAvenger.text = hero?.name
                if let hero = hero,
                    let image = UIImage(named: hero.image ?? "") {
                    imageAvenger.image = image
                }
                guard let power = hero?.power,
                        let imageButton = imageButtonBy(power: power) else { return }
                powerAvengerButton.setImage(imageButton, for: .normal)

            case .Villain:
                nameAvenger.text = villain?.name
                if let villain = villain,
                    let image = UIImage(named: villain.image ?? "") {
                    imageAvenger.image = image
                }
                guard let power = villain?.power,
                        let imageButton = imageButtonBy(power: power) else { return }
                powerAvengerButton.setImage(imageButton, for: .normal)
        }
    }

    private func imageButtonBy(power: Int16) -> UIImage? {
        let powerInt = Int(power)
        guard let avengerPower = AvengerPower.init(rawValue: powerInt) else {
            return nil
        }

        return UIImage(named: avengerPower.valueString)
    }

}
