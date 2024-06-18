//
//  ContentView.swift
//  NC2-0 Watch App
//
//  Created by 이진 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var motionManager = MotionManager()
    @State private var isRunning = true
    
    @Binding var leftEyeValue: Double
    @Binding var rightEyeValue: Double
    
    var body: some View {
        
        let formattedGoalPace = Double("\(Int(leftEyeValue)).\(Int(rightEyeValue))")
        
        let tempStringPace = String(format: "%.2f", motionManager.runningPace)
        let tempStringMinutePace = tempStringPace.split(separator: ".")[0]
        let tempStringSecondPace = tempStringPace.split(separator: ".")[1]
        
        ZStack {
            VStack(alignment: .leading) {
                Text("Running Pace")
                    .font(.headline)
                HStack(alignment: .bottom, spacing: 0) {
                    Text("\(tempStringMinutePace)'\(tempStringSecondPace)\"")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("/km")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Distance")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("\(String(format: "0%.2f", motionManager.distanceTraveled))")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                            Text(" km")
                                .font(.system(size: 13))
                                .fontWeight(.semibold)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("\(String(format: "0%.2f", motionManager.distanceTraveled))")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                            Text(" min")
                                .font(.system(size: 13))
                                .fontWeight(.semibold)
                        }
                    }
                    Spacer()
                }
                Button(action: {
                    motionManager.stopRunning()
                }) {
                    Text("Stop")
//                        .padding()
//                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom)
                }
                .offset(y: 10)
                .buttonStyle(BorderedButtonStyle(tint: .blue))
            }
            .padding()
        }
        .background(motionManager.runningPace >= formattedGoalPace! - 0.2 && motionManager.runningPace <= formattedGoalPace! + 0.2 ? Color(.green) : Color(.red))
        .onAppear{
            motionManager.startRunning()
            makeHaptics(with: .success)
        }
        .onChange(of: motionManager.runningPace) { oldValue, newValue in
            
        }
    }
    
    func makeHaptics(with haptic: WKHapticType) {
        WKInterfaceDevice.current().play(haptic)
    }
}

#Preview {
    ContentView(leftEyeValue: .constant(0.0), rightEyeValue: .constant(0.0))
}
