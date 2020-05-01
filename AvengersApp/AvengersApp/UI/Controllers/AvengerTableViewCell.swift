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

    // MARK: - Life cycle functions
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func prepareForReuse() {
        print("Reutilizar celda avenger")
    }

    // MARK: - Private functions
    private func setupUI() {
        imageAvenger.layer.cornerRadius = 8
    }

}
