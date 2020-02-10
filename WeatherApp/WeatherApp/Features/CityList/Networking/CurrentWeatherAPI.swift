import Foundation

class CurrentWeatherAPI {
    
    var currentWeatherPath: String = "/weather"
    var currentWeatherQuery: [String: String] = [
        "q": "Zagreb,HR",
        "units": "metric",
        "appid": "0ae08e96bcda3b9db5d64ea863097b60"]
    
    func getCurrentWeather (handleCurrentWeather: @escaping (CurrentWeather) -> Void) {
        let currentWeatherFullPath = APIConstants.baseURL + currentWeatherPath
        guard
            let currentWeatherURL = URL(string: currentWeatherFullPath),
            let url = currentWeatherURL.withQueries(currentWeatherQuery)
        else {
            return
        }
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
