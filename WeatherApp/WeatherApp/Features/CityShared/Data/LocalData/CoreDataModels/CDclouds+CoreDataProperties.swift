import Foundation
import CoreData


extension CDclouds {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDclouds> {
        return NSFetchRequest<CDclouds>(entityName: "CDclouds")
    }

    @NSManaged public var clouds: Double
    @NSManaged public var cloudsForecast: CDforecastWeather?

}
