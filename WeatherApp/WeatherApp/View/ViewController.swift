//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jahnavi Vemuri on 05/01/24.
//
import UIKit
import Alamofire

class ViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIButton!
    
    var weatherViewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        appTitle.text = "Weather App"
        appTitle.textAlignment = .center
        appTitle.font = .systemFont(ofSize: 40)

        searchBar.placeholder = "Enter the city name"
        searchBar.delegate = self

        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }

    @objc func searchButtonClicked() {
        performSearch()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        performSearch()
        searchBar.resignFirstResponder()
    }
    
    func performSearch() {
            guard let cityName = searchBar.text else { return }
            weatherViewModel.fetchWeather(city: cityName) { result in
                switch result {
                case .success(let weatherResponse):
                    self.performSegue(withIdentifier: "weatherResponse", sender: weatherResponse)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weatherResponse",
           let weatherDetailsVC = segue.destination as? WeatherViewController,
           let weather = sender as? WeatherResponse {
            weatherDetailsVC.weather = weather
        }
    }
}
