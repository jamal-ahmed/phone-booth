import UIKit

class MainViewController: UIViewController {
    // MARK: - local constants
    private let localised = Localised.mainView

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = localised.screenTitle
    }

    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let viewController = segue.destination as? TakePhotoViewController {
//            viewController.viewModel = TakePhotoViewModel()
//            viewController.screenTitle = localised.takePhotoTitle
//
//        } else if let viewController = segue.destination as? ViewPhotosViewController {
//            viewController.viewModel = ViewPhotosViewModel()
//            viewController.screenTitle = localised.viewPhotosTitle
//        }
    }
}
