import UIKit
import AVFoundation

enum SessionSetupResult {
    case success
    case notAuthorized
    case configurationFailed
}

protocol TakePhotoService {
    func getSessionSetupResult() -> SessionSetupResult
    func startSession(completion: @escaping ( Result<Bool, Error>) -> Void)
    func getSession() -> AVCaptureSession?
    func switchCamera(completion: @escaping ( Result<Bool, Error>) -> Void)
    func pauseSession()
    func takePhoto()
    var getPhoto: ((_ image: UIImage?) -> ())? { get set }
}
