import Foundation

struct Main: Decodable {

    let temparature: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
   
    private enum CodingKeys: String, CodingKey {
       
        case humidity
        case pressure
        case temparature = "temp"
        case tempMax = "temp_max"
        case tempMin = "temp_min"
        case feelsLike = "feels_like"
    }
}
