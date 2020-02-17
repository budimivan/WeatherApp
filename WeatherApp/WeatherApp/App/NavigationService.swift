import Foundation
import UIKit

class NavigationService: NSObject {

    let appDependencies = AppDependencies()
    let rootNavigationController =  UINavigationController (
                                    navigationBarClass: nil,
                                    toolbarClass: nil)

    func pushWeatherViewController(window: UIWindow) {
        let weatherViewController = CurrentWeatherViewController(presenter: appDependencies.cityListPresenter)
        rootNavigationController.pushViewController(weatherViewController,
                                                    animated: true)
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
    }
    
    func pushDetailsWeatherViewController() {
        let detailsWeatherViewController = DetailsWeatherViewController()
        rootNavigationController.pushViewController(detailsWeatherViewController, animated: true)
    }
}
