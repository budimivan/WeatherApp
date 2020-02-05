import Foundation

struct Sys: Decodable {
    let type: Int
    let country: String
    let countryID: Int
    let sunRise: Int
    let sunSet: Int
    
    private enum CodingKeys: String, CodingKey {
        case type
        case country
        case countryID = "id"
        case sunRise = "sunrise"
        case sunSet = "sunset"
    }
}
