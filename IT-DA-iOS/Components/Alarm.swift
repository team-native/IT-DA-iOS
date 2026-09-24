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
                .foregroundStyle(Color("place"))
            Text(time)
                .font(.custom("Pretendard-Regular", size: 13))
                .foregroundStyle(Color("place"))
            
            
        }
        .frame(width: 393,height: 852)
        .background(.white)
    }
}

struct ITDAAlarm_Previews : PreviewProvider{
    static var previews: some View{
        VStack(spacing:8){
            ITDAAlarm(
                subtitle: "지원한 프로젝트에서 새 메시지가 있습니다",
                time: "2분전"
            )
                
            
                
        }
    }
}
