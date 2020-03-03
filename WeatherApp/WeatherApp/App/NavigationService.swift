import Foundation
import UIKit

class NavigationService: NSObject {

    let appDependencies = AppDependencies()
    let rootNavigationController =  UINavigationController (
                                    navigationBarClass: nil,
                                    toolbarClass: nil)

    func pushWeatherViewController(window: UIWindow) {
        let presenter: CityListPresenter = appDependencies.buildCityListPresenter(navigationService: self)
        let weatherViewController = CurrentWeatherViewController()
        weatherViewController.presenter = presenter
        rootNavigationController.pushViewController(weatherViewController,
                                                    animated: true)
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
    }
    
    func pushDetailsWeatherViewController(city: CurrentWeatherViewModel) {
        let detailsWeatherViewController = DetailsWeatherViewController(city: city)
        rootNavigationController.present(detailsWeatherViewController, animated: true)
    }
}
