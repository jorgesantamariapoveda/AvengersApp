//
//  WinnerType.swift
//  AvengersApp
//
//  Created by Jorge on 01/05/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

enum WinnerType: Int {
    case Hero = 0
    case Villain

    var valueInt16: Int16 {
        return Int16(self.rawValue)
    }

    var colorHero: UIColor {
        switch self {
        case .Hero:
            return .blue
        case .Villain:
            return .red
        }
    }

    var colorVillain: UIColor {
        switch self {
        case .Hero:
            return .red
        case .Villain:
            return .blue
        }
    }

}
