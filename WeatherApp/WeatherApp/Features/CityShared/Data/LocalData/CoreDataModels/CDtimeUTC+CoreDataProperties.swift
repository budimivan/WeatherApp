import Foundation
import CoreData


extension CDtimeUTC {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDtimeUTC> {
        return NSFetchRequest<CDtimeUTC>(entityName: "CDtimeUTC")
    }

    @NSManaged public var timeUTC: Double
    @NSManaged public var timeUTCForecast: CDforecastWeather?

}
