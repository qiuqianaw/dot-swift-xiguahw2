//
//  swiftUIDemoApp.swift
//  swiftUIDemo
//
//  Created by qiuqian on 2022/1/27.
//

import SwiftUI

@main
struct swiftUIDemoApp: App {
    // 隐藏原有的tabbar，使用重写的tabbar作为入口
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
    }
}
