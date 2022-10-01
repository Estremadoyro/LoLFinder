//
//  CoreDataSource.swift
//  LoLFinder
//
//  Created by Leonardo  on 1/10/22.
//

import Foundation
import CoreData

final class CoreDataSource {
    lazy var container: PersistantContainer = {
        return PersistantContainer(name: "Player")
    }()
}

final class PersistantContainer: NSPersistentContainer {
    override init(name: String, managedObjectModel model: NSManagedObjectModel) {
        super.init(name: name, managedObjectModel: model)
        loadStores()
    }

    private func loadStores() {
        loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            print("senku [CoreData] \(String(describing: type(of: self))) - Successfuly loaded stores")
        }
    }
}
