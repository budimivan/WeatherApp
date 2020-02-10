import Foundation

class CityListPresenter {
    
   var weatherUseCase: WeatherUseCase
    
    init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
    }
    
    func getWeatherData(handleCurrentWeather: @escaping (CurrentWeather) -> Void) {
        weatherUseCase.getWeatherData(handleCurrentWeather: handleCurrentWeather)
    }
}
