

import SwiftUI


struct SplashView: View {
    
    // 1.
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            // 2.
            if self.isActive {
                // 3.
                Home()
            } else {
                // 4.
                Text("Sporty")
                    .font(Font.largeTitle)
                    .bold()
                Text("Enjoy your experience")
                    
            }
        }
        // 5.
        .onAppear {
            // 6.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                // 7.
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {

SplashView()

    }
}
