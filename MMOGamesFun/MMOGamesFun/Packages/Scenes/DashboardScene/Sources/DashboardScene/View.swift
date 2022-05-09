//
//  SwiftUIView.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import DIContainer
import SwiftUI

public struct DashboardView: View {
    @InjectedObject
    var viewModel: ViewModel

    public init() {}
    public var body: some View {
        VStack {
            HStack {
                Text("🎮")
                Text("Dashboard")
                    .font(.largeTitle)
            }

            Button(action: {
                print("GameList tapped!")
                viewModel.showGamesList()
            }) {
                HStack {
                    Image(systemName: "gamecontroller")
                        .font(.title)
                    Text("Game lists")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
            }
        }
    }
}
