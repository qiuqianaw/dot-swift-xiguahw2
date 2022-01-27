//
//  ContentView.swift
//  swiftUIDemo
//
//  Created by qiuqian on 2022/1/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 8.0){
                Spacer()
                Image("avatar")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(100)
                    .padding(10)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 100, style: .continuous))
                Text("Hola, SwiftUI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("author: qiuqianaw".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Text("Visit my blog on website: https://qiuqian.xyz , visit my GitHub on https://github.com/qiuqianaw")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.all, 20.0)
            .padding(.horizontal, 20)
            .frame(height: 350.0)
    //        .background(.blue.opacity(0.2))
            .background(.ultraThinMaterial)
            .cornerRadius(30.0)
            .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 10)
            //.background(Image("avatar"))
            .navigationTitle("首页")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13")
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13")
        }
    }
}
