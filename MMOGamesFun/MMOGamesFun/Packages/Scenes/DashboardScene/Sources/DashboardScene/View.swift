//
//  SwiftUIView.swift
//
//
//  Created by Sebastian Wojtyna on 08/05/2022.
//

import DIContainer
import SwiftUI
import Combine

public struct DashboardView: View {
    public var viewModel: ViewModel
    public var output: Output

    // input
    private let gameListTapped = PassthroughSubject<Void, Never>()

    // connection
    @State var releaseDate: Date = Date()

    // Based on: https://stackoverflow.com/a/60411806
    // How to resign of viewmodel injection here?
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel

        let input = Input(gameListTapped: gameListTapped.eraseToAnyPublisher())
        output = viewModel.bind(input: input)
    }

    public var body: some View {
        VStack {
            VStack {
                Text("🎮")
                Text("Dashboard v 1.0. Relase date: \(releaseDate.formatted(date: .omitted, time: .standard))")
            }

            Button(action: {
                print("GameList tapped!")
                gameListTapped.send()
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
        .onReceive(output.releaseDate, perform: { releaseDate in
            self.releaseDate = releaseDate
        })
    }
}
