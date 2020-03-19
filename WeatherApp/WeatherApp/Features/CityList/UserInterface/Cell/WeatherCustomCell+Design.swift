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
        cityName.font = .cellFont
        currentTemparature.font = .cellFont
        forecastDayOne.font = .cellFont
        forecastDayTwo.font = .cellFont
        forecastDayThree.font = .cellFont
        forecastDayFour.font = .cellFont
        forecastDayFive.font = .cellFont
        cityName.textColor = .appThemeColor
        currentTemparature.textColor = .appThemeColor
        forecastDayOne.textColor = .appThemeColor
        forecastDayTwo.textColor = .appThemeColor
        forecastDayThree.textColor = .appThemeColor
        forecastDayFour.textColor = .appThemeColor
        forecastDayFive.textColor = .appThemeColor
        
        stackViewCurrent.alignment = .fill
        stackViewForecast.alignment = .fill
        stackViewLabel.alignment = AppLayout.alignment
        stackViewLabel.distribution = AppLayout.distribution
        stackViewLabel.spacing = AppLayout.spacing - 10
        stackViewImage.alignment = AppLayout.alignment
        stackViewImage.distribution = AppLayout.distribution
        stackViewImage.spacing = AppLayout.spacing - 10
        
        cellView.neumorphicLayer?.cornerRadius = AppLayout.cornerRadius
        cellView.neumorphicLayer?.depthType = AppLayout.depthType
        cellView.neumorphicLayer?.elementDepth = AppLayout.elementDepth
        cellView.neumorphicLayer?.lightShadowOpacity = AppShadows.lightShadowOpacity
        cellView.neumorphicLayer?.darkShadowOpacity = AppShadows.darkShadowOpacity
        cellView.neumorphicLayer?.elementColor = .cellBackgroundColor
    }
}
