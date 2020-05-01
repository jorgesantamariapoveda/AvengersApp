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

        if let blackPanther = database.createHero() {
            blackPanther.name = "BlackPanther"
            blackPanther.power = AvengerPower.Star2.valueInt16
            blackPanther.biography = "Biography BlackPanther"
            blackPanther.image = "Baner_BlackPanther"
            heroes.append(blackPanther)
        }

        if let capitanaMarvel = database.createHero() {
            capitanaMarvel.name = "Capitana Marvel"
            capitanaMarvel.power = AvengerPower.Star3.valueInt16
            capitanaMarvel.biography = "Biography Capitana Marvel"
            capitanaMarvel.image = "Baner_CapitanaMarvel"
            heroes.append(capitanaMarvel)
        }

        if let capitanAmerica = database.createHero() {
            capitanAmerica.name = "CapitanAmerica"
            capitanAmerica.power = AvengerPower.Star1.valueInt16
            capitanAmerica.biography = "Biography CapitanAmerica"
            capitanAmerica.image = "Baner_CapitanAmerica"
            heroes.append(capitanAmerica)
        }

        if let drStrange = database.createHero() {
            drStrange.name = "DrStrange"
            drStrange.power = AvengerPower.Star4.valueInt16
            drStrange.biography = "Biography DrStrange"
            drStrange.image = "Baner_DrStrange"
            heroes.append(drStrange)
        }

        if let gamora = database.createHero() {
            gamora.name = "Gamora"
            gamora.power = AvengerPower.Star5.valueInt16
            gamora.biography = "Biography Gamora"
            gamora.image = "Baner_Gamora"
            heroes.append(gamora)
        }

        if let hulk = database.createHero() {
            hulk.name = "Hulk"
            hulk.power = AvengerPower.Star2.valueInt16
            hulk.biography = "Biography Hulk"
            hulk.image = "Baner_Hulk"
            heroes.append(hulk)
        }

        if let ironman = database.createHero() {
            ironman.name = "Ironman"
            ironman.power = AvengerPower.Star3.valueInt16
            ironman.biography = "Biography Ironman"
            ironman.image = "Baner_Ironman"
            heroes.append(ironman)
        }

        if let laViudaNegra = database.createHero() {
            laViudaNegra.name = "LaViudaNegra"
            laViudaNegra.power = AvengerPower.Star1.valueInt16
            laViudaNegra.biography = "Biography LaViudaNegra"
            laViudaNegra.image = "Baner_LaViudaNegra"
            heroes.append(laViudaNegra)
        }

        if let spiderman = database.createHero() {
            spiderman.name = "Spiderman"
            spiderman.power = AvengerPower.Star4.valueInt16
            spiderman.biography = "Biography Spiderman"
            spiderman.image = "Baner_Spiderman"
            heroes.append(spiderman)
        }

        if let thor = database.createHero() {
            thor.name = "Thor"
            thor.power = AvengerPower.Star3.valueInt16
            thor.biography = "Biography Thor"
            thor.image = "Baner_Thor"
            heroes.append(thor)
        }

        return heroes
    }
}
