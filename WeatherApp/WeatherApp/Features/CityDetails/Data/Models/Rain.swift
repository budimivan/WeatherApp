import Foundation

struct Rain: Decodable {
    
    let rainVolume: Double?
    
    private enum CodingKeys: String, CodingKey {
        case rainVolume = "3h"
    }
}
