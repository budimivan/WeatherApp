import Foundation
import RxDataSources

struct SectionOfWeather {
  var header: String
  var items: [Item]
}
extension SectionOfWeather: SectionModelType {
  typealias Item = WeatherViewModel

   init(original: SectionOfWeather, items: [Item]) {
    self = original
    self.items = items
  }
}
