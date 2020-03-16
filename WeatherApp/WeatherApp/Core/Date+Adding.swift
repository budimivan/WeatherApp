import Foundation

extension Date {
    func add(numberOfDays: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: numberOfDays, to: Date()) ?? Date()
    }
}
