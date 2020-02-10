import Foundation

struct CurrentWeather: Decodable {
    
    let coordinates: Coordinates
    let weatherDescription: [WeatherDescription]
    let weatherDetails: WeatherDetails
    let wind: Wind
    let clouds: Clouds
    let calculationTimeUTC: Double
    let sunRiseSet: SunRiseSet
    let cityID: Int
    let cityName: String
    
    private enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weatherDescription = "weather"
        case weatherDetails = "main"
        case wind = "wind"
        case clouds = "clouds"
        case calculationTimeUTC = "dt"
        case sunRiseSet = "sys"
        case cityID = "id"
        case cityName = "name"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.coordinates = try valueContainer.decode(Coordinates.self, forKey: CodingKeys.coordinates)
        self.weatherDescription = try valueContainer.decode([WeatherDescription].self,
                                                            forKey: CodingKeys.weatherDescription)
        self.weatherDetails = try valueContainer.decode(WeatherDetails.self, forKey: CodingKeys.weatherDetails)
        self.wind = try valueContainer.decode(Wind.self, forKey: CodingKeys.wind)
        self.clouds = try valueContainer.decode(Clouds.self, forKey: CodingKeys.clouds)
        self.calculationTimeUTC = try valueContainer.decode(Double.self, forKey: CodingKeys.calculationTimeUTC)
        self.sunRiseSet = try valueContainer.decode(SunRiseSet.self, forKey: CodingKeys.sunRiseSet)
        self.cityID = try valueContainer.decode(Int.self, forKey: CodingKeys.cityID)
        self.cityName = try valueContainer.decode(String.self, forKey: CodingKeys.cityName)
    }
}
