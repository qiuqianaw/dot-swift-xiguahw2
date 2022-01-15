import SwiftUI
extension Date {
    var timeStamp: Int {
        let timeInterval = self.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return timeStamp
    }
}
struct ContentView: View {
    @State var lights = [
        [Light(), Light(), Light()],
        [Light(), Light(), Light()],
        [Light(), Light(), Light()]
    ]
    @State var currentLevel = 1
    @State var touchCount = 0
    @State var useTime = Date().timeStamp
    @State var isShowAlert = false
    @State var colorRBG = Color.init(red: 0x37/255, green: 0xba/255, blue: 0x46/255)
    @State var lightsOn = 0
    @State var window = (70.0, 70.0)
    @State var currentTime = Date().timeStamp
    @State var timer = Timer.publish(every: 1, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()
    var body: some View {
        VStack {
            Label("关卡：第\(currentLevel-1)关", image: "")
            Label("点击了\(touchCount)次", image: "").font(.system(size: 15))
            Label("还剩余\(lightsOn)盏灯", image: "").font(.system(size: 15))
            ForEach(0..<lights.count, id: \.self) { row in
                HStack {
                    ForEach(0..<lights[row].count, id: \.self) { col in 
                        Circle()
                        .foregroundColor(lights[row][col].status ? colorRBG : .gray)
                            .frame(width: window.0, height: window.1, alignment: .center)
                            .onTapGesture {
                                onTap(row: row, col: col)
                            }
                    }
                }
            }
            Label("用时\(useTime)s", image: "").font(.system(size: 12)).foregroundColor(.gray).onReceive(timer) {time in
                useTime = Date().timeStamp - currentTime
            }
            Text("玩法说明：每点击一盏灯，这盏灯及其这盏灯上、下、左、右相邻的灯的状态都会变为点击前的相反状态，直到所有灯都变为熄灭的状态，即可通关").foregroundColor(.gray).font(.system(size: 13)).padding()
        }
        .onAppear {
            gotoNextLevel()
        }
        .alert(isPresented: $isShowAlert) {
            Alert(
                title: Text("🎉"),
                message: Text("恭喜你，通过了当前关卡，用时\(useTime)s，点击 ok 进入下一关吧～"),
                primaryButton: .cancel(Text("cancel")),
                secondaryButton: .default(Text("ok"), action: gotoNextLevel)
            )
        }
    }
    /**
     * 点击事件
     */
    func onTap(row: Int, col: Int) {
        changeStatus(row: row, col: col)
        touchCount += 1
        if ( finishCurrentLevel() ) {
            isShowAlert = true
            // 停止计时
            cancelTimer()
        }
        countLightsOn()
    }
    /**
     * 停止计时
     */
    func cancelTimer() {
        self.timer.upstream.connect().cancel()
        return
    }
    /**
     * 由于之前已经停止计时，所以重新声明一个timer
     */
    func instantiateTimer() {
        self.timer = Timer.publish(every: 1, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()
        return
    }
    /**
     * 进入下一个关卡
     */
    func gotoNextLevel() {
        instantiateTimer()
        useTime = 0
        currentTime = Date().timeStamp
        geneRandRGB()
        if currentLevel <= 2 {
            randomTap(currentLevel: currentLevel)
        } else if currentLevel > 2 && currentLevel <= 5 {
            window = (60, 60)
            lights = [
                [Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light()]
            ]
            randomTap(currentLevel: currentLevel)
        } else if currentLevel > 5 && currentLevel <= 9 {
            window = (50, 50)
            lights = [
                [Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light()]
            ]
            
            randomTap(currentLevel: currentLevel)
        } else {
            window = (40, 40)
            lights = [
                [Light(), Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light(), Light()],
                [Light(), Light(), Light(), Light(), Light(), Light()]
            ]
            randomTap(currentLevel: currentLevel)
        }
        currentLevel += 1
        touchCount = 0
        countLightsOn()
    }
    /**
     * 是否通过当前关卡
     */
    func finishCurrentLevel() -> Bool {
        for light in lights {
            for l in light {
                if ( l.status == true ) {
                    return false
                }
            }
        }
        return true
    }
    /**
     * 点击灯后更改状态
     */
    func changeStatus(row: Int, col: Int) {
        lights[row][col].status.toggle()
        if ( row - 1 >= 0 ) {
            lights[row-1][col].status.toggle()
        }
        if ( row + 1 < lights.count ) {
            lights[row+1][col].status.toggle()
        }
        if ( col - 1 >= 0 ) {
            lights[row][col-1].status.toggle()
        }
        if ( col + 1 < lights.count ) {
            lights[row][col+1].status.toggle()
        }
    }
    func randomTap(currentLevel: Int) {
        print("randomTap, level", currentLevel)
        var (row1, col1) = geneRandRowAndCol() 
        print((row1, col1))
        changeStatus(row: row1, col: col1)
        // 如果两次生成的 (row, col) 相同，相当于取消了点击，要确保每次生成的值不相同
        var temp = Int(currentLevel / 3)
        while temp > 0 {
            var (row2, col2) = geneRandRowAndCol()
            while ( (row1, col1) == (row2, col2) ) {
                (row2, col2) = geneRandRowAndCol()
            }
            print((row2, col2))
            changeStatus(row: row2, col: col2)
            (row1, col1) = (row2, col2)
            temp -= 1
        }
    }
    /**
     * 生成每个关卡初始随机点击的位置
     */
    func geneRandRowAndCol() -> (randomRow: Int, randomCol: Int) {
        let randomRow = Int.random(in: 0...lights.count-1)
        let randomCol = Int.random(in: 0...lights[randomRow].count-1)
        return (randomRow, randomCol)
    }
    /**
     * 生成随机的 RGB 值
     */
    func geneRandRGB() {
        colorRBG = Color.init(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
    /**
     * 统计剩余亮着的灯数量
     */
    func countLightsOn() {
        var ans = 0
        for light in lights {
            for l in light {
                if ( l.status == true ) {
                    ans += 1
                }
            }
        }
        lightsOn = ans
    }
}
struct Light {
    var status = false
}
