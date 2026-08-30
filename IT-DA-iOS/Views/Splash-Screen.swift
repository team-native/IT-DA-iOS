//
//  Splash-Screen.swift
//  IT-DA-iOS
//
//  Created by 안율 on 8/30/26.
//

import SwiftUI
struct SplashScreen: View{
    var body: some View{
        VStack{
            ITDAstartdiscription()
                .padding(.top, 188.5)
        }
        Spacer().frame(height: 479.5)
    }
}

#Preview{
    SplashScreen()
}
