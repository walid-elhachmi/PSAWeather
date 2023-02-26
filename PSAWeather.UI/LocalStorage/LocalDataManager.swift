//
//  LocalDataManager.swift
//  PSAWeather.UI
//
//  Created by Walid El Hachmi on 26/2/2023.
//

import Foundation
import CoreData

class LocalDataManager<Entity: NSManagedObject> {

    let container: NSPersistentContainer
    
    init(modelName: String = "DataModel") {
        container = NSPersistentContainer(name: modelName)
    }

    func load() {
        container.loadPersistentStores { (storeDescription, error) in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }

    func save() {
        guard container.viewContext.hasChanges else { return }
        do {
            try container.viewContext.save()
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }

    func fetch() -> [Entity] {
        let request = NSFetchRequest<Entity>(entityName: String(describing: Entity.self))
        do {
            return try container.viewContext.fetch(request)
        } catch let error as NSError {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    func new() -> Entity {
        return Entity(context: container.viewContext)
    }
    
    func delete(_ entity: Entity) {
        container.viewContext.delete(entity)
    }
}
