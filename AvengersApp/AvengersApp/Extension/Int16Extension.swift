//
//  Int16Extension.swift
//  AvengersApp
//
//  Created by Jorge on 01/05/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

extension Int16 {

    func imagePower() -> UIImage? {
        let powerInt = Int(self)
        guard let avengerPower = AvengerPower.init(rawValue: powerInt) else {
            return nil
        }
        return avengerPower.imagePower
    }

}
