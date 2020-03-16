import UIKit
import PureLayout
import AVKit
import EMTNeumorphicView

extension DetailsWeatherViewController {
    
    func buildViews() {
        createViews()
        defineLayoutForViews()
        styleViews()
    }
    
    private func createViews() {
    
        detailsView = EMTNeumorphicView()
        sunRiseStackView = UIStackView()
        sunSetStackView = UIStackView()
        windStackView = UIStackView()
        cloudsStackView = UIStackView()
        sunRiseImage = UIImage(systemName: "sunrise")
        sunSetImage = UIImage(systemName: "sunset")
        windImage = UIImage(systemName: "tornado")
        cloudsImage = UIImage(systemName: "cloud.sun")
        sunRiseImageView = UIImageView()
        sunRiseImageView.image = sunRiseImage
        sunRiseImageView.tintColor = .white
        sunSetImageView = UIImageView()
        sunSetImageView.image = sunSetImage
        sunSetImageView.tintColor = .white
        windImageView = UIImageView()
        windImageView.image = windImage
        windImageView.tintColor = .white
        cloudsImageView = UIImageView()
        cloudsImageView.image = cloudsImage
        cloudsImageView.tintColor = .white
        sunRise = UILabel()
        sunSet = UILabel()
        wind = UILabel()
        clouds = UILabel()
        
        sunRiseStackView.addArrangedSubviews(sunRiseImageView, sunRise)
        sunSetStackView.addArrangedSubviews(sunSetImageView, sunSet)
        windStackView.addArrangedSubviews(windImageView, wind)
        cloudsStackView.addArrangedSubviews(cloudsImageView, clouds)
        
        detailsView.addSubviews(
            sunRiseStackView,
            sunSetStackView,
            windStackView,
            cloudsStackView)

        view.addSubviews(detailsView)
    }
    
    private func defineLayoutForViews() {
        sunRiseStackView.axis = .vertical
        sunSetStackView.axis = .vertical
        windStackView.axis = .vertical
        cloudsStackView.axis = .vertical
        
        detailsView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 100,
                                                                    left: 30,
                                                                    bottom: 200,
                                                                    right: 30))
        
        sunRiseImageView.autoSetDimensions(to: CGSize(width: 90, height: 70))
        sunSetImageView.autoSetDimensions(to: CGSize(width: 90, height: 70))
        windImageView.autoSetDimensions(to: CGSize(width: 90, height: 70))
        cloudsImageView.autoSetDimensions(to: CGSize(width: 90, height: 70))
    
        sunRiseStackView.autoAlignAxis(.horizontal, toSameAxisOf: detailsView, withOffset: -105)
        sunSetStackView.autoAlignAxis(.horizontal, toSameAxisOf: detailsView, withOffset: -105)
        windStackView.autoAlignAxis(.horizontal, toSameAxisOf: detailsView, withOffset: 105)
        cloudsStackView.autoAlignAxis(.horizontal, toSameAxisOf: detailsView, withOffset: 105)
        
        sunRiseStackView.autoAlignAxis(.vertical, toSameAxisOf: detailsView, withOffset: -85)
        sunSetStackView.autoAlignAxis(.vertical, toSameAxisOf: detailsView, withOffset: 85)
        windStackView.autoAlignAxis(.vertical, toSameAxisOf: detailsView, withOffset: -85)
        cloudsStackView.autoAlignAxis(.vertical, toSameAxisOf: detailsView, withOffset: 85)
    }
    
    private func styleViews() {
        sunRise.font = UIFont(name: "Roboto-Regular", size: 30)
        sunSet.font = UIFont(name: "Roboto-Regular", size: 30)
        wind.font = UIFont(name: "Roboto-Regular", size: 30)
        clouds.font = UIFont(name: "Roboto-Regular", size: 30)
        sunRise.textColor = .white
        sunSet.textColor = .white
        wind.textColor = .white
        clouds.textColor = .white
    
        sunRiseStackView.alignment = .center
        sunRiseStackView.distribution = .fillEqually
        sunRiseStackView.spacing = 20
    
        sunSetStackView.alignment = .center
        sunSetStackView.distribution = .fillEqually
        sunSetStackView.spacing = 20
        
        windStackView.alignment = .center
        windStackView.distribution = .fillEqually
        windStackView.spacing = 20
        
        cloudsStackView.alignment = .center
        cloudsStackView.distribution = .fillEqually
        cloudsStackView.spacing = 20
        
        detailsView.neumorphicLayer?.cornerRadius = 20
        detailsView.neumorphicLayer?.depthType = .convex
        detailsView.neumorphicLayer?.elementDepth = 100
        detailsView.neumorphicLayer?.lightShadowOpacity = 10
        detailsView.neumorphicLayer?.darkShadowOpacity = 10
        detailsView.neumorphicLayer?.elementColor = CGColor(srgbRed: -1.33692,
                                                            green: 0.62539,
                                                            blue: 0.96147,
                                                            alpha: 0.5)
    }
}
