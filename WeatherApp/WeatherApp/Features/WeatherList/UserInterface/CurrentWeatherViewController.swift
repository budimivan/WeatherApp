import UIKit

class CurrentWeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var cityWeather: CurrentWeather?
    
    let currentWeatherAPI = CurrentWeatherAPI(
        baseURL: "https://api.openweathermap.org/data/2.5/weather",
        query: [
        "q": "Zagreb,HR",
        "units": "metric",
        "appid": "0ae08e96bcda3b9db5d64ea863097b60"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let nib = UINib(nibName: "WeatherCustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherCustomCell")
    }
    
    func handleCurrentWeather(weather: CurrentWeather) {
        self.cityWeather = weather
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func getWeather() {
            currentWeatherAPI.getCurrentWeather(handleCurrentWeather: handleCurrentWeather)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if cityWeather != nil {
            return 1
        }
        return 0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "WeatherCustomCell",
            for: indexPath) as! WeatherCustomCell
        cell.cityName.text = cityWeather?.cityName
        cell.currentTemparature.text = "12 °C"
        return cell
    }
}
