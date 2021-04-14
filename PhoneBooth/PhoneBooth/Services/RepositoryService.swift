import Foundation

protocol RepositoryService {
    func addPhoto(imageName: String,
                  imageData: Data,
                  timeStamp: TimeInterval,
                  completion: (Result<Photo, Error>) -> Void)
    func fetchPhotos(completion: (Result<[Photo], Error>) -> Void)
    func fetchPhoto(withName name: String, completion: (Result<Photo?, Error>) -> Void)
    func updatePhoto(photo: Photo, completion: (Result<Bool, Error>) -> Void)
    func deletePhoto(photo: Photo, completion: (Result<Bool, Error>) -> Void)
}
