import UIKit

class WeatherCustomCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var currentTemparature: UILabel!
    
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
