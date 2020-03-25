import UIKit

extension UIView {
    func rounded() {
        self.layer.cornerRadius = self.bounds.width/2
        self.clipsToBounds = true
    }

    func shadowBlack() {
        let opacityValue: Float = 0.5
        let radiusValue: CGFloat = 10
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = opacityValue
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = radiusValue
    }
}
