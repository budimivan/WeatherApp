import UIKit

class CurrentWeatherViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate,
    UISearchBarDelegate,
    UISearchResultsUpdating,
    CurrentWeatherDelegate,
    ForecastWeatherDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    var presenter: CityListPresenter!
    var cityListCurrent = [CurrentWeatherViewModel]()
    var cityListForecast = [ForecastWeatherViewModel]()
    let searchController = UISearchController(searchResultsController: nil)

    convenience init(presenter: CityListPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.currentWeatherDelegate = self
        presenter.forecastWeatherDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search cities"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        let nib = UINib(nibName: "WeatherCustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherCustomCell")
        navigationItem.rightBarButtonItem = editButtonItem
    }

    func updateSearchResults(for searchController: UISearchController) {
    }
    
    override func setEditing(
        _ editing: Bool,
        animated: Bool) {
        super.setEditing(!isEditing, animated: true)
        tableView.setEditing(!tableView.isEditing, animated: true)
    }

    func handleWeatherData(weatherViewModel: CurrentWeatherViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.cityListCurrent.append(weatherViewModel)
           
        }
    }

    func handleForecastData(weatherViewModel: ForecastWeatherViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.cityListForecast.append(weatherViewModel)
            self.tableView.reloadData()
        }
    }
    
     func tableView(
        _ tableView: UITableView,
        editingStyleForRowAt indexPath: IndexPath
     ) -> UITableViewCell.EditingStyle {
        return .delete
    }

     func tableView(
        _ tableView: UITableView,
        shouldIndentWhileEditingRowAt indexPath: IndexPath
     ) -> Bool {
        return false
    }
    
    func tableView(
        _ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath) {
        let movedObject = cityListCurrent[sourceIndexPath.row]
        cityListCurrent.remove(at: sourceIndexPath.row)
        cityListCurrent.insert(movedObject, at: destinationIndexPath.row)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.getWeatherData(searchBar.text!)
        searchController.isActive = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return cityListCurrent.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "WeatherCustomCell",
            for: indexPath) as! WeatherCustomCell
        let cityForecastWeather = cityListForecast[indexPath.row]
        let cityCurrentWeather = cityListCurrent[indexPath.row]
        cell.cityName.text = cityCurrentWeather.cityName
        cell.currentTemparature.text = String(format: "%.0f", cityCurrentWeather.weatherTemparature) + " °C"
        cell.forcastDayOne.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[0]) + " °C"
        cell.forcastDayTwo.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[1]) + " °C"
        cell.forcastDayThree.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[2]) + " °C"
        cell.forcastDayFour.text =  String(format: "%.0f", cityForecastWeather.weatherTemparature[3]) + " °C"
        cell.forcastDayFive.text = String(format: "%.0f", cityForecastWeather.weatherTemparature[4]) + " °C"
        //refactor code for image, Kingfisher?
        let image = "https://openweathermap.org/img/w/" + cityCurrentWeather.weatherIcon! + ".png"
        let url = URL(string: image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.currentWeatherIcon.image = UIImage(data: data!)
            }
        }
        _ = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[0] + ".png"
        _ = URL(string: image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.forcastDayOneIcon.image = UIImage(data: data!)
            }
        }
        _ = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[1] + ".png"
        _ = URL(string: image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.forcastDayTwoIcon.image = UIImage(data: data!)
            }
        }
        _ = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[2] + ".png"
        _ = URL(string: image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.forcastDayThreeIcon.image = UIImage(data: data!)
            }
        }
        _ = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[3] + ".png"
        _ = URL(string: image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.forcastDayFourIcon.image = UIImage(data: data!)
            }
        }
        _ = "https://openweathermap.org/img/w/" + cityForecastWeather.weatherIcon[4] + ".png"
        _ = URL(string: image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.forcastDayFiveIcon.image = UIImage(data: data!)
            }
        }
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        canEditRowAt indexPath: IndexPath
    ) -> Bool {
        return true
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            cityListCurrent.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
// this does not work, why?
//        let navigationService = NavigationService()
//        navigationService.pushDetailsWeatherViewController()
        self.present(DetailsWeatherViewController(city: cityListCurrent[indexPath.row]), animated: true, completion: nil)
    }
}
