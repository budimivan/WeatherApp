import UIKit

extension UILabel {

    func set(topLine: String, bottomLine: String) {
        self.numberOfLines = 2
        self.text = topLine + "\n" + bottomLine
        self.textAlignment = .center
    }
}
