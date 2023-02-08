//
//  TopMoversItemView.swift
//  CryptoPriceCharts
//
//  Created by Sergey Petrosyan on 07.02.23.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            KFImage(URL(string: coin.image ?? ""))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            HStack(spacing: 2) {
                Text(coin.symbol?.uppercased() ?? "")
                    .font(.caption)
                    .fontWeight(.bold)
                
                Text("\(coin.currentPrice.formattedToCurrencyString())")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            
            Text(coin.priceChangePercentage24H?.formattedToPercentString() ?? "")
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H ?? 0 > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4), lineWidth: 2))
    }
}

struct TopMoversItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversItemView(coin: Coin(id: nil, symbol: nil, name: nil, image: nil, marketCapRank: 0, currentPrice: 0, marketCap: 0, fullyDilutedValuation: 0, totalVolume: nil, high24H: nil, low24H: nil, priceChange24H: nil, priceChangePercentage24H: nil, marketCapChange24H: nil, marketCapChangePercentage24H: nil, circulatingSupply: nil, totalSupply: nil, maxSupply: nil, ath: nil, athChangePercentage: nil, athDate: nil, atl: nil, atlChangePercentage: nil, atlDate: nil, lastUpdated: nil, sparklineIn7D: nil, priceChangePercentage24HInCurrency: nil))
    }
}
