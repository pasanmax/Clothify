//
//  ContentView.swift
//  Clothify
//
//  Created by Pasan Anjana Hettiarachchi on 2024-03-09.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Text("Colthify")
                .font(.title)
                .frame(width: 300)
        }
        .padding(.vertical, 8).ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
