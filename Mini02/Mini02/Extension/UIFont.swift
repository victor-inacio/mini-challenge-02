import UIKit

extension UIFont {
    static var big: UIFont? {
        get {
            return UIFontMetrics.default.scaledFont(for: .init(name: "Nunito-Bold", size: 32)!)
        }
    }
    
    static var medium: UIFont? {
        get {

            return UIFontMetrics.default.scaledFont(for: .init(name: "Nunito-Bold", size: 24)!)

        }
    }
    
    static var small: UIFont? {
        get {
            return UIFontMetrics.default.scaledFont(for: .init(name: "Nunito-Regular", size: 20)!)
        }
    }
}
