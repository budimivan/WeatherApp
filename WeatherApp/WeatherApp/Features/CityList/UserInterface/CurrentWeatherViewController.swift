import UIKit
import RxSwift
import CoreData
import RxCocoa
import RxDataSources

class CurrentWeatherViewController:
    UIViewController,
    UITableViewDelegate
{
   
    @IBOutlet weak var tableView: UITableView!
    var presenter: CityListPresenter!
    var cityListCurrent = [CurrentWeatherViewModel]()
    var cityListForecast = [ForecastWeatherViewModel]()
    var cityListWeather = [WeatherViewModel]()
    let searchController = UISearchController(searchResultsController: nil)
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = AppStrings.searchBarPlaceHolder
        navigationItem.searchController = searchController
        definesPresentationContext = true
        let nib = UINib(nibName: "WeatherCustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherCustomCell")
        navigationItem.rightBarButtonItem = editButtonItem
      
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfWeather>(
          configureCell: { dataSource, tableView, indexPath, item in
            return self.makeWeatherCustomCell(currentWeather: item.currentWeather, forecastWeather: item.forecastWeather, indexPath: indexPath, from: tableView)
        })
    
        presenter.getWeatherData().map {[SectionOfWeather(header: "weather", items: $0)]}
          .bind(to: tableView.rx.items(dataSource: dataSource))
          .disposed(by: disposeBag)
        
        presenter.getWeatherData()
            .subscribe(onNext: { [weak self] weather in
                guard let self = self
                else { return }
                self.cityListWeather = weather
            })
            .disposed(by: disposeBag)
        bindSearchBar()
    }
    
    func makeWeatherCustomCell(
        currentWeather: [CurrentWeatherViewModel],
        forecastWeather: [ForecastWeatherViewModel],
        indexPath: IndexPath,
        from table: UITableView
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "WeatherCustomCell",
            for: indexPath) as! WeatherCustomCell
        cell.setCellUIProperties(cityCurrentWeather: currentWeather.at(indexPath.row),
                                 cityForecastWeather: forecastWeather.at(indexPath.row))
        return cell
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
        return cityListWeather.first?.currentWeather.count ?? 0
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
