import Foundation

class CityListPresenter {
    
    var weatherUseCase: WeatherUseCase
    weak var currentWeatherDelegate: CurrentWeatherDelegate?
    weak var forecastWeatherDelegate: ForecastWeatherDelegate?
    
    init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
    }
    
    func getWeatherData(_ cityName: String) {
        weatherUseCase.getCurrentWeatherData(handleCurrentWeather: handleCurrentWeather, cityName)
        weatherUseCase.getForecastWeatherData(handleForecastWeather: handleForecastWeather, cityName)
    }
    
    func handleCurrentWeather(weather: CurrentWeather) {
        let weatherViewModel = CurrentWeatherViewModel(weather)
        currentWeatherDelegate?.handleWeatherData(weatherViewModel: weatherViewModel)
    }
    
    func handleForecastWeather(weather: ForecastWeather) {
        let weatherViewModel = ForecastWeatherViewModel(weather)
        forecastWeatherDelegate?.handleForecastData(weatherViewModel: weatherViewModel)
    }
}
