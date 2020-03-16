import UIKit
import EMTNeumorphicView

class DetailsWeatherViewController: UIViewController {

    var city: CurrentWeatherViewModel!
    var detailsView: EMTNeumorphicView!
    var sunRiseStackView: UIStackView!
    var sunSetStackView: UIStackView!
    var windStackView: UIStackView!
    var cloudsStackView: UIStackView!
    var sunRiseImage: UIImage!
    var sunSetImage: UIImage!
    var windImage: UIImage!
    var cloudsImage: UIImage!
    var windImageView: UIImageView!
    var cloudsImageView: UIImageView!
    var sunRiseImageView: UIImageView!
    var sunSetImageView: UIImageView!
    var imageConfiguration: UIImage.SymbolConfiguration!
    var sunRise: UILabel!
    var sunSet: UILabel!
    var wind: UILabel!
    var clouds: UILabel!
    
    convenience init(city: CurrentWeatherViewModel) {
        self.init()
        self.city = city
        buildViews()
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        makeDetailsScreen()
    }
    
    func makeDetailsScreen() {
        sunRise.text = customDateAndTime.getTime(unixdate: city.sunRise, timezone: "CET")
        sunSet.text = customDateAndTime.getTime(unixdate: city.sunSet, timezone: "CET")
        wind.text = String(format: "%.0f", city?.wind ?? 0) + " m/s"
        clouds.text = String(format: "%.0f", city?.clouds ?? 0) + " %"
    }
}
