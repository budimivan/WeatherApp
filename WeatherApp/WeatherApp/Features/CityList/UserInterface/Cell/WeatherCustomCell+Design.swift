import UIKit
import PureLayout

extension WeatherCustomCell {
    func buildViews() {
        createViews()
        defineLayoutForViews()
        styleViews()
    }
    
    private func createViews() {
        containerView = UIView()
        addSubview(containerView)
        cityName = UILabel()
        currentTemparature = UILabel()
        currentWeatherIcon = UIImageView()
        forcastDayOne = UILabel()
        forcastDayTwo = UILabel()
        forcastDayThree = UILabel()
        forcastDayFour = UILabel()
        forcastDayFive = UILabel()
        forcastDayOneIcon = UIImageView()
        forcastDayTwoIcon = UIImageView()
        forcastDayThreeIcon = UIImageView()
        forcastDayFourIcon = UIImageView()
        forcastDayFiveIcon = UIImageView()

        containerView
            .addSubviews(cityName,
                         currentTemparature,
                         currentWeatherIcon,
                         forcastDayOne,
                         forcastDayTwo,
                         forcastDayThree,
                         forcastDayFour,
                         forcastDayFive,
                         forcastDayOneIcon,
                         forcastDayTwoIcon,
                         forcastDayThreeIcon,
                         forcastDayFourIcon,
                         forcastDayFiveIcon)
    }
    
    private func defineLayoutForViews() {
        containerView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10,
                                                                      left: 10,
                                                                      bottom: 0,
                                                                      right: 10))

        cityName.autoPinEdge(.top, to: .top, of: containerView, withOffset: 2)
        cityName.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        
        currentWeatherIcon.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        currentWeatherIcon.autoAlignAxis(.horizontal, toSameAxisOf: containerView)
            
        currentTemparature.autoPinEdge(.top, to: .top, of: containerView, withOffset: 35)
        currentTemparature.autoAlignAxis(.vertical, toSameAxisOf: containerView)
    }
    
    private func styleViews() {
        selectionStyle = .blue
    }
}
