//
//  Database.swift
//  AvengersApp
//
//  Created by Jorge on 29/04/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit
import CoreData

class Database {

    // MARK: - Properties
    private let entityHero = "Hero"
    private let entityHeroName = "name"
    private let entityHeroImage = "image"
    private let entityHeroPower = "power"
    private let entityHeroBiography = "biography"
    private let entityHeroBattles = "battles"

    private let entityVillain = "Villain"
    private let entityVillainName = "name"
    private let entityVillainImage = "image"
    private let entityVillainPower = "power"
    private let entityVillainBiography = "biography"
    private let entityVillainBattles = "battles"

    private let entityBattle = "Battle"
    private let entityBattleTitle = "title"
    private let entityBattleWinner = "winner"
    private let entityBattleHero = "hero"
    private let entityBattleVillain = "villain"

    // MARK: - Private functions
    private var managedObjectContext: NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }

        return appDelegate.persistentContainer.viewContext
    }

    // MARK: - Public functions
    func saveAll() -> Bool {
        guard let context = managedObjectContext else { return false}

        if context.hasChanges {
            do {
                try context.save()
                return true
            } catch let error as NSError {
                print(error.localizedDescription)
                return false
            }
        } else {
            return true
        }
    }

}

// MARK: - Hero
extension Database {

    // MARK: - Public functions
    func createHero() -> NSManagedObject? {
        guard let context = managedObjectContext,
            let entity = NSEntityDescription.entity(
                                                forEntityName: entityHero,
                                                in: context) else {
                return nil
        }
        return NSManagedObject(entity: entity, insertInto: context)
    }

    func loadHeroes() -> [NSManagedObject]? {
        guard let context = managedObjectContext else { return nil }

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityHero)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: entityHeroName, ascending: true)]
        guard let heroes = try? context.fetch(fetchRequest) else {
            return nil
        }
        return heroes
    }

}

// MARK: Villain
extension Database {

    // MARK: - Public functions
    func createVillain() -> NSManagedObject? {
        guard let context = managedObjectContext,
            let entity = NSEntityDescription.entity(
                                                forEntityName: entityVillain,
                                                in: context) else {
                return nil
        }
        return NSManagedObject(entity: entity, insertInto: context)
    }

    func loadVillains() -> [NSManagedObject]? {
        guard let context = managedObjectContext else { return nil }

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityVillain)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: entityVillainName, ascending: true)]
        guard let villains = try? context.fetch(fetchRequest) else {
            return nil
        }
        return villains
    }

}

// MARK: Battle
extension Database {

    // MARK: - Public functions
    func createBatte() -> NSManagedObject? {
        guard let context = managedObjectContext,
            let entity = NSEntityDescription.entity(
                                                forEntityName: entityBattle,
                                                in: context) else {
                return nil
        }
        return NSManagedObject(entity: entity, insertInto: context)
    }

    func loadBattles() -> [NSManagedObject]? {
        guard let context = managedObjectContext else { return nil }

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityBattle)
        guard let battles = try? context.fetch(fetchRequest) else {
            return nil
        }
        return battles
    }

}
