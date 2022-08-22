import Charts
import PlaygroundSupport
import SwiftUI



// MARK: - Structs

struct Team: Identifiable, Hashable {
    
    let name: String
    let points: Int
    let year: Int
    
    var id: String { name }
    
}



// MARK: - View

struct ChartView: View {

    private let serie1 = [
        Team(name: "Manchester City", points: 100, year: 2018),
        Team(name: "Manchester City", points: 98, year: 2019),
        Team(name: "Manchester City", points: 81, year: 2020),
        Team(name: "Manchester City", points: 86, year: 2021),
        Team(name: "Manchester City", points: 93, year: 2022)
    ]
    private let serie2 = [
        Team(name: "Liverpool", points: 75, year: 2018),
        Team(name: "Liverpool", points: 97, year: 2019),
        Team(name: "Liverpool", points: 99, year: 2020),
        Team(name: "Liverpool", points: 69, year: 2021),
        Team(name: "Liverpool", points: 92, year: 2022)
    ]
    
    var body: some View {
        Chart([serie1, serie2], id: \.self) { series in
            ForEach(series) { element in
                LineMark(
                    x: .value("Year", element.year),
                    y: .value("Points", element.points)
                )
                .foregroundStyle(by: .value("Name", element.name))
            }
        }
        .chartLegend(.visible)
        .chartXScale(domain: 2018...2022)
        .chartYScale(domain: 0...100)
    }
    
}



//MARK: - Live View

PlaygroundPage.current.setLiveView(ChartView().frame(width: 500, height: 500))
