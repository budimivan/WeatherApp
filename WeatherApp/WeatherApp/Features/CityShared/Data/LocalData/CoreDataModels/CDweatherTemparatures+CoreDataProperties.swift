import Foundation
import CoreData


extension CDweatherTemparatures {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDweatherTemparatures> {
        return NSFetchRequest<CDweatherTemparatures>(entityName: "CDweatherTemparatures")
    }

    @NSManaged public var weatherTemparatures: Double
    @NSManaged public var weatherTemparaturesForecast: CDforecastWeather?

}
