//
//  EpisodeCard.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import SwiftUI

struct EpisodeCard: View {
    let episode: Episode
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                    .frame(height: 8)
                
                HStack {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(episode.name)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray.opacity(0.6))
                            .lineLimit(1)
                        
                        HStack {
                            
                            Text(episode.air_date)
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .font(.system(size: 12))
                        }
                    }
                    
                    Spacer()
                    
                }
            }
            .padding(6)
            .frame(width: 176)
            .background(.colorBackground)
            .cornerRadius(10)
        }
        .padding(9)
        .background(Color.white)
    }
}
