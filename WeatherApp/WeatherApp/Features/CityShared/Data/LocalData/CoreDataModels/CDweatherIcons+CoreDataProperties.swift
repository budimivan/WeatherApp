import Foundation
import CoreData


extension CDweatherIcons {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDweatherIcons> {
        return NSFetchRequest<CDweatherIcons>(entityName: "CDweatherIcons")
    }

    @NSManaged public var weatherIcons: String
    @NSManaged public var weatherIconsForecast: CDforecastWeather?

}
