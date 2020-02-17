import UIKit

class DetailsWeatherViewController: UIViewController {
    
    @IBOutlet weak var sunRise: UILabel!
    @IBOutlet weak var sunSet: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var clouds: UILabel!
    var city: CurrentWeatherViewModel?

    
    convenience init(city: CurrentWeatherViewModel) {
        self.init()
        self.city = city
    }
    
        func getTime(unixdate: Double, timezone: String) -> String {
        if unixdate == 0 {return ""}
        let date = NSDate(timeIntervalSince1970: TimeInterval(unixdate))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm"
        dayTimePeriodFormatter.timeZone = NSTimeZone(name: timezone) as TimeZone?
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
        sunRise.text = getTime(unixdate: city!.sunRise, timezone: "CET")
        sunSet.text = getTime(unixdate: city!.sunSet, timezone: "CET")
        wind.text = String(format: "%.0f", city?.wind ?? 0) + " m/s"
        clouds.text = String(format: "%.0f", city?.clouds ?? 0) + " %"
    }
}
