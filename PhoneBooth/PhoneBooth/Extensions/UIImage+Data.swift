import UIKit

extension UIImage {
    var compressedData: Data? {
        ImageResizer(targetWidth: 800).resize(image: self).jpegData(compressionQuality: 0.5)
    }
    public var thumbnailData: Data? {
        ImageResizer(targetWidth: 100).resize(image: self).jpegData(compressionQuality: 0.5)
    }
    var thumbnailImage: UIImage? {
        guard let data = thumbnailData else { return nil }
        return UIImage(data: data)
    }
}
