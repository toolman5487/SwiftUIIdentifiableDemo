//
//  ContentView.swift
//  HelloSwiftUIIdentifiable
//
//  Created by Willy Hsu on 2024/12/17.
//

import SwiftUI

struct Continent: Identifiable{
    var name: String
    var lang: [String]
    var id: String {
        name
    }
}

struct ContentView: View {
    @State private var selectedItem = "亞洲"
    let languagesByContinent = [
        "美洲": ["英文", "西班牙文", "葡萄牙文", "法語", "荷蘭語"],
        "亞洲": ["中文", "日文", "韓文", "阿拉伯文", "印地語"],
        "歐洲": ["英語", "法語", "德語", "西班牙語", "義大利語"],
        "非洲": ["阿拉伯語", "斯瓦希里語", "豪薩語", "阿馬哈語", "祖魯語"],
        "大洋洲": ["英語", "毛利語", "斐濟語", "薩摩亞語", "托雷斯海峽語"]
    ]
    var body: some View {
        let continents = languagesByContinent.map {Continent(name: $0, lang: $1)}
            .sorted { item1, item2 in
                item1.name < item2.name
            }
        VStack {
            HStack{
                ForEach(continents){ item in
                    Button {
                        print(item.name)
                        selectedItem = item.name
                    } label: {
                        Text(item.name)
                    }
                    .foregroundColor(.black)
                    .padding([.top,.bottom ],5)
                    .padding([.leading, .trailing],10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: selectedItem == item.name ? 3:1)
                    }
                    .padding(5)
                    .animation(.easeInOut, value: selectedItem)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
