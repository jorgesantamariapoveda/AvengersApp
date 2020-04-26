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
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var biographyAvenger: UITextView!

    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private functions
    func setupUI() {
        self.title = "Capitana Marvel"
        imageAvenger.layer.cornerRadius = 8

        tableview.separatorStyle = .none
    }

    // MARK: - IBActions
    @IBAction func pencilPowerTapped(_ sender: UIButton) {
        let avengerPowerVC = AvengerPowerViewController()
        self.navigationController?.pushViewController(avengerPowerVC, animated: true)
    }
    
}
