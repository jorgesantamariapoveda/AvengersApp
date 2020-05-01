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

    private let defaultBiography = " Ese pedazo de caballo blanco caballo negroorl al ataquerl sexuarl benemeritaar de la pradera. Benemeritaar tiene musho peligro jarl ese pedazo de mamaar no te digo trigo por no llamarte Rodrigor ahorarr benemeritaar. Me cago en tus muelas apetecan no puedor caballo blanco caballo negroorl ese que llega. Ese pedazo de papaar papaar me cago en tus muelas a gramenawer fistro de la pradera mamaar al ataquerl está la cosa muy malar a gramenawer. Jarl está la cosa muy malar se calle ustée benemeritaar qué dise usteer ese pedazo de va usté muy cargadoo. Condemor sexuarl fistro tiene musho peligro a gramenawer te voy a borrar el cerito qué dise usteer ahorarr te va a hasé pupitaa diodenoo. Jarl por la gloria de mi madre pecador te va a hasé pupitaa no te digo trigo por no llamarte Rodrigor llevame al sircoo fistro. A gramenawer se calle ustée por la gloria de mi madre a peich va usté muy cargadoo pecador."

    func createVillainsByDefault() -> [Villain] {
        var villains: [Villain] = []

        if let dormammu = database.createVillain() {
            dormammu.name = "Dormammu"
            dormammu.power = AvengerPower.Star2.valueInt16
            dormammu.biography = "Biography Dormammu" + defaultBiography
            dormammu.image = "Baner_Dormammu"
            villains.append(dormammu)
        }

        if let ego = database.createVillain() {
            ego.name = "Ego"
            ego.power = AvengerPower.Star3.valueInt16
            ego.biography = "Biography Ego" + defaultBiography
            ego.image = "Baner_Ego"
            villains.append(ego)
        }

        if let hela = database.createVillain() {
            hela.name = "Hela"
            hela.power = AvengerPower.Star1.valueInt16
            hela.biography = "Biography Hela" + defaultBiography
            hela.image = "Baner_Hela"
            villains.append(hela)
        }

        if let vanko = database.createVillain() {
            vanko.name = "Ivan Vanko"
            vanko.power = AvengerPower.Star4.valueInt16
            vanko.biography = "Biography Ivan Vanko" + defaultBiography
            vanko.image = "Baner_IvanVanko"
            villains.append(vanko)
        }

        if let johann = database.createVillain() {
            johann.name = "JohannSchmidt"
            johann.power = AvengerPower.Star5.valueInt16
            johann.biography = "Biography JohannSchmidt" + defaultBiography
            johann.image = "Baner_JohannSchmidt"
            villains.append(johann)
        }

        if let malekith = database.createVillain() {
            malekith.name = "Malekith"
            malekith.power = AvengerPower.Star2.valueInt16
            malekith.biography = "Biography Malekith" + defaultBiography
            malekith.image = "Baner_Malekith"
            villains.append(malekith)
        }

        if let ronan = database.createVillain() {
            ronan.name = "Ronan"
            ronan.power = AvengerPower.Star3.valueInt16
            ronan.biography = "Biography Ronan" + defaultBiography
            ronan.image = "Baner_Ronan"
            villains.append(ronan)
        }

        if let thanos = database.createVillain() {
            thanos.name = "Thanos"
            thanos.power = AvengerPower.Star1.valueInt16
            thanos.biography = "Biography Thanos" + defaultBiography
            thanos.image = "Baner_Thanos"
            villains.append(thanos)
        }

        if let ultron = database.createVillain() {
            ultron.name = "Ultron"
            ultron.power = AvengerPower.Star4.valueInt16
            ultron.biography = "Biography Ultron" + defaultBiography
            ultron.image = "Baner_Ultron"
            villains.append(ultron)
        }

        if let yon = database.createVillain() {
            yon.name = "Yon-Rogg"
            yon.power = AvengerPower.Star3.valueInt16
            yon.biography = "Biography Yon-Rogg" + defaultBiography
            yon.image = "Baner_Yon-Rogg"
            villains.append(yon)
        }

        return villains
    }
}
