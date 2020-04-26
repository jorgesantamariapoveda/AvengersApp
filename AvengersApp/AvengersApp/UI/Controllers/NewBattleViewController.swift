//
//  NewBattleViewController.swift
//  AvengersApp
//
//  Created by Jorge on 26/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class NewBattleViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleBattle: UILabel!

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroButton: UIButton!

    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var villainButton: UIButton!

    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!

    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private functions
    private func setupUI() {
        self.title = "New battle"
        heroImage.layer.cornerRadius = 8
        villainImage.layer.cornerRadius = 8
    }
    
    // MARK: - IBActions
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func heroButtonTapped(_ sender: UIButton) {
    }

    @IBAction func villainButtonTapped(_ sender: UIButton) {
    }

    @IBAction func confirmButtonTapped(_ sender: UIButton) {
    }

}

