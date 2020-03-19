import UIKit
import Kingfisher
import EMTNeumorphicView

class WeatherCustomCell: UITableViewCell {
    var cellView: EMTNeumorphicView!
    var currentView: EMTNeumorphicView!
    var forecastView: EMTNeumorphicView!
    var stackViewCurrent: UIStackView!
    var stackViewForecast: UIStackView!
    var stackViewLabel: UIStackView!
    var stackViewImage: UIStackView!
    var cityName: UILabel!
    var currentTemparature: UILabel!
    var currentWeatherIcon: UIImageView!
    var forecastDayOne: UILabel!
    var forecastDayTwo: UILabel!
    var forecastDayThree: UILabel!
    var forecastDayFour: UILabel!
    var forecastDayFive: UILabel!
    var forecastDayOneIcon: UIImageView!
    var forecastDayTwoIcon: UIImageView!
    var forecastDayThreeIcon: UIImageView!
    var forecastDayFourIcon: UIImageView!
    var forecastDayFiveIcon: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildViews()
    }

    func setCellUIProperties(
        cityCurrentWeather: CurrentWeatherViewModel?,
        cityForecastWeather: ForecastWeatherViewModel?
    ) {
        guard
            let cityCurrentWeather = cityCurrentWeather,
            let cityForecastWeather = cityForecastWeather
        else {
            return
        }
        cityName.text = cityCurrentWeather.cityName
//        TODO: F <-> C + safety 
        currentTemparature.text = String(format: "%.0f", cityCurrentWeather.weatherTemparature) + " °C"
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = Date.DayStyle.shortDayOfWeek.dateFormat
        forecastDayOne.set(
            topLine: format.string(from: date.add(numberOfDays: 1)),
            bottomLine: String(format: "%.0f", cityForecastWeather.weatherTemparature[0]) + " °C")
        forecastDayTwo.set(
            topLine: format.string(from: date.add(numberOfDays: 2)),
            bottomLine: String(format: "%.0f", cityForecastWeather.weatherTemparature[1]) + " °C")
        forecastDayThree.set(
            topLine: format.string(from: date.add(numberOfDays: 3)),
            bottomLine: String(format: "%.0f", cityForecastWeather.weatherTemparature[2]) + " °C")
        forecastDayFour.set(
            topLine: format.string(from: date.add(numberOfDays: 4)),
            bottomLine: String(format: "%.0f", cityForecastWeather.weatherTemparature[3]) + " °C")
        forecastDayFive.set(
            topLine: format.string(from: date.add(numberOfDays: 5)),
            bottomLine: String(format: "%.0f", cityForecastWeather.weatherTemparature[4]) + " °C")
        setImage(cityCurrentWeather: cityCurrentWeather, cityForecastWeather: cityForecastWeather)
    }
    
    func setImage(
        cityCurrentWeather: CurrentWeatherViewModel,
        cityForecastWeather: ForecastWeatherViewModel
    ) {
        let image = cityCurrentWeather.imagePath
        let url = URL(string: image)
        currentWeatherIcon.kf.setImage(with: url)
        if let image = cityForecastWeather.weatherIcons.at(0) {
            let url = URL(string: image)
            forecastDayOneIcon.kf.setImage(with: url)
        }
        if let image = cityForecastWeather.weatherIcons.at(1) {
            let url = URL(string: image)
            forecastDayTwoIcon.kf.setImage(with: url)
        }
        if let image = cityForecastWeather.weatherIcons.at(2) {
            let url = URL(string: image)
            forecastDayThreeIcon.kf.setImage(with: url)
        }
        if let image = cityForecastWeather.weatherIcons.at(3) {
            let url = URL(string: image)
            forecastDayFourIcon.kf.setImage(with: url)
        }
        if let image = cityForecastWeather.weatherIcons.at(4) {
            let url = URL(string: image)
            forecastDayFiveIcon.kf.setImage(with: url)
        }
    }
}
