//
//  HeroesData.swift
//  AvengersApp
//
//  Created by Jorge on 01/05/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

struct HeroesData {

    private let database = DatabaseProvider()

    func createHeroesByDefault() -> [Hero] {
        var heroes: [Hero] = []

        if let capitanaMarvel = database.createHero() {
            capitanaMarvel.name = "Capitana Marvel"
            capitanaMarvel.power = AvengerPower.Star0.valueInt16
            capitanaMarvel.biography = "Biography Capitana Marvel"
            capitanaMarvel.image = "Baner_CapitanaMarvel"
            heroes.append(capitanaMarvel)
        }

        if let blackPanther = database.createHero() {
            blackPanther.name = "BlackPanther"
            blackPanther.power = AvengerPower.Star2.valueInt16
            blackPanther.biography = "Biography BlackPanther"
            blackPanther.image = "Baner_BlackPanther"
            heroes.append(blackPanther)
        }

        return heroes
    }
}
