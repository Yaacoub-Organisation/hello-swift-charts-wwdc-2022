import Charts
import PlaygroundSupport
import SwiftUI



// MARK: - Structs

struct Team: Identifiable {
    
    let name: String
    let points: Int
    
    var id: String { name }
    
}



// MARK: - View

struct ChartView: View {

    private var data = [
        Team(name: "Manchester City", points: 93),
        Team(name: "Liverpool", points: 92),
        Team(name: "Chelsea", points: 74),
        Team(name: "Tottenham", points: 71),
        Team(name: "Arsenal", points: 69),
        Team(name: "Manchester United", points: 58),
        Team(name: "West Ham", points: 56),
        Team(name: "Leicester City", points: 52),
        Team(name: "Brighton", points: 51),
        Team(name: "Wolves", points: 51)
    ]
    
    var body: some View {
        Chart(data) { element in
            BarMark(
                x: .value("Name", element.name),
                y: .value("Points", element.points)
            )
        }
    }
    
}



//MARK: - Live View

PlaygroundPage.current.setLiveView(ChartView().frame(width: 500, height: 500))
