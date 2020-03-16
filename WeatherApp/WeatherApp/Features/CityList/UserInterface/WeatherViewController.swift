import CoreData
import RxSwift
import RxCocoa
import RxDataSources
import UIKit
import PureLayout

class WeatherViewController:
    UIViewController
{
    var presenter: CityListPresenter!
    var currentCity: CurrentWeatherViewModel?
    var tableView: UITableView!
    var searchController: UISearchController!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        bindSearchBar()
        registerCell()
      
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfWeather>(
            configureCell: { _, tableView, indexPath, item in
                let cell: WeatherCustomCell = tableView.dequeueReusableCell(for: indexPath)
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
        
        //TODO: implement deleting
        tableView
            .rx
            .itemDeleted
            .subscribe {
        }.disposed(by: disposeBag)
        
        presenter.getWeatherData().map {[SectionOfWeather(header: "weather", items: $0)]}
          .bind(to: tableView.rx.items(dataSource: dataSource))
          .disposed(by: disposeBag)
        
        dataSource.canEditRowAtIndexPath = { dataSource, indexPath  in
             return true
        }
        
        dataSource.canMoveRowAtIndexPath = { dataSource, indexPath  in
            return true
        }
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override func setEditing(
               _ editing: Bool,
               animated: Bool) {
               super.setEditing(!isEditing, animated: true)
               tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    private func registerCell() {
        tableView.registerCell(WeatherCustomCell.self)
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
