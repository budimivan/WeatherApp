import Foundation

class ApiServices {
    
    var baseURL: URL?
    var query: [String: String] = [
            "appid": "0ae08e96bcda3b9db5d64ea863097b60",
            "q": "Zagreb,HR",
    ]
    
    init(baseURL: String, query: [String:String]) {
        self.baseURL = URL(string: baseURL)
        self.query = query
    }
    
    func getCurrentWeather () {
        guard let url = baseURL?.withQueries(query) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let city = try? jsonDecoder.decode(CurrentWeather.self, from: data) {
                print(city.sys.country)
                }
        }
        task.resume()
    }
}
