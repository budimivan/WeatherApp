import Foundation

struct WeatherDescription: Decodable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
}
