import UIKit
import Kingfisher

class WeatherCustomCell: UITableViewCell {

    var containerView: UIView!
    var cityName: UILabel!
    var currentTemparature: UILabel!
    var currentWeatherIcon: UIImageView!
    var forcastDayOne: UILabel!
    var forcastDayTwo: UILabel!
    var forcastDayThree: UILabel!
    var forcastDayFour: UILabel!
    var forcastDayFive: UILabel!
    var forcastDayOneIcon: UIImageView!
    var forcastDayTwoIcon: UIImageView!
    var forcastDayThreeIcon: UIImageView!
    var forcastDayFourIcon: UIImageView!
    var forcastDayFiveIcon: UIImageView!
    
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
//        forcastDayOne.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[0]) + " °C"
//        forcastDayTwo.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[1]) + " °C"
//        forcastDayThree.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[2]) + " °C"
//        forcastDayFour.text =  String(format: "%.0f", cityForecastWeather.weatherTemparature[3]) + " °C"
//        forcastDayFive.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[4]) + " °C"
        setImage(cityCurrentWeather: cityCurrentWeather, cityForecastWeather: cityForecastWeather)
    }
    
    func setImage(
        cityCurrentWeather: CurrentWeatherViewModel,
        cityForecastWeather: ForecastWeatherViewModel
    ) {
        let image = cityCurrentWeather.imagePath
        let url = URL(string: image)
        currentWeatherIcon.kf.setImage(with: url)
//        if let image = cityForecastWeather.weatherIcons.at(0) {
//            let url = URL(string: image)
//            forcastDayOneIcon.kf.setImage(with: url)
//        }
//        if let image = cityForecastWeather.weatherIcons.at(1) {
//            let url = URL(string: image)
//            forcastDayTwoIcon.kf.setImage(with: url)
//        }
//        if let image = cityForecastWeather.weatherIcons.at(2) {
//            let url = URL(string: image)
//            forcastDayThreeIcon.kf.setImage(with: url)
//        }
//        if let image = cityForecastWeather.weatherIcons.at(3) {
//            let url = URL(string: image)
//            forcastDayFourIcon.kf.setImage(with: url)
//        }
//        if let image = cityForecastWeather.weatherIcons.at(4) {
//            let url = URL(string: image)
//            forcastDayFiveIcon.kf.setImage(with: url)
//        }
    }
}
