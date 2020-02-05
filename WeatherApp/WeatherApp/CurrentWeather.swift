import Foundation

struct CurrentWeather: Decodable {
    
    let weather: [Weather]
    let main: Main
    let sys: Sys
    
    private enum CodingKeys: String, CodingKey {
        case weather
        case main
        case sys
    }
    
    init(from decoder: Decoder) throws {
        
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.weather = try valueContainer.decode([Weather].self, forKey: CodingKeys.weather)
        self.main = try valueContainer.decode(Main.self, forKey: CodingKeys.main)
        self.sys = try valueContainer.decode(Sys.self, forKey: CodingKeys.sys)
       
    }
}
