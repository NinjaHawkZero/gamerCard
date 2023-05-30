

import SwiftUI

@main
struct gamerCardApp: App {
    let player = Player(name: "Max", preferredPlatforms: ["PC", "PlayStation"], games: [
        Game(title: "Game 1", genre: "Action", playTime: 1200),
        Game(title: "Game 2", genre: "RPG", playTime: 800),
        Game(title: "Game 3", genre: "Sports", playTime: 500),
        Game(title: "Game 4", genre: "Action", playTime: 1500),
        Game(title: "Game 5", genre: "RPG", playTime: 600),
    ])
    
    var body: some Scene {
        WindowGroup {
            GamerCard(player: player)
        }
    }
}
