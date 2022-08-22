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
        NavigationStack {
            VStack {
                VStack(alignment:.leading, spacing: 12) {
                    ///顶部标题和tab键
                    HStack {
                        Text("Views")
                            .fontWeight(.semibold)
                        
                        Picker("1", selection: $currentTab) {
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
                    ///展示所有用量
                    Text(totalValues.stringFormat)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    ///展示图标
                    AnimatedChart()
                    
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white.shadow(.drop(radius: 2)))
                }
                
                
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
                BarMark(
                    x: .value("Hour", item.hour, unit: .hour),
                    y: .value("Views", item.animated ? item.views :0)
                )
            }
        }
        //MARK: 修改y轴的scale
        .chartYScale(domain: 0...(max+1000))
        .frame(height: 250)
        .onAppear{
            for(index,_) in sampleAnalytics.enumerated(){
                DispatchQueue.main.asyncAfter(deadline: .now(), execute: Double(index)*0.05){
                    withAnimation(.interactiveSpring(response: 0.8,) .delay(Double(index)*0.05)){
                        sampleAnalytics[index].animated = true
                    }
                }
                
            }
            
        }
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
