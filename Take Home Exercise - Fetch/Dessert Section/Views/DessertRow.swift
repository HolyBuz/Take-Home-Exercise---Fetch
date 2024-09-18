//
//  DessertRow.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import SwiftUI

struct DessertRow: View {
    
    let desert: Meal
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: desert.thumbnailURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                default:
                    Image(systemName: "questionmark.diamond")
                }
            }
            
            Text(desert.name)
        }
    }
}
