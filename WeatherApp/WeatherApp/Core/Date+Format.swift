import Foundation

extension Date {

    enum YearStyle: String {
        case noPadding = "y"
        case twoDigits = "yy"
        case fourDigits = "yyyy"

        var dateFormat: String { return rawValue }
    }

    enum QuarterStyle: String {
        case number = "Q"
        case zeroPaddedNumber = "QQ"
        case qAndNumber = "QQQ"
        case spelledOut = "QQQQ"

        var dateFormat: String { return rawValue }
    }

    enum MonthStyle: String {
        case number = "M"
        case zeroPaddedNumber = "MM"
        case shortName = "MMM"
        case fullName = "MMMM"
        case narrowName = "MMMMM"

        var dateFormat: String { return rawValue }
    }

    enum DayStyle: String {
        case number = "d"
        case zeroPaddedNumber = "dd"
        case dayOfWeekInMonth = "F"
        case shortDayOfWeek = "E"
        case fullDayOfWeek = "EEEE"
        case narrowDayOfWeek = "EEEEE"

        var dateFormat: String { return rawValue }
    }

    enum HourStyle: String {
        case twelveHour = "h"
        case zeroPaddedTwelveHour = "hh"
        case twentyFourHour = "H"
        case zeroPaddedTwentyFourHour = "HH"
        case AMorPM = "a"

        var dateFormat: String { return rawValue }
    }

    enum MinuteStyle: String {
        case number = "m"
        case zeroPaddedNumber = "mm"

        var dateFormat: String { return rawValue }
    }

    enum SecondStyle: String {
        case number = "s"
        case zeroPaddedNumber = "ss"

        var dateFormat: String { return rawValue }
    }

    enum TimeZoneStyle: String {
        case threeLetterName = "zzz"
        case expandedName = "zzzz"
        case RFC822 = "Z"
        case ISO8601 = "ZZZZZ"

        var dateFormat: String { return rawValue }
    }

    enum Separator: String {
        case dash = "-"
        case slash = "/"
        case colon = ":"
        case space = " "

        var dateFormat: String { return rawValue }
    }
}
