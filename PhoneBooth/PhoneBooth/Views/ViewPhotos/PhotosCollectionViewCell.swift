//
//  PhotosCollectionViewCell.swift
//  PhoneBooth
//
//  Created by Jamal on 14/04/2021.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageTimestamp: UILabel!
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setup(withPhoto photo: Photo) {
        if let imageData = photo.imageData {
            image.image = ImageResizer(targetWidth: 100).resize(data: imageData)
        }
        imageName.text = photo.imageName
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        imageTimestamp.text = dateFormatter.string(from: Date(timeIntervalSince1970: photo.timestamp))
    }
}
