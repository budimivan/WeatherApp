import UIKit

class CurrentWeatherViewController: UIViewController {
    
    
    @IBOutlet weak var temparatureLabel: UILabel!
    
    
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
    
    func handleCurrentWeather(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.temparatureLabel.text = "The current temp in Zagreb is: \(weather.weatherDetails.temparature) °C"
        }
    }
    
    func getWeather() {
        currentWeatherAPI.getCurrentWeather(handleCurrentWeather: handleCurrentWeather)
    }
}
