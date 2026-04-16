import SwiftUI

/// Third onboarding page — emphasises personalisation.
struct OnboardingPage3View: View {

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .font(.system(size: 80))
                .foregroundStyle(.tint)
                .accessibilityHidden(true)

            Text("Personalise")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Tailor the experience to match your preferences.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .accessibilityElement(children: .combine)
    }
}
