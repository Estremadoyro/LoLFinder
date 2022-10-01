//
//  CoreDataSource.swift
//  LoLFinder
//
//  Created by Leonardo  on 1/10/22.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager(name: "LoLFinder")

    let container: PersistantContainer

    var context: NSManagedObjectContext {
        return container.viewContext
    }

    init(name: String) {
        self.container = PersistantContainer(name: name)
    }
}

final class PersistantContainer: NSPersistentContainer {
    override init(name: String, managedObjectModel model: NSManagedObjectModel) {
        super.init(name: name, managedObjectModel: model)
        loadStores()
    }

    private func loadStores(completion: (() -> Void)? = nil) {
        loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            print("senku [CoreData] \(String(describing: type(of: self))) - Successfuly loaded stores")
        }
    }

    func save() {
        do {
            try viewContext.save()
        } catch {
            print("senku [DEBUG] \(String(describing: type(of: self))) - Error saving: \(error)")
        }
        print("senku [DEBUG] \(String(describing: type(of: self))) - Saved successfully")
    }
}
