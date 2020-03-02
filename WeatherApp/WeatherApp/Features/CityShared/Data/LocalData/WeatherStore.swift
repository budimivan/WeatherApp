import Foundation
import CoreData
import RxSwift

class WeatherStore {
    
    let coreDataStack: CoreDataStack
    var cityFetch: NSFetchRequest<CDcurrentWeather> =  CDcurrentWeather.fetchRequest()
    var cityForecastFetch: NSFetchRequest<CDforecastWeather> = CDforecastWeather.fetchRequest()
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
        self.cityForecastFetch.sortDescriptors = [NSSortDescriptor(key: "dateDisplayOrder", ascending: false)]
        self.cityFetch.sortDescriptors = [NSSortDescriptor(key: "dateDisplayOrder", ascending: false)]
    }
    
    func storeWeatherData (_ currentWeather: CurrentWeatherViewModel, _ forecastWeather: ForecastWeatherViewModel) {
        let currentCityID = currentWeather.cityID
        let currentCity: CDcurrentWeather
        cityFetch.predicate = NSPredicate(format: "%K == %ld", #keyPath(CDcurrentWeather.cityID), currentCityID)
        
            
        do {
            let results = try coreDataStack.managedContext.fetch(cityFetch)
            if results.count > 0 {
                currentCity = results.first!
            } else {
                currentCity = CDcurrentWeather(context: coreDataStack.managedContext)
                currentCity.cityID = Int32(currentWeather.cityID)
                currentCity.cityName = currentWeather.cityName
                currentCity.clouds = currentWeather.clouds
                currentCity.sunRise = currentWeather.sunRise
                currentCity.sunSet = currentWeather.sunSet
                currentCity.timeUTC = currentWeather.timeUTC
                currentCity.weatherTemparature = currentWeather.weatherTemparature
                currentCity.weatherDescription = currentWeather.weatherDescription
                currentCity.weatherIcon = currentWeather.weatherIcon ?? ""
                currentCity.wind = currentWeather.wind ?? 0
                currentCity.dateDisplayOrder = Date()
               try coreDataStack.managedContext.save()
            }
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)") }
        
        let forecastCity: CDforecastWeather
        cityForecastFetch.predicate = NSPredicate(format: "%K == %ld", #keyPath(CDforecastWeather.cityID), currentCityID)
        
        
        do {
            let results = try coreDataStack.managedContext.fetch(cityForecastFetch)
            if results.count > 0 {
                forecastCity = results.first!
            } else {
                forecastCity = CDforecastWeather(context: coreDataStack.managedContext)
                forecastCity.cityID = Int32(currentCityID)
                forecastCity.dateDisplayOrder = Date()
                
                var winds: [CDwind] = []
                for forecastWind in forecastWeather.wind! {
                    let windModel = CDwind(context: coreDataStack.managedContext)
                    windModel.wind = forecastWind
                    winds.append(windModel)
                }
                forecastCity.wind = NSOrderedSet(array: winds)
                
                var temparatures: [CDweatherTemparatures] = []
                for forecastTemp in forecastWeather.weatherTemparature {
                    let temparatureModel = CDweatherTemparatures(context: coreDataStack.managedContext)
                    temparatureModel.weatherTemparatures = forecastTemp
                    temparatures.append(temparatureModel)
                }
             
                forecastCity.weatherTemparatures = NSOrderedSet(array: temparatures)
                
                var icons: [CDweatherIcons] = []
                for forecastIcon in forecastWeather.weatherIcons {
                    let iconModel = CDweatherIcons(context: coreDataStack.managedContext)
                    iconModel.weatherIcons = forecastIcon
                    icons.append(iconModel)
                }
                        
                forecastCity.weatherIcons = NSOrderedSet(array: icons)
          
                var times: [CDtimeUTC] = []
                for forecastTime in forecastWeather.timeUTC {
                    let timeModel = CDtimeUTC(context: coreDataStack.managedContext)
                    timeModel.timeUTC = forecastTime
                    times.append(timeModel)
                }
                
                forecastCity.timeUTC = NSOrderedSet(array: times)
                
                var clouds: [CDclouds] = []
                for forecastCloud in forecastWeather.clouds {
                    let cloudModel = CDclouds(context: coreDataStack.managedContext)
                    cloudModel.clouds = forecastCloud
                    clouds.append(cloudModel)
                }
                
                forecastCity.clouds = NSOrderedSet(array: clouds)
            }
            try coreDataStack.managedContext.save()
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)") }
    }
    
    func getCurrentWeather() -> Observable<[CurrentWeatherViewModel]> {
        return coreDataStack
            .entities(fetchRequest: cityFetch as! NSFetchRequest<NSFetchRequestResult>)
            .compactMap { requestResult -> [CDcurrentWeather]? in
                return requestResult as? [CDcurrentWeather]
            }
        .map { cdWeathers -> [CurrentWeatherViewModel] in
            cdWeathers.map { CurrentWeatherViewModel($0) }
        }
    }
    
    func getForecastWeather() -> Observable<[ForecastWeatherViewModel]> {
        return coreDataStack
            .entities(fetchRequest: cityForecastFetch as! NSFetchRequest<NSFetchRequestResult>)
            .compactMap { requestResult -> [CDforecastWeather]? in
                return requestResult as? [CDforecastWeather]
            }
        .map { cdForecastWeathers -> [ForecastWeatherViewModel] in
            cdForecastWeathers.map { ForecastWeatherViewModel($0) }
        }
    }
}
