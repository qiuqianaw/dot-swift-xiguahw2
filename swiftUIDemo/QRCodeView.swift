//
//  QRCodeView.swift
//  swiftUIDemo
//
//  Created by qiuqian on 2022/1/27.
//

import SwiftUI

struct QRCodeView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("code")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                }
                VStack(alignment: .leading, spacing: 1.0) {
                    Text("二维码用途")
                    Text("（1）扫码开门\n（2）扫码进行开放预约签到\n").font(.system(size: 13))
                    Text("使用注意事项")
                    Text("（1）授权时间包括课前休息时间，不含课后休息时间\n（2）当门口环境光线较暗且手机屏幕亮度自动调整时，请手动调高手机屏幕亮度\n（3）当二维码读头仅亮1个指示灯时，表示设备离线，请联系实验室负责人").font(.system(size: 13))
                }
                
                    .padding(30)
            }
            .padding()
            .navigationTitle("门禁码")
        }
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}
