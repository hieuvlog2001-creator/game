import SwiftUI

@main
struct BusTrafficFeverApp: App {
    var body: some Scene { WindowGroup { RootView() } }
}

struct RootView: View {
    @State private var screen = 0
    @State private var showWelcome = false
    var body: some View {
        ZStack {
            if screen == 0 {
                FullImage("splash")
                    .ignoresSafeArea()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) { withAnimation { screen = 1 } }
                    }
            } else if screen == 1 {
                FullImage("welcome")
                    .ignoresSafeArea()
                    .onTapGesture { withAnimation { screen = 2 } }
                    .overlay(alignment: .top) {
                        Button { withAnimation { screen = 2 } } label: {
                            Text("PLAY")
                                .font(.system(size: 22, weight: .heavy, design: .rounded))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 42).padding(.vertical, 13)
                                .background(.blue.opacity(0.85), in: Capsule())
                                .overlay(Capsule().stroke(.white.opacity(0.55), lineWidth: 2))
                        }
                        .padding(.top, 120)
                    }
            } else {
                FullImage("game")
                    .ignoresSafeArea()
                    .overlay(alignment: .topLeading) {
                        Button { withAnimation { screen = 1 } } label: {
                            Image(systemName: "arrow.left")
                                .font(.title2.bold()).foregroundStyle(.white)
                                .padding(12).background(.black.opacity(0.35), in: Circle())
                        }.padding(.top, 12).padding(.leading, 12)
                    }
            }
        }
        .statusBarHidden(true)
    }
}

struct FullImage: View {
    let name: String
    init(_ name: String) { self.name = name }
    var body: some View {
        GeometryReader { geo in
            Image(name)
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
        }
    }
}
