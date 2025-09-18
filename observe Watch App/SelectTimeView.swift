//
//  SelectTimeView.swift
//  observe Watch App
//
//  Created by João Araújo on 18/09/25.
//

import SwiftUI

struct SelectTimeView: View {
    @State private var selectedDuration: Int? = nil
    @State private var navigateToBreakdown = false
    @State private var navigateToCustom = false
    
    let predefinedDurations = [5, 10, 15, 20]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                // Top section with info button
                HStack {
                    Button(action: {}) {
                        Image(systemName: "info.circle")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.body)
                    }
                    .buttonStyle(.plain)
                    .frame(width: 32, height: 32)
                    .background(.white)
                    .clipShape(Circle())
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                Spacer()
                
                // Duration selection buttons
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 2), spacing: 8) {
                    ForEach(predefinedDurations, id: \.self) { duration in
                        Button(action: {
                            selectedDuration = duration
                            navigateToBreakdown = true
                        }) {
                            Text("\(duration)m")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.body)
                                .frame(maxWidth: .infinity)
                                .frame(height: 44)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                
                // Custom option
                Button(action: {
                    navigateToCustom = true
                }) {
                    Text("Custom")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.body)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                Spacer()
            }
            .background(Color.bgButtons)
            .navigationDestination(isPresented: $navigateToBreakdown) {
                if let duration = selectedDuration {
                    BreakdownView(totalDuration: duration)
                }
            }
            .navigationDestination(isPresented: $navigateToCustom) {
                CustomTimeView()
            }
        }
    }
}

#Preview {
    SelectTimeView()
}
