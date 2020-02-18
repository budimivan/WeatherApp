import Foundation

struct ForecastWeather: Decodable {
    
    let forecastWeather: [ListForecastWeather]
    
    private enum CodingKeys: String, CodingKey {
        case forecastWeather = "list"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.forecastWeather = try valueContainer.decode([ListForecastWeather].self,
                                                         forKey: CodingKeys.forecastWeather)
    }
    
}
