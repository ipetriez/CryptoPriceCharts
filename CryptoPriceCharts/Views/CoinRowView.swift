//
//  CoinRowView.swift
//  CryptoPriceCharts
//
//  Created by Sergey Petrosyan on 07.02.23.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank)")
                .font(.caption)
            
            KFImage(URL(string: coin.image ?? ""))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol?.uppercased() ?? "")
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.formattedToCurrencyString())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.trailing, 4)
                
                Text(coin.priceChangePercentage24H?.formattedToPercentString() ?? "")
                    .font(.caption)
                    .padding(.trailing, 6)
                    .foregroundColor(coin.priceChangePercentage24H ?? 0 > 0 ? .green : .red)
            }
            .font(.caption)
        }
        .padding(EdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6))
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: Coin(id: nil, symbol: nil, name: nil, image: nil, marketCapRank: 0, currentPrice: 0, marketCap: 0, fullyDilutedValuation: 0, totalVolume: nil, high24H: nil, low24H: nil, priceChange24H: nil, priceChangePercentage24H: nil, marketCapChange24H: nil, marketCapChangePercentage24H: nil, circulatingSupply: nil, totalSupply: nil, maxSupply: nil, ath: nil, athChangePercentage: nil, athDate: nil, atl: nil, atlChangePercentage: nil, atlDate: nil, lastUpdated: nil, sparklineIn7D: nil, priceChangePercentage24HInCurrency: nil))
    }
}
