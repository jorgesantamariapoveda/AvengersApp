//
//  AvengerPowerViewController.swift
//  AvengersApp
//
//  Created by Jorge on 26/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

protocol AvengerPowerViewControllerDelegate: AnyObject {
    func onChangePower(newPower: Int)
}

final class AvengerPowerViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imageAvenger: UIImageView!
    @IBOutlet weak var powerAvengerButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!

    // MARK: - Properties
    private var hero: Hero?
    private var villain: Villain?
    private var powerCurrent: Int?
    private weak var delegate: AvengerPowerViewControllerDelegate?
    
    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadAvengerData()
    }

    // MARK: - Public functions
    func configure(hero: Hero? = nil, villain: Villain? = nil, delegate: AvengerPowerViewControllerDelegate) {
        self.hero = hero
        self.villain = villain
        self.delegate = delegate

        powerCurrent = getValueAvengerPower()
    }

    // MARK: - Private functions
    private func setupUI() {
        imageAvenger.layer.cornerRadius = 8
        cancelButton.layer.cornerRadius = 4
        saveButton.layer.cornerRadius = 4
    }

    private func loadAvengerData() {
        if let hero = self.hero {
            self.title = hero.name
            if let image = UIImage(named: hero.image ?? "") {
                imageAvenger.image = image
            }
            let imageButton = hero.power.imagePower()
            powerAvengerButton.setImage(imageButton, for: .normal)
        } else if let villain = self.villain {
            self.title = villain.name
            if let image = UIImage(named: villain.image ?? "") {
                imageAvenger.image = image
            }
            let imageButton = villain.power.imagePower()
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

    private func getValueAvengerPower() -> Int {
        var value: Int = 0
        if let hero = self.hero {
            value = Int(hero.power)
        } else if let villain = self.villain {
            value = Int(villain.power)
        }
        return value
    }

    private func close() {
        self.navigationController?.popViewController(animated: true)
    }

    // MARK: - IBActions
    @IBAction func powerAvengerButtonTapped(_ sender: UIButton) {
        if powerCurrent != nil {
            var powerAvenger = AvengerPower(rawValue: powerCurrent!) ?? AvengerPower.Star0
            powerAvenger.changeState()
            powerCurrent = powerAvenger.rawValue

            let newImage = powerAvenger.imagePower
            powerAvengerButton.setImage(newImage, for: .normal)
        }
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        close()
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let power = powerCurrent else { return }
        self.delegate?.onChangePower(newPower: power)
        close()
    }

}
