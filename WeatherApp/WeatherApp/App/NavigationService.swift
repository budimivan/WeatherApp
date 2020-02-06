import Foundation
import UIKit

class NavigationService: NSObject {

    let rootNavigationController =  UINavigationController (
                                    navigationBarClass: nil,
                                    toolbarClass: nil)

    func pushWeatherViewController(window: UIWindow) {
        let weatherViewController = CurrentWeatherViewController(nibName: "CurrentWeather", bundle: nil)
        rootNavigationController.pushViewController(weatherViewController, animated: true)
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
    }
    
//TODO:
//    func pushDetailsWeatherViewController() {
//        let vc = WeatherDetailsVC()
//        rootNavigationController.pushVC(vc, animater: true)
//    }
}
