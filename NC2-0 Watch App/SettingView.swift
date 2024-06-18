//
//  SettingView.swift
//  NC2-0 Watch App
//
//  Created by 이진 on 6/17/24.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack {
            DigitalCrown()
        }
    }
}

struct DigitalCrown: View {

    @State var leftEyeValue = 0.0
    @State var rightEyeValue = 0.0
    
    // eyeState가 true일때 왼쪽 눈
    @State private var eyeState = true
    
    @State private var leftEyeImage = "교동눈선택"
    @State private var rightEyeImage = "교동눈"
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    let width = geometry.size.width
                    Image("배경")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack(spacing:0) {
                        Image(.교동얼굴굴)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width)
                            .offset(y: width/16)
                        NavigationLink {
                            ContentView(leftEyeValue: $leftEyeValue, rightEyeValue: $rightEyeValue)
                        } label: {
                            Image("교동입")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: width*0.75)
                                .offset(y: -width/18)
                        }
                    }
                    .offset(y: -width/9)
                    Image(leftEyeImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width/3.3)
                        .rotationEffect(.degrees(leftEyeValue*30), anchor: .center)
                        .onTapGesture {
                            eyeState = true
                            leftEyeImage = "교동눈선택"
                            rightEyeImage = "교동눈"
                        }
                        .offset(x: -width/6, y:-width/25)
                    Image(rightEyeImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width/3.3)
                        .rotationEffect(.degrees(rightEyeValue*6), anchor: .center)
                        .onTapGesture {
                            eyeState = false
                            leftEyeImage = "교동눈"
                            rightEyeImage = "교동눈선택"
                        }
                        .offset(x: width/6, y:-width/25)
                    HStack(alignment: .bottom, spacing: 0) { // 반올림
                        Text("\(Int(leftEyeValue+0.5))'\(Int(rightEyeValue))\"")
                            .foregroundStyle(Color("교동Blue"))
                            .font(.system(size: 30, weight: .semibold))
                        Text("/km")
                            .foregroundStyle(Color("교동Blue"))
                            .font(.system(size: 23, weight: .semibold))
                    }
                    .offset(y: -width/1.41)
                    if eyeState {
                        Text("Received Value:\(Int(leftEyeValue+0.5))")
                            .foregroundStyle(.clear)
                            .focusable()
                            .digitalCrownRotation($leftEyeValue, from: 0, through: 11, by: 1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
                    } else {
                        Text("Received Value:\(Int(rightEyeValue), specifier: "%d")")
                            .foregroundStyle(.clear)
                            .focusable()
                            .digitalCrownRotation($rightEyeValue, from: 0, through: 60, by: 1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
                        
                    }
                }
                .onAppear {
                    leftEyeValue = 0.0
                    rightEyeValue = 0.0
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
