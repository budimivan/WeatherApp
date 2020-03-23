import UIKit

extension UIFont {

    private static let privateCellFont = UIFont(name: "Roboto-Regular", size: 20)!

    static var cellFont: UIFont {
        return privateCellFont
    }
    
    private static let privateDetailsFont = UIFont(name: "Roboto-Regular", size: 30)!

    static var detailsFont: UIFont {
        return privateDetailsFont
    }
}
