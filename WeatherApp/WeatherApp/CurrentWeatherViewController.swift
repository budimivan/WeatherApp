import UIKit

class CurrentWeatherViewController: UIViewController {
    
    let openWeatherMap = ApiServices(
        baseURL: "https://api.openweathermap.org/data/2.5/weather",
        query:  ["appid" : "0ae08e96bcda3b9db5d64ea863097b60",
                "q" : "Zagreb,HR"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    func getWeather() {
        openWeatherMap.getCurrentWeather()
    }
}
