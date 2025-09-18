//
//  BreakdownView.swift
//  observe Watch App
//
//  Created by João Araújo on 18/09/25.
//

import SwiftUI

struct BreakdownView: View {
    let totalDuration: Int
    
    private var breathDuration: Int {
        let breath = Int(Double(totalDuration) * 0.3)
        return breath
    }
    
    private var bodyDuration: Int {
        let body = Int(Double(totalDuration) * 0.6)
        return body
    }
    
    private var gratefulnessDuration: Int {
        // Calculate to ensure total equals selected duration
        return totalDuration - breathDuration - bodyDuration
    }
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Breakdown items
            VStack(spacing: 4) {
                BreakdownItem(
                    title: "Breath",
                    duration: breathDuration,
                    color: .breathe
                )
                
                BreakdownItem(
                    title: "Body",
                    duration: bodyDuration,
                    color: .body
                )
                
                BreakdownItem(
                    title: "Gratefulness",
                    duration: gratefulnessDuration,
                    color: .gratefulness
                )
            }
            .padding(.horizontal, 16)
            
            // Instruction text
            Text("Your watch will vibrate when you need to switch techniques.")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.body.opacity(0.7))
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 16)
                // .padding(.top, 8)
            
            Spacer()
            
            // Play button
            Button(action: {
                // TODO: Start meditation session
            }) {
                Image(systemName: "play.fill")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .navigationTitle("Breakdown")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.bgButtons)
    }
}

struct BreakdownItem: View {
    let title: String
    let duration: Int
    let color: Color
    
    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 10.5, height: 10.5)
            
            Text(title)
                .font(.system(size: 14, weight: .regular))
                .lineSpacing(2.5) // 14pt font + 2.5pt spacing = 16.5pt line height
                .foregroundColor(.body)
            
            Spacer()
            
            Text("\(duration)m")
                .font(.system(size: 14, weight: .regular))
                .lineSpacing(2.5)
                .foregroundColor(.body.opacity(0.7))
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    BreakdownView(totalDuration: 10)
}
