//
//  CollectionExtension.swift
//  AvengersApp
//
//  Created by Jorge on 01/05/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

extension Collection {

    func posRandom() -> Int? {
        let numElems = self.count
        if numElems > 0 {
            return Int.random(in: 0..<numElems)
        } else {
            return nil
        }
    }

}
