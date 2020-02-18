import UIKit
import Kingfisher

class WeatherCustomCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var currentTemparature: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var forcastDayOne: UILabel!
    @IBOutlet weak var forcastDayTwo: UILabel!
    @IBOutlet weak var forcastDayThree: UILabel!
    @IBOutlet weak var forcastDayFour: UILabel!
    @IBOutlet weak var forcastDayFive: UILabel!
    @IBOutlet weak var forcastDayOneIcon: UIImageView!
    @IBOutlet weak var forcastDayTwoIcon: UIImageView!
    @IBOutlet weak var forcastDayThreeIcon: UIImageView!
    @IBOutlet weak var forcastDayFourIcon: UIImageView!
    @IBOutlet weak var forcastDayFiveIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(
        _ selected: Bool,
        animated: Bool
    ) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellUIProperties(
        cityCurrentWeather: CurrentWeatherViewModel,
        cityForecastWeather: ForecastWeatherViewModel) {
        cityName.text = cityCurrentWeather.cityName
        currentTemparature.text = String(format: "%.0f", cityCurrentWeather.weatherTemparature) + " °C"
        forcastDayOne.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[0]) + " °C"
        forcastDayTwo.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[1]) + " °C"
        forcastDayThree.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[2]) + " °C"
        forcastDayFour.text =  String(format: "%.0f", cityForecastWeather.weatherTemparature[3]) + " °C"
        forcastDayFive.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[4]) + " °C"
        var image = cityCurrentWeather.imagePath
        var url = URL(string: image)
        currentWeatherIcon.kf.setImage(with: url)
        image = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[0] + ".png"
        url = URL(string: image)
        forcastDayOneIcon.kf.setImage(with: url)
        image = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[1] + ".png"
        url = URL(string: image)
        forcastDayTwoIcon.kf.setImage(with: url)
        image = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[2] + ".png"
        url = URL(string: image)
        forcastDayThreeIcon.kf.setImage(with: url)
        image = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[3] + ".png"
        url = URL(string: image)
        forcastDayFourIcon.kf.setImage(with: url)
        image = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[4] + ".png"
        url = URL(string: image)
        forcastDayFiveIcon.kf.setImage(with: url)
    }
}
