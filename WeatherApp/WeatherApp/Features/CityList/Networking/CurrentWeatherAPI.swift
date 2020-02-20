import Foundation
import RxSwift

class CurrentWeatherAPI {
    
    let currentWeatherPath: String = "/weather"
    let forecastWeatherPath: String = "/forecast"
    let weatherQuery: [String: String] = [
        "units": "metric",
        "appid": "0ae08e96bcda3b9db5d64ea863097b60"]
    
    let disposeBag = DisposeBag()
    
    
    func getCurrentWeather (_ cityName: String
    ) -> Single<CurrentWeather> {
        return Single<CurrentWeather>.create { single in
            var weatherQueryCity = self.weatherQuery
            weatherQueryCity["q"] = cityName
            let currentWeatherFullPath = APIConstants.baseURL + self.currentWeatherPath
            guard
                let currentWeatherURL = URL(string: currentWeatherFullPath),
                let url = currentWeatherURL.withQueries(weatherQueryCity)
            else {
                single(.error(APIError.wrongURL(url: currentWeatherFullPath)))
                return Disposables.create()
            }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                if
                    let data = data,
                    let city = try? jsonDecoder.decode(CurrentWeather.self, from: data) {
                    single(.success(city))
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func getForcastWeather (_ cityName: String
    ) -> Single<ForecastWeather>  {
        return Single<ForecastWeather>.create { single in
            var weatherQueryCity = self.weatherQuery
            weatherQueryCity["q"] = cityName
            let forecastWeatherFullPath = APIConstants.baseURL + self.forecastWeatherPath
            guard
                let forecastWeatherURL = URL(string: forecastWeatherFullPath),
                let url = forecastWeatherURL.withQueries(weatherQueryCity)
            else {
                single(.error(APIError.wrongURL(url: forecastWeatherFullPath)))
                return Disposables.create()
            }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                if
                    let data = data,
                    let city = try? jsonDecoder.decode(ForecastWeather.self, from: data) {
                    single(.success(city))
                }
            }
            task.resume()
            return Disposables.create {
                           task.cancel()
            }
        }
    }
}
