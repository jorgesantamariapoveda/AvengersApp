//
//  VillainsData.swift
//  AvengersApp
//
//  Created by Jorge on 01/05/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

struct VillainsData {

    private let database = DatabaseProvider()

    func createVillainsByDefault() -> [Villain] {
        var villains: [Villain] = []

        if let dormammu = database.createVillain() {
            dormammu.name = "Dormammu"
            dormammu.power = AvengerPower.Star2.valueInt16
            dormammu.biography = "Biography Dormammu"
            dormammu.image = "Baner_Dormammu"
            villains.append(dormammu)
        }

        if let ego = database.createVillain() {
            ego.name = "Ego"
            ego.power = AvengerPower.Star3.valueInt16
            ego.biography = "Biography Ego"
            ego.image = "Baner_Ego"
            villains.append(ego)
        }

        if let hela = database.createVillain() {
            hela.name = "Hela"
            hela.power = AvengerPower.Star1.valueInt16
            hela.biography = "Biography Hela"
            hela.image = "Baner_Hela"
            villains.append(hela)
        }

        if let vanko = database.createVillain() {
            vanko.name = "Ivan Vanko"
            vanko.power = AvengerPower.Star4.valueInt16
            vanko.biography = "Biography Ivan Vanko"
            vanko.image = "Baner_IvanVanko"
            villains.append(vanko)
        }

        if let johann = database.createVillain() {
            johann.name = "JohannSchmidt"
            johann.power = AvengerPower.Star5.valueInt16
            johann.biography = "Biography JohannSchmidt"
            johann.image = "Baner_JohannSchmidt"
            villains.append(johann)
        }

        if let malekith = database.createVillain() {
            malekith.name = "Malekith"
            malekith.power = AvengerPower.Star2.valueInt16
            malekith.biography = "Biography Malekith"
            malekith.image = "Baner_Malekith"
            villains.append(malekith)
        }

        if let ronan = database.createVillain() {
            ronan.name = "Ronan"
            ronan.power = AvengerPower.Star3.valueInt16
            ronan.biography = "Biography Ronan"
            ronan.image = "Baner_Ronan"
            villains.append(ronan)
        }

        if let thanos = database.createVillain() {
            thanos.name = "Thanos"
            thanos.power = AvengerPower.Star1.valueInt16
            thanos.biography = "Biography Thanos"
            thanos.image = "Baner_Thanos"
            villains.append(thanos)
        }

        if let ultron = database.createVillain() {
            ultron.name = "Ultron"
            ultron.power = AvengerPower.Star4.valueInt16
            ultron.biography = "Biography Ultron"
            ultron.image = "Baner_Ultron"
            villains.append(ultron)
        }

        if let yon = database.createVillain() {
            yon.name = "Yon-Rogg"
            yon.power = AvengerPower.Star3.valueInt16
            yon.biography = "Biography Yon-Rogg"
            yon.image = "Baner_Yon-Rogg"
            villains.append(yon)
        }

        return villains
    }
}
