import Foundation

struct Wind: Decodable {

    let speed: Double?
    let degree: Double?
    
    private enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case degree = "deg"
    }
}
