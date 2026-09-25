//
//  Alarm.swift
//  IT-DA-iOS
//
//  Created by 안율 on 9/22/26.
//

import SwiftUI

struct ITDAAlarm: View{
    let image : String
    let subtitle : String
    let time : String
    var body : some View {
        HStack(spacing: 0){
            Image(image)
                .padding(.trailing,15)
            
            VStack(alignment: .leading,spacing:0){
                Text(subtitle)
                    .font(.custom("Pretendard-Regular", size: 16))
                    .foregroundStyle(Color("place"))
                    
                Text(time)
                    .font(.custom("Pretendard-Regular", size: 13))
                    .foregroundStyle(Color("place"))
                    .padding(.top,8)
                }
            }
        .padding(.horizontal, 18)
            .padding(.vertical, 20)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color("card"), lineWidth: 1)
        }
    }
}
    
struct ITDAAlarm_Previews: PreviewProvider{
    static var previews: some View{
        VStack(spacing:6.5){
            ITDAAlarm(
                image : "post",
                subtitle: "지원한 프로젝트에서 새 메시지가 있습니다",
                time: "2분전"
            )
        }
    }
}
