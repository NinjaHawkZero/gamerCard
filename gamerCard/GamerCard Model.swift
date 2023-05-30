

import Foundation


struct Player {
    var name: String
    var preferredPlatforms: [String]
    var games: [Game]
    
    //Write method to generate cumulative time played
    var cumulativeTimePlayed: TimeInterval {

    }

    //Write method to calculate total number of games played
    var numberOfGamesPlayed: Int {

    }


    //Write method that calculates average time spent play games
    var averageTimeSpentPlaying: TimeInterval {

    }

    //Write method that organizes games by genre (Hint:Not an array)
    var gamesOrganizedByGenre: [String: [Game]] {

    }
    
    
    
    
    
}

struct Game: Hashable {
    var title: String
    var genre: String
    var playTime: TimeInterval
}
