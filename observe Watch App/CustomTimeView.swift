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
        VStack(spacing: 16) {
            // Top section with back button and time
            HStack {
                Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.body)
                }
                .buttonStyle(.plain)
                .frame(width: 32, height: 32)
                .background(.white)
                .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text(timeString)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.body)
                    
                    Text("Duration")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.body)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            
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
        .background(Color.bgButtons)
        .navigationDestination(isPresented: $navigateToBreakdown) {
            BreakdownView(totalDuration: Int(customDuration))
        }
    }
    
    private var timeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: Date())
    }
}

#Preview {
    CustomTimeView()
}
