import UIKit

class ViewPhotosViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private var photos: [Photo] = []
    private var selectedPhoto: Photo?
    private let photoManager = PhotoRepositoryManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadPhotos()
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "PhotosCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "photoCell")
    }

    private func loadPhotos() {
        photoManager.fetchPhotos { result in
            switch result {
            case .success(let objects):
                self.photos = objects
                collectionView.reloadData()
            case .failure(let error):
                self.photos = []
                print("faild to load images: \(error.localizedDescription)")
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? PhotoDetailsViewController {
            viewController.photo = selectedPhoto
        }
    }
}

extension ViewPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       photos.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell",
                                                      for: indexPath) as? PhotosCollectionViewCell
        guard indexPath.item < photos.count else { return UICollectionViewCell() }
        let photo = photos[indexPath.item]
        cell?.setup(withPhoto: photo)
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhoto = photos[indexPath.item]
        performSegue(withIdentifier: "photoDetails", sender: nil)
    }
}
