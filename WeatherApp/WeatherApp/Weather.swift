import Foundation

struct Weather: Decodable {
    
    let description: String
    let icon: String
    let id: Int
    let main: String
}
