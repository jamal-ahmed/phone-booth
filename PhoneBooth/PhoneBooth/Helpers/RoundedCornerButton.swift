import UIKit

@IBDesignable
class RoundedCornerButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 10
    @IBInspectable var borderColor: UIColor? = .lightGray

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = borderColor?.cgColor
    }
}
