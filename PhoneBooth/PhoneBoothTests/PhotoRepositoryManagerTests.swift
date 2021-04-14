import XCTest
import CoreData
@testable import PhoneBooth

class PhotoRepositoryManagerTests: XCTestCase {

    var photoManager: PhotoRepositoryManager!
    var coreDataStack: CoreDataTestStack!

    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        photoManager = PhotoRepositoryManager(mainContext: coreDataStack.mainContext)
    }

    func test_add_photo() {
        photoManager.addPhoto(imageName: "Image 1",
                              imageData: Data()) { result in
            switch result {
            case .success(let photo):
                XCTAssertNotNil(photo)
                XCTAssertEqual(photo.imageName, "Image 1")
                XCTAssertEqual(photo.imageData, Data())
                XCTAssertNotNil(photo.timestamp)
                XCTAssertNotNil(photo.id)
            case .failure(let error):
                XCTFail("Adding photo failed: \(error.localizedDescription)")
            }
        }
    }

    func test_update_photo() {
        var actualPhoto: Photo!
        photoManager.addPhoto(imageName: "Image 1",
                              imageData: Data()) { result in
            switch result {
            case .success(let photo):
                actualPhoto = photo
            case .failure(let error):
                XCTFail("Adding photo failed: \(error.localizedDescription)")
            }
        }
        actualPhoto.imageName = "Image 2"

        photoManager.updatePhoto(photo: actualPhoto) { result in
            switch result {
            case .success(let status):
                XCTAssert(status)
            case .failure(let error):
                XCTFail("Updating photo failed: \(error.localizedDescription)")
            }
        }
        var updatedPhoto: Photo!
        photoManager.fetchPhoto(withName: "Image 2") { result in
            switch result {
            case .success(let photo):
                XCTAssertNotNil(photo)
                updatedPhoto = photo
            case .failure(let error):
                XCTFail("Fetching photo failed: \(error.localizedDescription)")
            }
        }
        XCTAssertEqual(actualPhoto.id, updatedPhoto.id)
        XCTAssertEqual(actualPhoto.imageName, updatedPhoto.imageName)
        XCTAssertEqual(actualPhoto.imageData, updatedPhoto.imageData)
        XCTAssertEqual(actualPhoto.timestamp, updatedPhoto.timestamp)
    }

    func test_delete_employees() {

        photoManager.addPhoto(imageName: "Image 1",
                              imageData: Data()) { _ in }
        photoManager.addPhoto(imageName: "Image 2",
                              imageData: Data()) { _ in }
        photoManager.addPhoto(imageName: "Image 3",
                              imageData: Data()) { _ in }
        photoManager.addPhoto(imageName: "Image 4",
                              imageData: Data()) { _ in }

        var fetchedPhoto: Photo!
        photoManager.fetchPhoto(withName: "Image 2") { result in
            switch result {
            case .success(let photo):
                XCTAssertNotNil(photo)
                fetchedPhoto = photo
            case .failure(let error):
                XCTFail("Fetching photo failed: \(error.localizedDescription)")
            }
        }

        photoManager.deletePhoto(photo: fetchedPhoto) { result in
            switch result {
            case .success(let status):
                XCTAssert(status)
            case .failure(let error):
                XCTFail("Failed to delete photo: \(error.localizedDescription)")
            }
        }

        photoManager.fetchPhotos { result in
            switch result {
            case .success(let photos):
                XCTAssertEqual(photos.count, 3)
                XCTAssert(photos.contains(where: { photo in
                    photo.imageName != "Image 2"}))
                XCTAssert(photos.contains(where: { photo in
                    photo.imageName == "Image 1"}))
                XCTAssert(photos.contains(where: { photo in
                    photo.imageName == "Image 3"}))
                XCTAssert(photos.contains(where: { photo in
                    photo.imageName == "Image 4"}))
            case .failure(let error):
                XCTFail("fetch photos failed: \(error.localizedDescription)")
            }
        }
    }
}
