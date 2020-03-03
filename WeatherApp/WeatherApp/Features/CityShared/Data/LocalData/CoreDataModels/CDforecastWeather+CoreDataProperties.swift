import Foundation
import CoreData


extension CDforecastWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDforecastWeather> {
        return NSFetchRequest<CDforecastWeather>(entityName: "CDforecastWeather")
    }

    @NSManaged public var cityID: Int32
    @NSManaged public var clouds: NSOrderedSet
    @NSManaged public var timeUTC: NSOrderedSet
    @NSManaged public var weatherIcons: NSOrderedSet
    @NSManaged public var weatherTemparatures: NSOrderedSet
    @NSManaged public var wind: NSOrderedSet
    @NSManaged public var dateDisplayOrder: Date

}
