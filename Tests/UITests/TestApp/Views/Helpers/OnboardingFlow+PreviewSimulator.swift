//
// This source file is part of the Stanford Spezi open-source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import SwiftUI


/// Defines onboarding views that are shown in the Xcode preview simulator
enum OnboardingFlow {
    @MainActor static let previewSimulatorViews: [any View] = {
        [
            OnboardingStartTestView(showConditionalView: .constant(true)),
            OnboardingWelcomeTestView(),
            OnboardingSequentialTestView(),

            OnboardingConsentTestView(
                consentTitle: "Consent Document",
                consentText: "This is the first *markdown* **example**",
                documentIdentifier: ConsentDocumentIdentifiers.first
            ),
            OnboardingConsentFinishedRenderedView(
                consentTitle: "Consent Document",
                documentIdentifier: ConsentDocumentIdentifiers.first
            ),

            OnboardingConsentTestView(
                consentTitle: "Consent Document",
                consentText: "This is the second *markdown* **example**",
                documentIdentifier: ConsentDocumentIdentifiers.second
            )
                .onboardingIdentifier(ConsentDocumentIdentifiers.second),
            OnboardingConsentFinishedRenderedView(
                consentTitle: "Consent Document",
                documentIdentifier: ConsentDocumentIdentifiers.second
            )
                .onboardingIdentifier("\(ConsentDocumentIdentifiers.second)_rendering"),

            OnboardingCustomTestView1(exampleArgument: "test"),
            OnboardingCustomTestView2(),
            OnboardingConditionalTestView()
        ]
    }()
}
