//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Jahnavi Vemuri on 05/01/24.
//
import UIKit

class WeatherViewController: UIViewController {
    var weather: WeatherResponse?

    @IBOutlet var tempValue: UILabel!
    @IBOutlet var latValue: UILabel!
    @IBOutlet var lonValue: UILabel!
    @IBOutlet var windSpeedValue: UILabel!
    @IBOutlet var pressureValue: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var weatherConditionLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        displayWeatherInformation()
    }

    func displayWeatherInformation() {
        if let temperature = weather?.main.temp {
            let formattedTemperature = String(format: "%.2f°C", temperature - 273.15)
            tempValue.text = formattedTemperature
            tempValue.font = .systemFont(ofSize: 50)
        }
        if let weatherCondition = weather?.weather.first?.main {
                    weatherConditionLabel.text = "\(weatherCondition)"
                    weatherConditionLabel.font = .systemFont(ofSize: 20)
                    weatherImage.image = WeatherImageUtility.getImageForWeatherCondition(weatherCondition)
                }
        if let city = weather?.name, let country = weather?.sys.country {
            location.text = "\(city), \(country)"
            location.font = .systemFont(ofSize: 25)
        }
        if let latitude = weather?.coord.lat {
            latValue.text = String(format: "%.2f", latitude)
        }

        if let longitude = weather?.coord.lon {
            lonValue.text = String(format: "%.2f", longitude)
        }

        if let windSpeed = weather?.wind.speed {
            windSpeedValue.text = "\(windSpeed) m/s"
        }

        if let pressure = weather?.main.pressure {
            pressureValue.text = "\(pressure) hPa"
        }
    }

    @objc func backButtonTapped() {
            dismiss(animated: true, completion: nil)
        }
}
