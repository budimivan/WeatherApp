import UIKit
import PureLayout

extension WeatherCustomCell {
    func buildViews() {
        createViews()
        defineLayoutForViews()
        styleViews()
    }
    
    private func createViews() {
        containerView = UIView(forAutoLayout: ())
        addSubview(containerView)
        cityName = UILabel(forAutoLayout: ())
        currentTemparature = UILabel(forAutoLayout: ())
        currentWeatherIcon = UIImageView(forAutoLayout: ())
        forcastDayOne = UILabel(forAutoLayout: ())
        forcastDayTwo = UILabel(forAutoLayout: ())
        forcastDayThree = UILabel(forAutoLayout: ())
        forcastDayFour = UILabel(forAutoLayout: ())
        forcastDayFive = UILabel(forAutoLayout: ())
        forcastDayOneIcon = UIImageView(forAutoLayout: ())
        forcastDayTwoIcon = UIImageView(forAutoLayout: ())
        forcastDayThreeIcon = UIImageView(forAutoLayout: ())
        forcastDayFourIcon = UIImageView(forAutoLayout: ())
        forcastDayFiveIcon = UIImageView(forAutoLayout: ())

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
