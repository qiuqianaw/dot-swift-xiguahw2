//
//  TabBar.swift
//  swiftUIDemo
//
//  Created by qiuqian on 2022/1/27.
//

import SwiftUI

struct TabBar: View {
    
    @State var current = "首页"
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            TabView(selection: $current) {
                HomeView()
                    .tag("首页")
                QRCodeView()
                    .tag("门禁码")
                AccountView()
                    .tag("我的")
            }
        
            HStack(spacing: 0) {
                TabButton(title: "首页", image: "house", selected: $current)
                Spacer()
                TabButton(title: "门禁码", image: "qrcode", selected: $current)
                Spacer()
                TabButton(title: "我的", image: "person", selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(.black)
            .clipShape(Capsule())
            .padding(.horizontal, 25)
        })
    }
}
