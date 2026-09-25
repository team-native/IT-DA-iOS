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
                .padding(.leading,19.5)
            
            VStack(alignment: .leading,spacing:0){
                Text(subtitle)
                    .font(.custom("Pretendard-Regular", size: 13))
                    .foregroundStyle(Color("place"))
                    
                Text(time)
                    .font(.custom("Pretendard-Regular", size: 13))
                    .foregroundStyle(Color("place"))
                    .padding(.top,8)
                }
            
            Spacer()
            
            }
            .frame(width: 342,height:80,alignment: .leading)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color("card"), lineWidth: 1)
        }
    }
}
    
struct ITDAAlarm_Previews: PreviewProvider{
    static var previews: some View{
        VStack(spacing:0){
            ITDAAlarm(
                image : "post",
                subtitle: "지원한 프로젝트에서 새 메시지가 있습니다",
                time: "2분전"
            )
        }
    }
}
