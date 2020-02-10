import UIKit

class CurrentWeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var cityWeather: CurrentWeather?
    var presenter: CityListPresenter!

    convenience init(presenter: CityListPresenter) {
        self.init()
        self.presenter = presenter
    }
    
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
        presenter.getWeatherData(handleCurrentWeather: handleCurrentWeather)
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
