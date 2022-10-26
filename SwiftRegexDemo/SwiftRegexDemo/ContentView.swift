//
//  ContentView.swift
//  SwiftRegexDemo
//
//  Created by bytedance on 2022/8/23.
//

import SwiftUI
import RegexBuilder

struct ContentView: View {
    let transaction = "DEBIT     08/09/2022      Doug's Dogs        $22.32\n "
    
    let fieldSeparator = /\s{2,}|\t/
    
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
            Text(transaction)
            Text(regex())
            Button("regexBuild", action: regexBuilder)
        }
        .padding()
    }
    
    func regex() -> String {
        
        
        return  transaction.replacing(fieldSeparator, with: "\t")
        
    }
    
    func regexBuilder()  {
        
        let fragment = Regex {
            Capture { /CREDIT|DEBIT/ }
            
            fieldSeparator
            
            Capture {
                One(.date(.numeric,locale: Locale(identifier: "en_us"),timeZone: .gmt))
            }
            
            fieldSeparator
            
            Capture {
                OneOrMore {
                    NegativeLookahead { fieldSeparator }
                    CharacterClass.any
                }
            }
                
                fieldSeparator
                
            Capture {
                One(.localizedCurrency(code: "USD", locale: Locale(identifier: "en_us")))
                }
                
            }
        
//        print fragment
    }
       
    
        
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


