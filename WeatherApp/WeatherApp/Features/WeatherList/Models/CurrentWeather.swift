import Foundation

struct CurrentWeather: Decodable {
    
    let weatherDescription: [WeatherDescription]
    let weatherDetails: WeatherDetails
    let sunRiseSet: SunRiseSet
    let cityID: Int
    let cityName: String
    
    private enum CodingKeys: String, CodingKey {
        case weatherDescription = "weather"
        case weatherDetails = "main"
        case sunRiseSet = "sys"
        case cityID = "id"
        case cityName = "name"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.weatherDescription = try valueContainer.decode([WeatherDescription].self,
                                                            forKey: CodingKeys.weatherDescription)
        self.weatherDetails = try valueContainer.decode(WeatherDetails.self, forKey: CodingKeys.weatherDetails)
        self.sunRiseSet = try valueContainer.decode(SunRiseSet.self, forKey: CodingKeys.sunRiseSet)
        self.cityID = try valueContainer.decode(Int.self, forKey: CodingKeys.cityID)
        self.cityName = try valueContainer.decode(String.self, forKey: CodingKeys.cityName)
    }
}
