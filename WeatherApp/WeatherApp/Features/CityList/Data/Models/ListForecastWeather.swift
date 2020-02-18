import Foundation

struct ListForecastWeather: Decodable {

    let weatherDescription: [WeatherDescription]
    let weatherDetails: WeatherDetails
    let wind: Wind
    let clouds: Clouds
    let rain: Rain?
    let calculationTimeUTC: Double
      
      private enum CodingKeys: String, CodingKey {
          case weatherDescription = "weather"
          case weatherDetails = "main"
          case wind = "wind"
          case clouds = "clouds"
          case rain = "rain"
          case calculationTimeUTC = "dt"
      }
}
