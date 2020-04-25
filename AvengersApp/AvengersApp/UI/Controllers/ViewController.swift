//
//  ViewController.swift
//  AvengersApp
//
//  Created by Jorge on 19/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

enum TipoPersonaje {
    case SuperHeroe
    case Villano
}

class AvengersViewController: UIViewController {

    private var tipoPersonaje: TipoPersonaje? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let tipo = tipoPersonaje else { return }
        switch tipo {
            case .SuperHeroe:
                self.view.backgroundColor = .blue
                self.title = "SuperHéroes"
                self.tabBarItem.title = nil

            case .Villano:
                self.view.backgroundColor = .red
//                self.title = "Villano"
        }
    }

    func setTipoPersonaje(tipo: TipoPersonaje) {
        tipoPersonaje = tipo
    }

}

