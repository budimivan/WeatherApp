import Foundation

class CurrentWeatherAPI {
    
    var baseURL: URL?
    var query: [String: String] 
    
    init(
        baseURL: String,
        query: [String: String]
    ) {
        self.baseURL = URL(string: baseURL)
        self.query = query
    }
    
    func getCurrentWeather (handleCurrentWeather: @escaping (CurrentWeather) -> Void)  {
        guard let url = baseURL?.withQueries(query) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if
                let data = data,
                let city = try? jsonDecoder.decode(CurrentWeather.self, from: data) {
                handleCurrentWeather(city)
            }
        }
        task.resume()
    }
}
