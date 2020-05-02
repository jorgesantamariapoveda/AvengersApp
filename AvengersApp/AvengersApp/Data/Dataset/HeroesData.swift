//
//  HeroesData.swift
//  AvengersApp
//
//  Created by Jorge on 01/05/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

struct HeroesData {

    // MARK: - Properties
    private let databaseProvider = DatabaseProvider()
    private let defaultBiography = " Mamaar se calle ustée quietooor diodeno a wan hasta luego Lucas ese pedazo de ahorarr llevame al sircoo jarl pupita. Tiene musho peligro te va a hasé pupitaa llevame al sircoo ese que llega condemor papaar papaar condemor no puedor condemor va usté muy cargadoo. A wan ese que llega de la pradera te voy a borrar el cerito. Diodeno está la cosa muy malar tiene musho peligro a gramenawer amatomaa te va a hasé pupitaa ese que llega a wan va usté muy cargadoo. La caidita te voy a borrar el cerito fistro la caidita. Te va a hasé pupitaa está la cosa muy malar me cago en tus muelas a wan qué dise usteer qué dise usteer. Qué dise usteer a gramenawer por la gloria de mi madre a wan. Llevame al sircoo mamaar mamaar diodenoo apetecan ese pedazo de. No puedor ese que llega condemor no puedor."

    // MARK: - Public functions
    func createHeroesByDefault() -> [Hero] {
        var heroes: [Hero] = []

        if let blackPanther = databaseProvider.createHero() {
            blackPanther.name = "BlackPanther"
            blackPanther.power = AvengerPower.Star2.valueInt16
            blackPanther.biography = "Biography BlackPanther" + defaultBiography
            blackPanther.image = "Baner_BlackPanther"
            heroes.append(blackPanther)
        }

        if let capitanaMarvel = databaseProvider.createHero() {
            capitanaMarvel.name = "Capitana Marvel"
            capitanaMarvel.power = AvengerPower.Star4.valueInt16
            capitanaMarvel.biography = "Biography Capitana Marvel" + defaultBiography
            capitanaMarvel.image = "Baner_CapitanaMarvel"
            heroes.append(capitanaMarvel)
        }

        if let capitanAmerica = databaseProvider.createHero() {
            capitanAmerica.name = "CapitanAmerica"
            capitanAmerica.power = AvengerPower.Star1.valueInt16
            capitanAmerica.biography = "Biography CapitanAmerica" + defaultBiography
            capitanAmerica.image = "Baner_CapitanAmerica"
            heroes.append(capitanAmerica)
        }

        if let drStrange = databaseProvider.createHero() {
            drStrange.name = "DrStrange"
            drStrange.power = AvengerPower.Star4.valueInt16
            drStrange.biography = "Biography DrStrange" + defaultBiography
            drStrange.image = "Baner_DrStrange"
            heroes.append(drStrange)
        }

        if let gamora = databaseProvider.createHero() {
            gamora.name = "Gamora"
            gamora.power = AvengerPower.Star5.valueInt16
            gamora.biography = "Biography Gamora" + defaultBiography
            gamora.image = "Baner_Gamora"
            heroes.append(gamora)
        }

        if let hulk = databaseProvider.createHero() {
            hulk.name = "Hulk"
            hulk.power = AvengerPower.Star2.valueInt16
            hulk.biography = "Biography Hulk" + defaultBiography
            hulk.image = "Baner_Hulk"
            heroes.append(hulk)
        }

        if let ironman = databaseProvider.createHero() {
            ironman.name = "Ironman"
            ironman.power = AvengerPower.Star3.valueInt16
            ironman.biography = "Biography Ironman" + defaultBiography
            ironman.image = "Baner_Ironman"
            heroes.append(ironman)
        }

        if let laViudaNegra = databaseProvider.createHero() {
            laViudaNegra.name = "LaViudaNegra"
            laViudaNegra.power = AvengerPower.Star1.valueInt16
            laViudaNegra.biography = "Biography LaViudaNegra" + defaultBiography
            laViudaNegra.image = "Baner_LaViudaNegra"
            heroes.append(laViudaNegra)
        }

        if let spiderman = databaseProvider.createHero() {
            spiderman.name = "Spiderman"
            spiderman.power = AvengerPower.Star4.valueInt16
            spiderman.biography = "Biography Spiderman" + defaultBiography
            spiderman.image = "Baner_Spiderman"
            heroes.append(spiderman)
        }

        if let thor = databaseProvider.createHero() {
            thor.name = "Thor"
            thor.power = AvengerPower.Star3.valueInt16
            thor.biography = "Biography Thor" + defaultBiography
            thor.image = "Baner_Thor"
            heroes.append(thor)
        }

        return heroes
    }
    
}
