//
//  HomeView.swift
//  swiftUIDemo
//
//  Created by qiuqian on 2022/1/27.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List{
                Text("常用功能").foregroundColor(.blue)
                VStack(spacing: 80) {
                    HStack(spacing: 75.0) {
                        Button("") {
                        }
                        .background(Image(systemName: "heart"))
                        .font(.system(size: 50))
                        Button("") {
                        }
                        .background(Image(systemName: "heart"))
                        .font(.system(size: 50))
                        Button("") {
                        }
                        .background(Image(systemName: "heart"))
                        .font(.system(size: 50))
                        Button("") {
                        }
                        .background(Image(systemName: "heart"))
                        .font(.system(size: 50))
                        
                    }
                    
                    HStack(spacing: 75.0) {
                        Button("") {
                        }
                        .background(Image(systemName: "heart"))
                        .font(.system(size: 50))
                        Button("") {
                        }
                        .background(Image(systemName: "heart"))
                        .font(.system(size: 50))
                        Button("") {
                        }
                        .background(Image(systemName: "heart"))
                        .font(.system(size: 50))
                        Button("") {
                        }
                        .background(Image(systemName: "heart"))
                        .font(.system(size: 50))
                        
                    }
                }
                .padding(.vertical, 30.0)
                .frame(maxWidth: .infinity)
                .listRowSeparator(.hidden)
                
                Section {
                    Image("pic")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Section {
                    Text("通知公告").foregroundColor(.blue)
                    Section{
                        NavigationLink { Text("通知公告") } label: {
                            Text("万维考试系统平台升级")
                        }
                        NavigationLink { Text("通知公告") } label: {
                            Text("关于参加教育部2021年高校实验...")
                        }
                        NavigationLink { Text("通知公告") } label: {
                            Text("关于启用新实验室门禁系统的通知")
                        }
                    }
                    .font(.system(size: 16))
                    .padding(.leading, 30.0)
                    Text("查看更多").foregroundColor(.secondary).font(.system(size: 14))
                }
                    .accentColor(.primary)
                    .listRowSeparatorTint(.blue)
                    .listRowSeparator(.hidden)
                    .accentColor(.primary)
                    
            }
            
            .listStyle(.insetGrouped)
            .navigationTitle("实验中心")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
