import UIKit

class CurrentWeatherViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate,
    UISearchBarDelegate,
    UISearchResultsUpdating,
    CurrentWeatherDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    var presenter: CityListPresenter!
    var cityList = [CurrentWeatherViewModel]()
    let searchController = UISearchController(searchResultsController: nil)

    convenience init(presenter: CityListPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.weatherDelegate = self
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
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(!isEditing, animated: true)
        tableView.setEditing(!tableView.isEditing, animated: true)
    }

    func handldeWeatherData(weatherViewModel: CurrentWeatherViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.cityList.append(weatherViewModel)
            self.tableView.reloadData()
        }
    }
    
     func tableView(
        _ tableView: UITableView,
        editingStyleForRowAt indexPath: IndexPath
     ) -> UITableViewCell.EditingStyle {
        return .delete
    }

     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = cityList[sourceIndexPath.row]
        cityList.remove(at: sourceIndexPath.row)
        cityList.insert(movedObject, at: destinationIndexPath.row)
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
        return cityList.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "WeatherCustomCell",
            for: indexPath) as! WeatherCustomCell
        let city = cityList[indexPath.row]
        cell.cityName.text = city.cityName
        cell.currentTemparature.text = String(format: "%.0f", city.weatherTemparature) + " °C"
//refactor code for image, Kingfisher?
        let image = "https://openweathermap.org/img/w/" + city.weatherIcon! + ".png"
        let url = URL(string: image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.icon.image = UIImage(data: data!)
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
            cityList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
//        let navigationService = NavigationService()
//        navigationService.pushDetailsWeatherViewController()
        self.present(DetailsWeatherViewController(city: cityList[indexPath.row]), animated: true, completion: nil)
    }
}
