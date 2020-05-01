//
//  AvengerPower.swift
//  AvengersApp
//
//  Created by Jorge on 01/05/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

enum AvengerPower: Int {
    case Star0 = 0
    case Star1
    case Star2
    case Star3
    case Star4
    case Star5

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

    var valueInt16: Int16 {

        return Int16(self.rawValue)
//        switch self {
//            case .Star0:
//                return Int16(0)
//
//            case .Star1:
//                return Int16(1)
//
//            case .Star2:
//                return Int16(2)
//
//            case .Star3:
//                return Int16(3)
//
//            case .Star4:
//                return Int16(4)
//
//            case .Star5:
//                return Int16(5)
//        }
    }

}

//enum AvengerPower: String {
//    case Star0 = "0 estrellas"
//    case Star1 = "1 estrella"
//    case Star2 = "2 estrellas"
//    case Star3 = "3 estrellas"
//    case Star4 = "4 estrellas"
//    case Star5 = "5 estrellas"
//
//    var valueInt16: Int16 {
//        switch self {
//            case .Star0:
//                return Int16(0)
//
//            case .Star1:
//                return Int16(1)
//
//            case .Star2:
//                return Int16(2)
//
//            case .Star3:
//                return Int16(3)
//
//            case .Star4:
//                return Int16(4)
//
//            case .Star5:
//                return Int16(5)
//        }
//    }
//
//}
