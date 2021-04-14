import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var takePhotoButton: RoundedCornerButton!
    @IBOutlet weak var viewPhotosButton: RoundedCornerButton!

    // MARK: - local constants
    private let localised = Localised.mainView

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = localised.screenTitle
    }

    private func setupViews() {
        takePhotoButton.accessibilityIdentifier = AccessibilityIdentifier.takePhotoButton
        viewPhotosButton.accessibilityIdentifier = AccessibilityIdentifier.viewPhotosButton
    }
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TakePhotoViewController {
            viewController.title = localised.takePhotoTitle

        } else if let viewController = segue.destination as? ViewPhotosViewController {
            viewController.title = localised.viewPhotosTitle
        }
    }
}
