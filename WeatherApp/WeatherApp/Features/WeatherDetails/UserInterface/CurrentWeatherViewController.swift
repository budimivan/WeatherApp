import UIKit

class CurrentWeatherViewController: UIViewController {
    
    let currentWeatherAPI = CurrentWeatherAPI(
        baseURL: "https://api.openweathermap.org/data/2.5/weather",
        query: [
        "q": "Zagreb,HR",
        "units": "metric",
        "appid": "0ae08e96bcda3b9db5d64ea863097b60"]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    func getWeather() {
        currentWeatherAPI.getCurrentWeather()
    }
}
