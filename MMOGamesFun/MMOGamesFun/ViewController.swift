//
//  ViewController.swift
//  MMOGamesFun
//
//  Created by Sebastian Wojtyna on 03/05/2022.
//

import MMOGamesAPI
import UIKit

class ViewController: UIViewController {
    let test = MMOGamesAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red

        Task {
            let result = try await test.fetchGames()
            print("result \(result)")
        }
    }
}
