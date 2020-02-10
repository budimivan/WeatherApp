import Foundation

class WeatherUseCase {
     
    let weatherRepository: WeatherDataRepository
    
    init(weatherRepository: WeatherDataRepository) {
        self.weatherRepository = weatherRepository
    }
    
   func getWeatherData(handleCurrentWeather: @escaping (CurrentWeather) -> Void) {
        weatherRepository.getWeatherData(handleCurrentWeather: handleCurrentWeather)
    }
}
