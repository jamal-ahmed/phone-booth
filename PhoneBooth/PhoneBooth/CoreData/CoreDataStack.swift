import Foundation
import CoreData

class CoreDataStack {

    static let shared = CoreDataStack()

    let persistentContainer: NSPersistentContainer
    let backgroundContext: NSManagedObjectContext
    let mainContext: NSManagedObjectContext

    private init() {
        persistentContainer = NSPersistentContainer(name: "PhoneBooth")
        let description = persistentContainer.persistentStoreDescriptions.first
        description?.type = NSSQLiteStoreType

        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError("was unable to load store \(error!)")
            }
        }

        mainContext = persistentContainer.viewContext

        backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        backgroundContext.parent = self.mainContext
    }
}
