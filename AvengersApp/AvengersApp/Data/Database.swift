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

    private var managedObjectContext: NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }

        return appDelegate.persistentContainer.viewContext
    }

    func saveHeroes() {
        guard let context = managedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: entityHero, in: context)
         else { return }

        let hero1 = NSManagedObject(entity: entity, insertInto: context)
        hero1.setValue("Hero111", forKey: entityHeroName)
        hero1.setValue(1, forKey: entityHeroPower)

        let hero2 = NSManagedObject(entity: entity, insertInto: context)
        hero2.setValue("Hero222", forKey: entityHeroName)
        hero2.setValue(2, forKey: entityHeroPower)

        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    func saveVillains() {
        guard let context = managedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: entityVillain, in: context)
         else { return }

        let villain1 = NSManagedObject(entity: entity, insertInto: context)
        villain1.setValue("Villain333", forKey: entityVillainName)
        villain1.setValue(3, forKey: entityVillainPower)

        let villain2 = NSManagedObject(entity: entity, insertInto: context)
        villain2.setValue("Villain444", forKey: entityVillainName)
        villain2.setValue(4, forKey: entityVillainPower)

        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    func saveBattle() {
        guard let context = managedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: entityBattle, in: context)
         else { return }

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityHero)
        let heroPredicate = NSPredicate(format: "\(entityHeroName) = %@", "Hero111")
        fetchRequest.predicate = heroPredicate

        guard let heroes = try? context.fetch(fetchRequest) else { return }
        guard let hero = heroes.first else { return }

        guard let battle = NSManagedObject(entity: entity, insertInto: context) as? Battle else {
            return
        }
        // Forma 1
        battle.title = "Batalla123"
        battle.winner = 1
        battle.hero = hero as? Hero
        // Forma 2
        battle.setValue("Batalla123", forKey: entityBattleTitle)
        battle.setValue(1, forKey: entityBattleWinner)
        battle.setValue(hero, forKey: entityBattleHero)

        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    func loadBattles() {
        guard let context = managedObjectContext else { return }

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityBattle)
        guard let battles = try? context.fetch(fetchRequest) else {
            return
        }

        for battle in battles {
            guard let bat = battle as? Battle else { return }
            print("\(bat)")
            print("\(String(describing: bat.title))")
            print("\(String(describing: bat.winner))")
            print("\(String(describing: bat.hero))")
            print("\(String(describing: bat.hero?.name))")
            print("\(String(describing: bat.villain))")
        }

        print("Battles: \(battles)")
    }

    func loadHeroes() {
        guard let context = managedObjectContext else { return }

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityHero)
        guard let heroes = try? context.fetch(fetchRequest) else {
            return
        }
//
//        for battle in battles {
//            guard let bat = battle as? Battle else { return }
//            print("\(bat)")
//            print("\(String(describing: bat.title))")
//            print("\(String(describing: bat.winner))")
//            print("\(String(describing: bat.hero))")
//            print("\(String(describing: bat.hero?.name))")
//            print("\(String(describing: bat.villain))")
//        }

        print("Heroes: \(heroes)")
    }

    func loadVillains() {
        guard let context = managedObjectContext else { return }

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityVillain)
        guard let villains = try? context.fetch(fetchRequest) else {
            return
        }
//
//        for battle in battles {
//            guard let bat = battle as? Battle else { return }
//            print("\(bat)")
//            print("\(String(describing: bat.title))")
//            print("\(String(describing: bat.winner))")
//            print("\(String(describing: bat.hero))")
//            print("\(String(describing: bat.hero?.name))")
//            print("\(String(describing: bat.villain))")
//        }

        print("Villains: \(villains)")
    }


}
