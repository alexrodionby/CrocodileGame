import SwiftUI

struct GameView: View {
    let team: Team
    let correct: Bool
    var body: some View {
        VStack(spacing: 50.0) {
            HStack {
                Image(team.image)
                Text(team.name)
                    .font(.title)
                Spacer()
                Text("\(team.score)")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            VStack {
                Text(correct ? "Поздравляем" : "УВЫ И АХ!")
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 301)
            .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(correct ? Color("greenButton") : Color("redButton"))
            )
            Spacer()
            Button(action: {}) {
                Text("Передать ход")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color("greenButton")))
            }
        }
        .font(.largeTitle)
        .padding(40)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Image("background"))
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(team: Team(name: "Ковбои", image: "cowboy"), correct: false)
    }
}
