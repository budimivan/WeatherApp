import Foundation
import CoreData


extension CDcurrentWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDcurrentWeather> {
        return NSFetchRequest<CDcurrentWeather>(entityName: "CDcurrentWeather")
    }

    @NSManaged public var cityID: Int32
    @NSManaged public var cityName: String
    @NSManaged public var clouds: Double
    @NSManaged public var sunRise: Double
    @NSManaged public var sunSet: Double
    @NSManaged public var timeUTC: Double
    @NSManaged public var weatherTemparature: Double
    @NSManaged public var weatherDescription: String
    @NSManaged public var weatherIcon: String
    @NSManaged public var wind: Double
    @NSManaged public var dateDisplayOrder: Date

}
