//
//  AccountView.swift
//  swiftUIDemo
//
//  Created by qiuqian on 2022/1/27.
//

import SwiftUI

struct AccountView: View {
    @State var isModalView = false
    var body: some View {
        NavigationView {
            List{
                VStack(spacing: 8) {
                    Image("avatar")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(50.0)
                    Text("qiuqianaw")
                        .font(.title.weight(.semibold))
                    Text("19001xxxxxx")
                        .font(.system(size: 17.0))
                    Text("计算机与软件学院")
                        .foregroundColor(.secondary)
                        .font(.system(size: 13.0))
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Section {
                    NavigationLink(destination: QRCodeView()) {
                        Label("我的二维码", systemImage: "qrcode").accentColor(.red)
                    }
                    NavigationLink { Text("预约单") } label: {
                        Label("预约单", systemImage: "note.text").accentColor(.orange)
                    }
                    NavigationLink { Text("学习记录") } label: {
                        Label("学习记录", systemImage: "checkmark.rectangle").accentColor(.red)
                    }
                    NavigationLink { Text("报修单") } label: {
                        Label("报修单", systemImage: "list.bullet").accentColor(.green)
                    }
                    NavigationLink { Text("安全证书") } label: {
                        Label("安全证书", systemImage: "flame").accentColor(.blue)
                    }
                    NavigationLink { Text("消息中心") } label: {
                        Label("消息中心", systemImage: "message").accentColor(.orange)
                    }
                    Label("退出登录", systemImage: "pip.exit").accentColor(.orange)
                        .onTapGesture {
                            self.isModalView.toggle()
                        }
                        .sheet(isPresented: $isModalView) {
                            Text("退出登陆成功")
                            Button("好的") {
                                self.isModalView.toggle()
                            }
                            .padding()
                        }
                            
                }
                    .accentColor(.primary)
                    .listRowSeparatorTint(.blue)
                    .listRowSeparator(.hidden)
                    .accentColor(.primary)
                Section {
                    Link(destination: URL(string: "https://qiuqian.xyz")!){
                        HStack{
                            Label("个人主页", systemImage: "house").accentColor(.primary)
                            Spacer()
                            Image(systemName: "link")
                                .accentColor(.secondary)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("我的")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

