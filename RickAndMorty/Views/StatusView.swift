//
//  StatusView.swift
//  RickAndMorty
//
//  Created by bod on 11/6/24.
//

import SwiftUI

struct StatusView: View {
    
    private var color: Color
    
    init(status: Status) {
        switch status {
        case .alive:
            color = .green
        case .dead:
            color = .red
        case .unknown:
            color = .gray
        }
    }
    
    var body: some View {
        Circle()
            .fill(color)
    }
}

#Preview {
    StatusView(status: .alive)
}
