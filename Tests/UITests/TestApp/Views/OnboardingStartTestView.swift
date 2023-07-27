//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SpeziOnboarding
import SpeziViews
import SwiftUI

struct OnboardingStartTestView: View {
    @EnvironmentObject private var path: OnboardingNavigationPath
    @Binding var showConditionalView: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Button {
                path.append(OnboardingWelcomeTestView.self)
            } label: {
                Text("Welcome View")
            }
            
            Button {
                path.append(SequentialOnboardingTestView.self)
            } label: {
                Text("Sequential Onboarding")
            }

            Button {
                path.append(ConsentMarkdownTestView.self)
            } label: {
                Text("Consent View (Markdown)")
            }
            
            Button {
                path.append(ConsentHTMLTestView.self)
            } label: {
                Text("Consent View (HTML)")
            }
            
            Spacer()
                .frame(height: 8)
            
            // Sadly we need to use a button as UI tests are very flakey when clicking on SwiftUIs Toggles
            HStack {
                Button {
                    showConditionalView.toggle()
                } label: {
                    Text("Show Conditional View")
                }
                
                Rectangle()
                    .fill(showConditionalView ? Color.green : Color.red)
                    .frame(width: 20, height: 20)
            }
        }
    }
}

#if DEBUG
struct OnboardingStartTestView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStartTestView(
            showConditionalView: .constant(false)
        )
    }
}
#endif
