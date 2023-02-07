//
//  CoinRowView.swift
//  CryptoPriceCharts
//
//  Created by Sergey Petrosyan on 07.02.23.
//

import SwiftUI

struct CoinRowView: View {
    var body: some View {
        HStack {
            Text("1")
                .font(.caption)
            
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Bitcoin")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text("BTC")
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("$20,300.00")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.trailing, 4)
                
                Text("+ 5.6%")
                    .font(.caption)
                    .padding(.trailing, 6)
            }
            .font(.caption)
        }
        .padding(EdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6))
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView()
    }
}
