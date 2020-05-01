//
//  AvengerPower.swift
//  AvengersApp
//
//  Created by Jorge on 01/05/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

enum AvengerPower: Int {
    case Star0 = 0
    case Star1
    case Star2
    case Star3
    case Star4
    case Star5

    var valueInt16: Int16 {
        return Int16(self.rawValue)
    }

    var valueString: String {
        switch self {
            case .Star0:
                return "0 estrellas"

            case .Star1:
                return "1 estrella"

            case .Star2:
                return "2 estrellas"

            case .Star3:
                return "3 estrellas"

            case .Star4:
                return "4 estrellas"

            case .Star5:
                return "5 estrellas"
        }
    }

    mutating func changeState() {
        switch self {
            case .Star0:
                self = .Star1

            case .Star1:
                self = .Star2

            case .Star2:
                self = .Star3

            case .Star3:
                self = .Star4

            case .Star4:
                self = .Star5

            case .Star5:
                self = .Star0
        }
    }

    var imagePower: UIImage? {
        return UIImage(named: self.valueString)
    }

}
