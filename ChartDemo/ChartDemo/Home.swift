//
//  home.swift
//  ChartDemo
//
//  Created by caisiyi on 2022/8/18.
//

import SwiftUI
import Charts

struct Home: View {
    
    @State var sampleAnalytics: [SiteView] = analytics
    
    @State var currentTab: String = "7 days"
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading, spacing: 12){
                HStack{
                    Text("Views")
                        .fontWeight(.semibold)
                    Picker("1", selection: $currentTab){
                        Text("7 days")
                            .tag("7 days")
                        Text("Week")
                            .tag("Week")
                        Text("Month")
                            .tag("Month")
                    }
                    .pickerStyle(.segmented)
                    .padding(7)
                }
                let totalValues = sampleAnalytics.reduce(0.0) { temp, item in
                    item.views + temp
                    
                }
                Text(totalValues.stringFormat)
                    .fontWeight(.bold)
                    .font(.title)
                AnimatedChart()
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            .padding()
            .navigationTitle("Swifty Charts")
        }
    }
    
    @ViewBuilder
    func AnimatedChart()-> some View {
        //MARK: 获取y轴--views的最大值
        let max = sampleAnalytics.max{ item1, item2 in
            return item2.views > item1.views
        }?.views ?? 0
        
        Chart{
            ForEach(sampleAnalytics) { item in
                LineMark(
                    x: .value("Hour", item.hour, unit: .hour),
                    y: .value("Views", item.views)
                )
            }
        }
        //MARK: 修改y轴的scale
        .chartYScale(domain: 1000...(max+1000))
        .frame(height: 300)
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension Double{
    var stringFormat: String {
        if self >= 1000 && self < 999999 {
            return String(format: "%.1fK",self/1000).replacingOccurrences(of: ".0", with: "")
        }
        
        if self > 999999 {
            return String(format: "%.1fM",self/1000000).replacingOccurrences(of: ".0", with: "")
        }
        
        return String(format: "%.0f",self)
    }
}
