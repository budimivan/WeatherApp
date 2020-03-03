import UIKit
import RxSwift
import CoreData
import RxCocoa

class CurrentWeatherViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    var presenter: CityListPresenter!
    var cityListCurrent = [CurrentWeatherViewModel]()
    var cityListForecast = [ForecastWeatherViewModel]()
    let searchController = UISearchController(searchResultsController: nil)
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = AppStrings.searchBarPlaceHolder
        navigationItem.searchController = searchController
        definesPresentationContext = true
        let nib = UINib(nibName: "WeatherCustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherCustomCell")
        navigationItem.rightBarButtonItem = editButtonItem
        presenter.getWeatherData()
            .subscribe(onNext: { [weak self] currentWeather, forecastWeather in
                guard let self = self else { return }
                self.cityListCurrent = currentWeather
                self.cityListForecast = forecastWeather
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        bindSearchBar()
    }
    
    private func bindSearchBar() {
        let searchButtonClicked = searchController
            .searchBar.rx
            .searchButtonClicked
           
        let searchValue = searchController.searchBar.rx.value
        
        searchButtonClicked
            .withLatestFrom(searchValue)
            .flatMap { [weak self] cityName -> Single<(CurrentWeather, ForecastWeather)> in
                guard
                    let self = self,
                    let cityName = cityName,
                    !cityName.isEmpty
                else {
                    return .never()
                }
                return self.presenter.storeWeatherData(forCityName: cityName)
            }
            .subscribe(onNext: { [weak self] _ in
                self?.searchController.isActive = false
            })
            .disposed(by: disposeBag)
    }
    
    override func setEditing(
        _ editing: Bool,
        animated: Bool) {
        super.setEditing(!isEditing, animated: true)
        tableView.setEditing(!tableView.isEditing, animated: true)
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
        cell.setCellUIProperties(cityCurrentWeather: cityListCurrent.at(indexPath.row),
                                 cityForecastWeather: cityListForecast.at(indexPath.row))
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
