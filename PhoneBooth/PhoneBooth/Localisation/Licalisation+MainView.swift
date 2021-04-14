import Foundation

extension Localised {
    struct MainView {
        let screenTitle = NSLocalizedString("mainView.screenTitle",
                                         value: "Main Screen",
                                         comment: "Screen title for Main Screen")

        let takePhotoTitle = NSLocalizedString("mainView.takePhotoTitle",
                                         value: "Take a photo",
                                         comment: "Screen title for Take a photo screen")
        let viewPhotosTitle = NSLocalizedString("mainView.viewPhotosTitle",
                                          value: "View Photos",
                                          comment: "Screen Title for View Photos screen")

    }
    static let mainView = MainView()
}
