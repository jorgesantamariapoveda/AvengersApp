//
//  AvengerDetailViewController.swift
//  AvengersApp
//
//  Created by Jorge on 26/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

final class AvengerDetailViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var imageAvenger: UIImageView!
    @IBOutlet weak var powerAvenger: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var biographyAvenger: UITextView!

    // MARK: - Properties
    private var hero: Hero?
    private var villain: Villain?

    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadAvengerData()
    }

    // MARK: - Public functions
    func configure(hero: Hero? = nil, villain: Villain? = nil) {
        self.hero = hero
        self.villain = villain
    }

    // MARK: - Private functions
    private func setupUI() {
        imageAvenger.layer.cornerRadius = 8

        configureTableView()
    }

    private func configureTableView() {
        //tableview.separatorStyle = .none
    }

    private func loadAvengerData() {
        if let hero = self.hero {
            self.title = hero.name
            if let image = UIImage(named: hero.image ?? "") {
                imageAvenger.image = image
            }
            powerAvenger.image = imageButtonBy(power: hero.power)
            biographyAvenger.text = hero.biography
        } else if let villain = self.villain {
            self.title = villain.name
            if let image = UIImage(named: villain.image ?? "") {
                imageAvenger.image = image
            }
            powerAvenger.image = imageButtonBy(power: villain.power)
            biographyAvenger.text = villain.biography
        }
    }

    private func imageButtonBy(power: Int16) -> UIImage? {
        let powerInt = Int(power)
        guard let avengerPower = AvengerPower.init(rawValue: powerInt) else {
            return nil
        }
        return UIImage(named: avengerPower.valueString)
    }

    // MARK: - IBActions
    @IBAction func pencilPowerTapped(_ sender: UIButton) {
        let avengerPowerVC = AvengerPowerViewController()
        self.navigationController?.pushViewController(avengerPowerVC, animated: true)
    }

}
