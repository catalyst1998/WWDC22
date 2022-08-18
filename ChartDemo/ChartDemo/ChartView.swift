//
//  SwiftUIView.swift
//  ChartDemo
//
//  Created by caisiyi on 2022/8/16.
//

import SwiftUI
import Charts

struct ChartView: View {
    var data: [ToyShape] = [
        .init(type: "Cube", count: 3),
        .init(type: "Sphere", count: 2),
        .init(type: "Pyramid", count: 4)
    ]
    
    var body: some View {
//        Chart{
//            BarMark(
//                    x: .value("Shape Type", data[0].type),
//                    y: .value("Total Count", data[0].count)
//                )
//                BarMark(
//                     x: .value("Shape Type", data[1].type),
//                     y: .value("Total Count", data[1].count)
//                )
//                BarMark(
//                     x: .value("Shape Type", data[2].type),
//                     y: .value("Total Count", data[2].count)
//                )
//        }
        
        Chart(data,id: \.id){ item in
            BarMark(x: .value("name", item.type), y: .value("num", item.count))
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
    
}

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}
