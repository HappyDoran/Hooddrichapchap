//
//  TestView.swift
//  Hooddrichapchap
//
//  Created by Doran on 3/24/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("세종이")
                        .font(.system(size: 40, weight: .bold))
                    Text("지곡회관 마스코트")
                        .font(.system(size: 20, weight: .regular))
                }
                Spacer()
                Image(systemName: "bookmark")
                    .offset(CGSize(width: 0, height: -10))
            }
            ZStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: .infinity,height: 300)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: .infinity,height: 120)
                    .offset(CGSize(width: 0, height: 90))
                    .foregroundColor(.secondary)
                HStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width: 80,height: 80)
//                        .offset(CGSize(width: -90, height: 90))
                        .foregroundColor(.secondary)
                    VStack{
                        Text("당신과의 친밀도")
                            .font(.system(size: 20, weight: .bold))
                        HStack{
                            ForEach(0..<5) { index in
                                // cnt를 2로 나눈 나머지로 하트의 상태 결정
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }.offset(CGSize(width: -30, height: 90))
            }
            .padding(.bottom, 20)
            
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("친해지기")
                            .font(.system(size: 25, weight: .bold))
                        Text("다양한 행동으로 동물들과 가까워져 봐욤")
                            .font(.system(size: 14, weight: .regular))
                    }
                    Spacer()
                }
            }
            HStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 110,height: 110)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 110,height: 110)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 110,height: 110)
                    .foregroundColor(.gray)
            }
            
        }.padding(.horizontal, 30)
        
        
    }
}

#Preview {
    TestView()
}
