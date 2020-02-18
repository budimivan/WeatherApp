import UIKit

class WeatherCustomCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var currentTemparature: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var forcastDayOne: UILabel!
    @IBOutlet weak var forcastDayTwo: UILabel!
    @IBOutlet weak var forcastDayThree: UILabel!
    @IBOutlet weak var forcastDayFour: UILabel!
    @IBOutlet weak var forcastDayFive: UILabel!
    @IBOutlet weak var forcastDayOneIcon: UIImageView!
    @IBOutlet weak var forcastDayTwoIcon: UIImageView!
    @IBOutlet weak var forcastDayThreeIcon: UIImageView!
    @IBOutlet weak var forcastDayFourIcon: UIImageView!
    @IBOutlet weak var forcastDayFiveIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(
        _ selected: Bool,
        animated: Bool
    ) {
        super.setSelected(selected, animated: animated)
    }
}
