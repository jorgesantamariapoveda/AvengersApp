//
//  AvengerPowerViewController.swift
//  AvengersApp
//
//  Created by Jorge on 26/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

final class AvengerPowerViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var avengerImage: UIImageView!
    @IBOutlet weak var powerAvengerButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!

    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private functions
    private func setupUI() {
        avengerImage.layer.cornerRadius = 8
        cancelButton.layer.cornerRadius = 4
        saveButton.layer.cornerRadius = 4
    }

    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
    }

}
