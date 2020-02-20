import UIKit
import RxSwift

class CurrentWeatherViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate,
    UISearchBarDelegate,
    UISearchResultsUpdating {
   
    private let disposeBag = DisposeBag()
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var tableView: UITableView!
    var presenter: CityListPresenter!
    var cityListCurrent = [CurrentWeatherViewModel]()
    var cityListForecast = [ForecastWeatherViewModel]()

    convenience init(presenter: CityListPresenter) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = AppStrings.searchBarPlaceHolder
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
        presenter
            .getCurrentWeatherData(searchBar.text ?? "")
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onSuccess: { [weak self] model in
                self?.cityListCurrent.append(model)
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        
        presenter
            .getForecastData(searchBar.text ?? "")
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onSuccess: { [weak self] model in
                self?.cityListForecast.append(model)
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
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
        cell.setCellUIProperties(cityCurrentWeather: cityCurrentWeather,
                                 cityForecastWeather: cityForecastWeather)
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
        presenter.handleCitySelected(city: cityListCurrent[indexPath.row])
    }
}
