import Foundation

struct SunRiseSet: Decodable {

    let sunRise: Double
    let sunSet: Double
    
    private enum CodingKeys: String, CodingKey {
        case sunRise = "sunrise"
        case sunSet = "sunset"
    }
    
//    do I need this block of code?
    init(from decoder: Decoder) throws {
        
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.sunRise = try valueContainer.decode(Double.self, forKey: CodingKeys.sunRise)
        self.sunSet = try valueContainer.decode(Double.self, forKey: CodingKeys.sunSet)
    }
}
