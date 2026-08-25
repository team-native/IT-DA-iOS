
import SwiftUI

struct ITDAloginmain: View {
    @State private var username = ""
    @State private var password = ""
    let NextButton = "로그인"
    let question = "IT-DA가 처음이신가요?"
    let ITDAjointhemembership = "회원가입하기"
    let buttomText = "소셜 로그인으로 간편하게 가입하고 시작하세요"
    var isDisabled = true
    var body: some View {
        VStack(spacing: 0) {
            Image("IT-DA logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 41.5)
                .padding(.horizontal,125)
            
            ITDAstartdiscription()
                .padding(.top, 42.5)
            
        }
        TextField("아이디", text: $username)
            .frame(maxWidth:.infinity,alignment:.leading)
            .padding(.top, 43.5)
            .padding(.leading, 57)
            .foregroundStyle(Color("place"))
            .font(.custom("Pretendard-Light", size: 14))
        
        Image("Line 2")
            .resizable()
            .frame(width: 295 , height: 1)
            .padding(.top, 3.5)
        
        TextField("비밀번호", text: $password )
            .frame(maxWidth:.infinity,alignment:.leading)
            .padding(.top, 19.5)
            .padding(.leading, 57)
            .foregroundStyle(Color("place"))
            .font(.custom("Pretendard-Light", size: 14))
        
        Image("Line 2")
            .resizable()
            .frame(width: 295, height: 1)
            .padding(.top, 3.5)
        
        HStack{
            Button{
                print("로그인버튼클릭")
            } label: {
                Text(NextButton)
                    .font(.custom("Pretendard-Bold", size:15))
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity)
                    .frame(height: 45)
                    .frame(width: 322)
                    .background(isDisabled ? Color("dim"): Color("main"))
                    .clipShape(RoundedRectangle(cornerRadius: 10000))
            }
            .padding(.top, 27.5)
        }
        HStack{
            Text(question)
                .font(.custom("Pretendard-Regular",size : 13))
                .foregroundStyle(Color("place"))
                .padding(.leading, 101)
                .padding(.top, 15)
            Text(ITDAjointhemembership).underline()
                .font(.custom("Pretendard-Medium",size : 13,))
                .foregroundStyle(Color("border"))
                .padding(.trailing, 101)
                .padding(.top, 15)
        }
        HStack{
            Image("apple")
                .frame(maxWidth:.infinity,alignment:.leading)
                .padding(.leading, 121.5)
            Image("google")
                .padding(.horizontal,7.5)
            Image("kakao")
                .frame(maxWidth: .infinity,alignment:.trailing)
                .padding(.trailing,121.5)
        }
        .padding(.top, 81.5)

        
        
        Text(buttomText)
            .font(.custom("Pretendard-Regular", size: 13))
            .multilineTextAlignment(.center)
            .foregroundStyle(.gray)
            .padding(.top, 26.5)
            .padding(.bottom, 46.5)
            .padding(.horizontal, 79.5)
       
        Spacer()
        
    }
}

#Preview {
    ITDAloginmain()
}
