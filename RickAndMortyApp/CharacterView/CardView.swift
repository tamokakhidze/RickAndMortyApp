//
//  CardView.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import SwiftUI

struct CardView: View {
    let character: Character
    var imageUrl: URL {
        URL(string: character.image!)!
    }
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .scaledToFill()
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 160, height: 100)
                    .cornerRadius(10)
                    
                    Rectangle()
                        .frame(width: 160, height: 100)
                        .cornerRadius(10)
                        .foregroundStyle(Color.gray.opacity(0.4))
                    
                    VStack {
                        Spacer()
                        HStack {
                            Text("Details:")
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                                .padding(5)
                            Spacer()
                        }
                    }
                }
                
                Spacer()
                    .frame(height: 8)
                
                HStack {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(character.name)
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray.opacity(0.6))
                            .lineLimit(1)
                        
                        HStack {
                            
                            Text(character.species)
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
