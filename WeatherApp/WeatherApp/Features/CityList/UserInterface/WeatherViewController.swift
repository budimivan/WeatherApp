import UIKit
import RxSwift
import CoreData
import RxCocoa
import RxDataSources

class WeatherViewController:
    UIViewController
{

    @IBOutlet weak var tableView: UITableView!
    var presenter: CityListPresenter!
    var currentCity: CurrentWeatherViewModel?
    let searchController = UISearchController(searchResultsController: nil)
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = AppStrings.searchBarPlaceHolder
        navigationItem.searchController = searchController
        definesPresentationContext = true
        let nib = UINib(nibName: "WeatherCustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherCustomCell")
        navigationItem.rightBarButtonItem = editButtonItem
      
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfWeather>(
            configureCell: { _, tableView, indexPath, item in
               let cell = tableView.dequeueReusableCell(
                   withIdentifier: "WeatherCustomCell",
                   for: indexPath) as! WeatherCustomCell
                cell.setCellUIProperties(
                    cityCurrentWeather: item.currentWeather,
                    cityForecastWeather: item.forecastWeather)
               return cell
        })
        
        tableView
            .rx
            .modelSelected(WeatherViewModel.self)
            .subscribe(onNext: {[weak self] weatherViewModel in
                self?.presenter.handleCitySelected(city: weatherViewModel.currentWeather)
            })
            .disposed(by: disposeBag)
    
        presenter.getWeatherData().map {[SectionOfWeather(header: "weather", items: $0)]}
          .bind(to: tableView.rx.items(dataSource: dataSource))
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
}
