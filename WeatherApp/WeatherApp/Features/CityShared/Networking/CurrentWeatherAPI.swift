import Foundation
import RxSwift

class CurrentWeatherAPI {
    
    let currentWeatherPath: String = "/weather"
    let forecastWeatherPath: String = "/forecast"
    let weatherQuery: [String: String] = [
        "units": "metric",
        "appid": "0ae08e96bcda3b9db5d64ea863097b60"]
    
    func getCurrentWeather (_ cityName: String
    ) -> Observable<CurrentWeather> {
        return Observable<CurrentWeather>.create { [weak self] observer in
            var weatherQueryCity = self?.weatherQuery
            weatherQueryCity?["q"] = cityName
            let currentWeatherFullPath = APIConstants.baseURL + (self?.currentWeatherPath ?? "")
            guard
                let currentWeatherURL = URL(string: currentWeatherFullPath),
                let url = currentWeatherURL.withQueries(weatherQueryCity ?? ["":""])
            else {
                observer.onError(APIError.wrongURL(url: currentWeatherFullPath))
                return Disposables.create()
            }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
               do {
                    let jsonDecoder = try JSONDecoder().decode(CurrentWeather.self, from: data ?? Data())
                observer.onNext(jsonDecoder)
                } catch let error {
                    print(error)
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func getForcastWeather (_ cityName: String
    ) -> Observable<ForecastWeather>  {
        return Observable<ForecastWeather>.create { [weak self] observer in
            var weatherQueryCity = self?.weatherQuery
            weatherQueryCity?["q"] = cityName
            let forecastWeatherFullPath = APIConstants.baseURL + (self?.forecastWeatherPath ?? "")
            guard
                let forecastWeatherURL = URL(string: forecastWeatherFullPath),
                let url = forecastWeatherURL.withQueries(weatherQueryCity ??  ["":""])
            else {
                observer.onError(APIError.wrongURL(url: forecastWeatherFullPath))
                return Disposables.create()
            }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                do {
                    let jsonDecoder = try JSONDecoder().decode(ForecastWeather.self, from: data ?? Data())
                    observer.onNext(jsonDecoder)
                } catch let error {
                   print(error)
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
