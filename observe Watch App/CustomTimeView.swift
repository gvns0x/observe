//
//  CustomTimeView.swift
//  observe Watch App
//
//  Created by João Araújo on 18/09/25.
//

import SwiftUI

struct CustomTimeView: View {
    @State private var customDuration: Double = 0
    @State private var navigateToBreakdown = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                
                Spacer()
            
            // Duration display
            HStack(alignment: .bottom, spacing: 4) {
                Text(String(format: "%02.0f", customDuration))
                    .font(.system(size: 48, weight: .thin))
                    .foregroundColor(.body)
                
                Text("m")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.body)
                    .padding(.bottom, 8)
            }
            .focusable()
            .digitalCrownRotation(
                $customDuration,
                from: 0.0,
                through: 60.0,
                by: 1.0,
                sensitivity: .medium,
                isContinuous: false,
                isHapticFeedbackEnabled: true
            )
            
            Spacer()
            
            // Next button
            Button(action: {
                if customDuration > 0 {
                    navigateToBreakdown = true
                }
            }) {
                Text("Next")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.body)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            .background(Color.bgButtons)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .buttonStyle(.plain)
            .disabled(customDuration == 0.0)
            .opacity(customDuration == 0.0 ? 0.5 : 1.0)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            }
            .padding(.top, 8)
        }
        .navigationTitle("Duration")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.bgButtons)
        .ignoresSafeArea(.container, edges: .bottom)
        .navigationDestination(isPresented: $navigateToBreakdown) {
            BreakdownView(totalDuration: Int(customDuration))
        }
    }
}

#Preview {
    CustomTimeView()
}
