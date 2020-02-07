import Foundation

struct WeatherDetails: Decodable {
    
    let temparature: Double
    let pressure: Int
    let humidity: Int
    let tempMin: Double
    let tempMax: Double
   
    private enum CodingKeys: String, CodingKey {
        case temparature = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
