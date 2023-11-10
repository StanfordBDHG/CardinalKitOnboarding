//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import PDFKit
import SpeziOnboarding
import SpeziViews
import SwiftUI


struct OnboardingConsentMarkdownRenderingView: View {
    @Environment(OnboardingNavigationPath.self) private var path
    @Environment(ExampleStandard.self) private var standard
    @State var exportedConsent: PDFDocument?
    
    
    var body: some View {
        VStack {
            if (exportedConsent?.pageCount ?? 0) == 0 {
                Circle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .overlay(
                        Text("Consent PDF rendering doesn't exist")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                    )
            } else {
                Circle()
                    .fill(Color.green)
                    .frame(width: 200, height: 200)
                    .overlay(
                        Text("Consent PDF rendering exists")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                    )
            }
             
            Button {
                path.nextStep()
            } label: {
                Text("Next")
            }
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .task {
            self.exportedConsent = try? await standard.loadConsent()
            // Reset OnboardingDataSource
            await standard.store(consent: .init())
        }
    }
}


#if DEBUG
struct OnboardingConsentMarkdownRenderingView_Previews: PreviewProvider {
    static var standard: OnboardingDataSource = .init()
    
    
    static var previews: some View {
        OnboardingStack(startAtStep: OnboardingConsentMarkdownRenderingView.self) {
            for onboardingView in OnboardingFlow.previewSimulatorViews {
                onboardingView
                    .environment(standard)
            }
        }
    }
}
#endif
