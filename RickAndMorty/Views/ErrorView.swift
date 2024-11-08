//
//  ErrorView.swift
//  RickAndMorty
//
//  Created by bod on 11/5/24.
//

import SwiftUI

struct ErrorView: View {
    
    private let description: String
    
    init(description: String) {
        self.description = description
    }
    
    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: 80, height: 80)
            
            Text(description)
                .font(.headline)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ErrorView(description: MockDataProvider.errorBadURL)
}
