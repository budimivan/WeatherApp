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
        sunRise.font = .detailsFont
        sunSet.font = .detailsFont
        wind.font = .detailsFont
        clouds.font = .detailsFont
        sunRise.textColor = .appThemeColor
        sunSet.textColor = .appThemeColor
        wind.textColor = .appThemeColor
        clouds.textColor = .appThemeColor
    
        sunRiseStackView.alignment = AppLayout.alignment
        sunRiseStackView.distribution = AppLayout.distribution
        sunRiseStackView.spacing = AppLayout.spacing
    
        sunSetStackView.alignment = AppLayout.alignment
        sunSetStackView.distribution = AppLayout.distribution
        sunSetStackView.spacing = AppLayout.spacing
        
        windStackView.alignment = AppLayout.alignment
        windStackView.distribution = AppLayout.distribution
        windStackView.spacing = AppLayout.spacing
        
        cloudsStackView.alignment = AppLayout.alignment
        cloudsStackView.distribution = AppLayout.distribution
        cloudsStackView.spacing = AppLayout.spacing
        
        detailsView.neumorphicLayer?.cornerRadius = AppLayout.cornerRadius
        detailsView.neumorphicLayer?.depthType = AppLayout.depthType
        detailsView.neumorphicLayer?.elementDepth = AppLayout.elementDepth
        detailsView.neumorphicLayer?.lightShadowOpacity = AppShadows.lightShadowOpacity
        detailsView.neumorphicLayer?.darkShadowOpacity = AppShadows.darkShadowOpacity
        detailsView.neumorphicLayer?.elementColor = .detailsBackgroundColor
    }
}
