//
//  AvengersViewController.swift
//  AvengersApp
//
//  Created by Jorge on 19/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

enum AvengerType {
    case Hero
    case Villain
}

class AvengersViewController: UIViewController {

    // MARK: - Properties
    private var avengerType: AvengerType?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Private functions
    private func setupUI() {
        guard let type = avengerType else { return }
        switch type {
            case .Hero:
                self.view.backgroundColor = .blue
                self.title = "SuperHéroes"
                self.tabBarItem.title = nil

            case .Villain:
                self.view.backgroundColor = .red
                self.title = "Villanos"
                self.tabBarItem.title = nil
        }
    }

    // MARK: - Public functions
    func setAvengerType(type: AvengerType) {
        avengerType = type
    }

}

