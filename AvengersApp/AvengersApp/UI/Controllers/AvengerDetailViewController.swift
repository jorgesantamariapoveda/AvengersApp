//
//  AvengerDetailViewController.swift
//  AvengersApp
//
//  Created by Jorge on 26/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

protocol AvengerDetailViewControllerDelegate: AnyObject {
    func onChangePower()
}

final class AvengerDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imageAvenger: UIImageView!
    @IBOutlet weak var powerAvenger: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var biographyAvenger: UITextView!

    // MARK: - Properties
    private let databaseProvider = DatabaseProvider()
    private var hero: Hero?
    private var villain: Villain?
    private weak var delegate: AvengerDetailViewControllerDelegate?

    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadAvengerData()
    }

    // MARK: - Public functions
    func configure(hero: Hero? = nil, villain: Villain? = nil, delegate: AvengerDetailViewControllerDelegate) {
        self.hero = hero
        self.villain = villain
        self.delegate = delegate
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
            powerAvenger.image = hero.power.imagePower()
            biographyAvenger.text = hero.biography
        } else if let villain = self.villain {
            self.title = villain.name
            if let image = UIImage(named: villain.image ?? "") {
                imageAvenger.image = image
            }
            powerAvenger.image = villain.power.imagePower()
            biographyAvenger.text = villain.biography
        }
    }

    // MARK: - IBActions
    @IBAction func pencilPowerTapped(_ sender: UIButton) {
        let avengerPowerVC = AvengerPowerViewController()
        if let hero = self.hero {
            avengerPowerVC.configure(hero: hero, delegate: self)
        } else if let villain = self.villain {
            avengerPowerVC.configure(villain: villain, delegate: self)
        }
        self.navigationController?.pushViewController(avengerPowerVC, animated: true)
    }

}

// MARK: - AvengerPowerViewControllerDelegate
extension AvengerDetailViewController: AvengerPowerViewControllerDelegate {

    func onChangePower(newPower: Int) {
        if let hero = self.hero {
            hero.power = Int16(newPower)
            powerAvenger.image = hero.power.imagePower()
        } else if let villain = self.villain {
            villain.power = Int16(newPower)
            powerAvenger.image = villain.power.imagePower()
        }

        if databaseProvider.persistAll() == true {
            delegate?.onChangePower()
        } else {
            print("🤬 persistAll power")
        }
    }
    
}





