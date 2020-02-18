import UIKit

class DetailsWeatherViewController: UIViewController {
    
    @IBOutlet weak var sunRise: UILabel!
    @IBOutlet weak var sunSet: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var clouds: UILabel!
    var city: CurrentWeatherViewModel!

    convenience init(city: CurrentWeatherViewModel) {
        self.init()
        self.city = city
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
        sunRise.text = customDateAndTime.getTime(unixdate: city.sunRise, timezone: "CET")
        sunSet.text = customDateAndTime.getTime(unixdate: city.sunSet, timezone: "CET")
        wind.text = String(format: "%.0f", city?.wind ?? 0) + " m/s"
        clouds.text = String(format: "%.0f", city?.clouds ?? 0) + " %"
    }
}
