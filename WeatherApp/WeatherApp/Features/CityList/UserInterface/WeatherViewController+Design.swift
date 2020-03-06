import UIKit

extension WeatherViewController {
   func buildViews() {
        createViews()
        defineLayoutForViews()
        styleViews()
    }
    
    private func createViews() {
        tableView = UITableView(forAutoLayout: ())
        view.addSubview(tableView)
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    private func defineLayoutForViews() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    private func styleViews() {
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = view.safeAreaLayoutGuide.layoutFrame.size.height / 4
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = AppStrings.searchBarPlaceHolder
    }
}
