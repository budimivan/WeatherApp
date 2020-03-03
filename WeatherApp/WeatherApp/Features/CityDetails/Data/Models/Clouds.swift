import Foundation

struct Clouds: Decodable {

    let cloudnesPercentage: Double
    
    private enum CodingKeys: String, CodingKey {
        case cloudnesPercentage = "all"
    }
}
