import Foundation

struct SunRiseSet: Decodable {

    let sunRise: Double
    let sunSet: Double
    
    private enum CodingKeys: String, CodingKey {
        case sunRise = "sunrise"
        case sunSet = "sunset"
    }
}
