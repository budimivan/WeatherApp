import UIKit

extension WeatherViewController {
   func buildViews() {
        createViews()
        defineLayoutForViews()
        styleViews()
    }
    
    private func createViews() {
        tableView = UITableView()
        view.addSubview(tableView)
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    private func defineLayoutForViews() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    private func styleViews() {
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        tableView.separatorStyle = .none
        tableView.rowHeight = view.safeAreaLayoutGuide.layoutFrame.size.height / 2.4
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = AppStrings.searchBarPlaceHolder
    }
}
