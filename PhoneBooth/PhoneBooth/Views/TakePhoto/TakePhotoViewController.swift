//
//  TakePhotoViewController.swift
//  PhoneBooth
//
//  Created by Jamal on 14/04/2021.
//

import UIKit
import AVFoundation

class TakePhotoViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var thumbnilContainerView: UIView!
    @IBOutlet weak var thumbnilContainerViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var thumbnilImage: UIImageView!
    @IBOutlet weak var fileNameTextField: UITextField!
    @IBAction func saveImageButtonClicked(_ sender: Any) {
        guard let imageData = thumbnilImage.image?.compressedData,
              let fileName = fileNameTextField.text else { return }

        photoManager.addPhoto(imageName: fileName,
                              imageData: imageData) { result in
            switch result {
            case .success(let photo):
                print("Saved photo: \(String(describing: photo.imageName)) successful")
                startSession()
            case .failure(let error):
                print("Unable to save photo: \(error.localizedDescription)")
            }
        }
    }
    @IBAction func discardImageButtonClicked(_ sender: Any) {
        thumbnilImage.image = nil
        showThumbnilView(false)
        startSession()
    }
    @IBOutlet weak var cameraOptionsView: UIView!
    @IBOutlet weak var cameraOptionsViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBAction func takePhotoButtonClicked(_ sender: Any) {
        cameraManager.takePhoto()
        cameraManager.getPhoto = { image in
            guard let session = self.cameraManager.getSession() else { return }
            session.stopRunning()
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5) {
                    self.thumbnilContainerView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                    self.thumbnilContainerView.center = self.view.center
                }
                self.previewLayer.removeFromSuperlayer()
                self.showThumbnilView(true)
                self.thumbnilImage.image = image
            }
        }
    }
    @IBOutlet weak var flipCameraButton: UIButton!
    @IBAction func flipCameraButtonClicked(_ sender: Any) {
        flipCameraButton.isUserInteractionEnabled = false
        cameraManager.switchCamera { result in
            switch result {
            case .success(let ststus):
                self.flipCameraButton.isUserInteractionEnabled = ststus
            case .failure(let error):
                break
            }
        }
    }

    // MARK: - variables
    private let localisation = Localised.takePhoto
    private let cameraManager = CameraManager()
    private let photoManager = PhotoRepositoryManager()

    var previewLayer: AVCaptureVideoPreviewLayer!

    private func showThumbnilView(_ shouldShow: Bool) {
        switch shouldShow {
        case true:
            self.thumbnilContainerViewHeightConstraints.constant = 205
            self.thumbnilContainerView.isHidden = false
            fileNameTextField.text = ""
        case false:
            thumbnilContainerViewHeightConstraints.constant = 0
            thumbnilContainerView.isHidden = true
            fileNameTextField.text = ""
        }
    }

    private func startSession() {
        cameraManager.startSession { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    //setup preview layer
                    self.setupPreviewLayer()
                }
            case .failure(_):
                break
            }
        }
        fileNameTextField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showThumbnilView(false)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let sessionSetupResult = cameraManager.getSessionSetupResult()
        switch sessionSetupResult {
        case .success:
            startSession()
        case .notAuthorized:
            DispatchQueue.main.async {
                let changePrivacySetting = "Photo Booth doesn't have permission to use the camera, please change privacy settings"
                let message = NSLocalizedString(changePrivacySetting, comment: "Alert message when the user has denied access to the camera")
                let alertController = UIAlertController(title: "Photo Booth", message: message, preferredStyle: .alert)

                alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Alert OK button"),
                                                        style: .cancel,
                                                        handler: nil))

                alertController.addAction(UIAlertAction(title: NSLocalizedString("Settings", comment: "Alert button to open Settings"),
                                                        style: .`default`,
                                                        handler: { _ in
                                                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                                                                      options: [:],
                                                                                      completionHandler: nil)
                }))

                self.present(alertController, animated: true, completion: nil)
            }

        case .configurationFailed:
            DispatchQueue.main.async {
                let alertMsg = "Alert message when something goes wrong during capture session configuration"
                let message = NSLocalizedString("Unable to capture media", comment: alertMsg)
                let alertController = UIAlertController(title: "Photo Booth", message: message, preferredStyle: .alert)

                alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Alert OK button"),
                                                        style: .cancel,
                                                        handler: nil))

                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    func setupPreviewLayer() {
        guard let session = cameraManager.getSession() else { return }
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        view.layer.insertSublayer(previewLayer, below: flipCameraButton.layer)
        previewLayer.frame = self.view.layer.frame
    }
}

//extension TakePhotoViewController: SavePhotoService {
//    func savePhoto(completion: @escaping (Result<Bool, Error>) -> Void) {
//        let context = CoreDataContextProvider().newBackgroundContext()
//        let photoRepository = PhotoRepository(context: context)
//        let imageData = ImageResizer(targetWidth: 800)
//            .resize(image: thumbnilImage.image ?? UIImage())
//            .jpegData(compressionQuality: 0.5) ?? Data()
//        let photo = Photo(uuid: UUID(),
//                          name: fileNameTextField.text ?? "",
//                          imageData: imageData,
//                          timestamp: Date().timeIntervalSince1970)
//        let photoResult = photoRepository.create(photo: photo)
//        switch photoResult {
//        case .success(_):
//            do{
//                try context.save()
//                completion(.success(true))
//            } catch {
//                completion(.failure(error))
//            }
//        case .failure(let error):
//            completion(.failure(error))
//        }
//        fileNameTextField.resignFirstResponder()
//    }
//}
