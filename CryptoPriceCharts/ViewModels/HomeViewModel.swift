//
//  HomeViewModel.swift
//  CryptoPriceCharts
//
//  Created by Sergey Petrosyan on 08.02.23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var allCoins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init() {
        fetchCoinMarketsData()
    }
    
    func fetchCoinMarketsData() {
        let path = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        guard let url = URL(string: path) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let coins = try JSONDecoder().decode([Coin].self, from: data)
                    DispatchQueue.main.async {
                        self.allCoins = coins
                        self.configureTopMovingCoins()
                    }
                } catch let error {
                    print("Some decoding error: \(error)")
                }
            }
        }.resume()
    }
    
    func configureTopMovingCoins() {
        topMovingCoins = Array(allCoins
            .sorted { $0.priceChangePercentage24H ?? 0 > $1.priceChangePercentage24H ?? 0 }
            .prefix(10))
    }
}
