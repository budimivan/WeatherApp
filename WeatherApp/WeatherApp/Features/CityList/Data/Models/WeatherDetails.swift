import Foundation

struct WeatherDetails: Decodable {
    
    let temparature: Double
    let pressure: Int
    let humidity: Int
    
    private enum CodingKeys: String, CodingKey {
        case temparature = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
    }
}
