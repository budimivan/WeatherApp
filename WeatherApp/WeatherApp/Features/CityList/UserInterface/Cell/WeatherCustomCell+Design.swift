import UIKit
import PureLayout
import EMTNeumorphicView

extension WeatherCustomCell {
    func buildViews() {
        createViews()
        defineLayoutForViews()
        styleViews()
    }
    
    private func createViews() {
        cellView = EMTNeumorphicView()
        stackViewCurrent = UIStackView()
        stackViewForecast = UIStackView()
        stackViewLabel = UIStackView()
        stackViewImage = UIStackView()
        cityName = UILabel()
        currentTemparature = UILabel()
        forecastDayOne = UILabel()
        forecastDayTwo = UILabel()
        forecastDayThree = UILabel()
        forecastDayFour = UILabel()
        forecastDayFive = UILabel()
        currentWeatherIcon = UIImageView()
        forecastDayOneIcon = UIImageView()
        forecastDayTwoIcon = UIImageView()
        forecastDayThreeIcon = UIImageView()
        forecastDayFourIcon = UIImageView()
        forecastDayFiveIcon = UIImageView()
        
        stackViewCurrent.addArrangedSubviews(currentTemparature, currentWeatherIcon)
        stackViewForecast.addArrangedSubviews(stackViewLabel, stackViewImage)
        
        stackViewLabel.addArrangedSubviews(
            forecastDayOne,
            forecastDayTwo,
            forecastDayThree,
            forecastDayFour,
            forecastDayFive)
        
        stackViewImage.addArrangedSubviews(
            forecastDayOneIcon,
            forecastDayTwoIcon,
            forecastDayThreeIcon,
            forecastDayFourIcon,
            forecastDayFiveIcon)
        
        cellView.addSubviews(cityName, stackViewCurrent, stackViewForecast)
        addSubview(cellView)
    }
    
    private func defineLayoutForViews() {
        stackViewCurrent.axis = .vertical
        stackViewForecast.axis = .vertical
        cellView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 20,
                                                                 left: 20,
                                                                 bottom: 20,
                                                                 right: 20))

        stackViewCurrent.autoPinEdge(.top, to: .top, of: cellView, withOffset: 30)
        stackViewCurrent.autoPinEdge(.trailing, to: .trailing, of: cellView, withOffset: -50)
        stackViewCurrent.autoSetDimension(.height, toSize: 100)
    
        stackViewForecast.autoPinEdge(.bottom, to: .bottom, of: cellView, withOffset: -10)
        stackViewForecast.autoAlignAxis(.vertical, toSameAxisOf: cellView)
        stackViewForecast.autoSetDimension(.height, toSize: 100)
      
        cityName.autoPinEdge(.top, to: .top, of: cellView, withOffset: 70)
        cityName.autoPinEdge(.leading, to: .leading, of: cellView, withOffset: 50)
    }
    
    private func styleViews() {
        self.selectionStyle = .none
        cityName.font = UIFont(name: "Roboto-Regular", size: 30)
        currentTemparature.font = UIFont(name: "Roboto-Regular", size: 20)
        forecastDayOne.font = UIFont(name: "Roboto-Regular", size: 20)
        forecastDayTwo.font = UIFont(name: "Roboto-Regular", size: 20)
        forecastDayThree.font = UIFont(name: "Roboto-Regular", size: 20)
        forecastDayFour.font = UIFont(name: "Roboto-Regular", size: 20)
        forecastDayFive.font = UIFont(name: "Roboto-Regular", size: 20)
        cityName.textColor = .white
        currentTemparature.textColor = .white
        forecastDayOne.textColor = .white
        forecastDayTwo.textColor = .white
        forecastDayThree.textColor = .white
        forecastDayFour.textColor = .white
        forecastDayFive.textColor = .white
        
        stackViewCurrent.alignment = .fill
        stackViewForecast.alignment = .fill
        stackViewLabel.alignment = .center
        stackViewLabel.distribution = .fillEqually
        stackViewLabel.spacing = 10
        stackViewImage.alignment = .center
        stackViewImage.distribution = .fillEqually
        stackViewImage.spacing = 10
        
        cellView.neumorphicLayer?.cornerRadius = 20
        cellView.neumorphicLayer?.depthType = .convex
        cellView.neumorphicLayer?.elementDepth = 50
        cellView.neumorphicLayer?.lightShadowOpacity = 1
        cellView.neumorphicLayer?.darkShadowOpacity = 1
        cellView.neumorphicLayer?.elementColor = CGColor(srgbRed: -1.33692,
                                                         green: 0.62539,
                                                         blue: 0.96147,
                                                         alpha: 0.3)
    }
}
