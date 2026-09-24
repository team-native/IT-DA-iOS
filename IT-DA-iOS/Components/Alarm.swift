//
//  Alarm.swift
//  IT-DA-iOS
//
//  Created by 안율 on 9/22/26.
//

import SwiftUI

struct ITDAAlarm: View{
    let subtitle : String
    let time : String
    
    
    var body : some View {
        VStack(spacing:0){
            Text(subtitle)
                .font(.custom("Pretendard-Regular", size: 16))
                .backgroundStyle(Color("dim"))
            
            
        }
        .frame(width: 393,height: 852)
        .background(.white)
    }
}
struct ITDAAlarm_Previews : PreviewProvider{
    static var previews: some View{
        
    }
}
