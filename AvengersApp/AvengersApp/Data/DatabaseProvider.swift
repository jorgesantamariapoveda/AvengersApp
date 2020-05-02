//
//  DatabaseProvider.swift
//  AvengersApp
//
//  Created by Jorge on 01/05/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

final class DatabaseProvider {

    // MARK: - Properties
    private var database: Database?
    private var userDefault = UserDefaults.standard
    private let keyUserDefaultLastVisitScreenIndex = "LastVisitScreenIndex"

    // MARK: Life cycle functions
    init() {
        database = Database()
    }

    deinit {
        database = nil
    }

}

// MARK: - Database
extension DatabaseProvider {

    func persistAll() -> Bool {
        return database?.saveAll() ?? false
    }

}

// MARK: - Hero database
extension DatabaseProvider {

    func createHero() -> Hero? {
        return database?.createHero() as? Hero
    }

    func loadHeroes() -> [Hero] {
        guard let data = database?.loadHeroes() as? [Hero] else {
            return []
        }

        return data
    }
    
}

// MARK: - Villain database
extension DatabaseProvider {

    func createVillain() -> Villain? {
        return database?.createVillain() as? Villain
    }

    func loadVillains() -> [Villain] {
        guard let data = database?.loadVillains()as? [Villain] else {
            return []
        }

        return data
    }

}

// MARK: - Battle database
extension DatabaseProvider {

    func createBattle() -> Battle? {
        return database?.createBatte() as? Battle
    }

    func loadBattles() -> [Battle] {
        guard let data = database?.loadBattles() as? [Battle] else {
            return []
        }

        return data
    }

    func deleteBatte(battle: Battle) -> Bool {
        return database?.deleteBattleBy(id: battle.id) ?? false
    }

}

// MARK: - UserDefaults
extension DatabaseProvider {

    func setLastVisitScreenIndex(index: Int) {
        userDefault.set(index, forKey: keyUserDefaultLastVisitScreenIndex)
    }

    func getLastVisitScreenIndex() -> Int {
        // En este caso concreto sino existe la clave me devolverá 0 y por
        // lo tanto me sirve. Sino fuese así, habría que comprobar que no
        // existe la clave (dictionaryRepresentation().keys.contains(keyBuscada))
        // y adoptar otra decisión
        return userDefault.integer(forKey: keyUserDefaultLastVisitScreenIndex)
    }

}
