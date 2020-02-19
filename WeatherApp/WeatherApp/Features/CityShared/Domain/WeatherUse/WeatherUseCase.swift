import Foundation

class WeatherUseCase {
     
    let weatherRepository: WeatherDataRepository
    
    init(weatherRepository: WeatherDataRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func getCurrentWeatherData(handleCurrentWeather: @escaping (CurrentWeather) -> Void, _ cityName: String) {
        weatherRepository.getCurrentWeatherData(handleCurrentWeather: handleCurrentWeather, cityName)
    }
    
    func getForecastWeatherData(handleForecastWeather: @escaping (ForecastWeather) -> Void, _ cityName: String) {
        weatherRepository.getForecastWeatherData(handleForecastWeather: handleForecastWeather, cityName)
    }
}
