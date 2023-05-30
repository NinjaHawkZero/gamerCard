
import SwiftUI
struct GamerCard: View {
    var player: Player
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("ninja")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 250, height: 100)
                .padding()
            
            Section(header: Text("Player Information")
                        .font(.title)
                        .foregroundColor(.purple)
                        .bold()) {
                VStack(spacing: 10) {
                    
                    
                    
                    HStack{
                        Image(systemName: "person.fill")
                        Text("Name: \(player.name)")
                        
                    }
                    
                  
                    Text("Preferred Platforms: \(player.preferredPlatforms.joined(separator: ", "))")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
            
            Section(header: Text("Statistics")
                .font(.title)
                        .foregroundColor(.purple)
                        .bold()) {
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "hourglass.bottomhalf.filled")
                        Text("Cumulative Time Played: \(formattedTime(player.cumulativeTimePlayed))")
                    }
                    
                    HStack {
                        Image(systemName: "gamecontroller.fill")
                        Text("Number of Games Played: \(player.numberOfGamesPlayed)")
                    }
                    
                    HStack {
                        Image(systemName: "hourglass.tophalf.filled")
                        Text("Average Time Spent Playing: \(formattedTime(player.averageTimeSpentPlaying))")
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
            
            Section(header: Text("Games Organized by Genre")
                        .font(.title)
                        .foregroundColor(.purple)
                        .bold()) {
                ForEach(player.gamesOrganizedByGenre.sorted(by: { $0.key < $1.key }), id: \.key) { genre, games in
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(genre):")
                            .font(.headline)
                        
                        ForEach(games, id: \.self) { game in
                            Text("- \(game.title)")
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
            }
        }
        .padding()
        .background(
            Image("image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
    
    func formattedTime(_ timeInterval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        
        return formatter.string(from: timeInterval) ?? ""
    }
}










struct GamerCard_Previews: PreviewProvider {
    static var previews: some View {
        let player = Player(name: "Ninja", preferredPlatforms: ["PC", "PlayStation"], games: [
            Game(title: "Game 1", genre: "Action", playTime: 1200),
            Game(title: "Game 2", genre: "RPG", playTime: 800),
            Game(title: "Game 3", genre: "Sports", playTime: 500),
            Game(title: "Game 4", genre: "Action", playTime: 1500),
            Game(title: "Game 5", genre: "RPG", playTime: 600),
        ])

        return GamerCard(player: player)
    }
}




