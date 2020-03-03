import Foundation
import CoreData


extension CDwind {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDwind> {
        return NSFetchRequest<CDwind>(entityName: "CDwind")
    }

    @NSManaged public var wind: Double
    @NSManaged public var windForecast: CDforecastWeather?

}
