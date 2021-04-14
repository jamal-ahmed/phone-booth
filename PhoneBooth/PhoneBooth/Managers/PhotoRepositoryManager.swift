import Foundation
import CoreData

struct PhotoRepositoryManager: RepositoryService {

    let mainContext: NSManagedObjectContext

    init(mainContext: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.mainContext = mainContext
    }

    func addPhoto(imageName: String,
                  imageData: Data,
                  timeStamp: TimeInterval = Date().timeIntervalSince1970,
                  completion: (Result<Photo, Error>) -> Void) {

        let photo = Photo(context: mainContext)

        photo.imageName = imageName
        photo.imageData = imageData
        photo.timestamp = timeStamp
        photo.id = UUID()

        do {
            try mainContext.save()
            completion(.success(photo))
        } catch let error {
            completion(.failure(error))
        }
    }

    func fetchPhotos(completion: (Result<[Photo], Error>) -> Void) {
        let fetchRequest = NSFetchRequest<Photo>(entityName: "Photo")

        do {
            let photos = try mainContext.fetch(fetchRequest)
            completion(.success(photos))
        } catch let error {
            completion(.failure(error))
        }
    }

    func fetchPhoto(withName name: String, completion: (Result<Photo?, Error>) -> Void) {
        let fetchRequest = NSFetchRequest<Photo>(entityName: "Photo")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "imageName == %@", name)

        do {
            let photos = try mainContext.fetch(fetchRequest)
            completion(.success(photos.first))
        } catch let error {
            completion(.failure(error))
        }
    }

    func updatePhoto(photo: Photo, completion: (Result<Bool, Error>) -> Void) {
        do {
            try mainContext.save()
            completion(.success(true))
        } catch let error {
            completion(.failure(error))
        }
    }

    func deletePhoto(photo: Photo, completion: (Result<Bool, Error>) -> Void) {
        mainContext.delete(photo)

        do {
            try mainContext.save()
            completion(.success(true))
        } catch let error {
            completion(.failure(error))
        }
    }
}
