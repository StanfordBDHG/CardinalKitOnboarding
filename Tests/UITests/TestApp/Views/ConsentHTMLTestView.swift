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


struct ConsentHTMLTestView: View {
    @EnvironmentObject private var path: OnboardingNavigationPath
    
    
    var body: some View {
        ConsentView(
            header: {
                OnboardingTitleView(title: "Consent", subtitle: "Version 1.0")
            },
            asyncHTML: {
                try? await Task.sleep(for: .seconds(2))
                let html = """
                        <meta name=\"viewport\" content=\"initial-scale=1.0\" />
                        <h1>Study Consent</h1>
                        <hr />
                        <p>This is an example of a study consent written in HTML.</p>
                        <h2>Study Tasks</h2>
                        <ul>
                            <li>First task</li>
                            <li>Second task</li>
                            <li>Third task</li>
                        </ul>
                """
                return Data(html.utf8)
            },
            action: {
                path.nextStep()
            }
        )
    }
}


#if DEBUG
struct ConsentHTMLTestView_Previews: PreviewProvider {
    static var previews: some View {
        ConsentHTMLTestView()
    }
}
#endif
