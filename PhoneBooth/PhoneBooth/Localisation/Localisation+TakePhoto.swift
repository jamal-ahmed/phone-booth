import Foundation

extension Localised {
    struct TakePhoto {
        let fileName = NSLocalizedString("takePhoto.fileName",
                                         value: "Give the image a name",
                                         comment: "Image name")
        let saveImage = NSLocalizedString("takePhoto.saveImage",
                                          value: "Save Image",
                                          comment: "Save Button text to save the photo taken")

        let discardImage = NSLocalizedString("takePhoto.saveImage",
                                          value: "Discard Image",
                                          comment: "Discard button text to cancel and take another photo")

    }
    static let takePhoto = TakePhoto()
}
