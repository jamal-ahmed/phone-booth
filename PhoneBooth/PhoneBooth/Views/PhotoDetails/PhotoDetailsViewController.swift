//
//  PhotoDetailsViewController.swift
//  PhoneBooth
//
//  Created by Jamal on 14/04/2021.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    var photo: Photo?

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let image = photo?.imageData else { imageView.image = nil
            return
        }
        imageView.image = UIImage(data: image)
        imageView.contentMode = .scaleAspectFill
    }
}
