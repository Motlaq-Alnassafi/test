import SwiftUI

/// First onboarding page — a friendly welcome.
struct OnboardingPage1View: View {

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "hand.wave.fill")
                .font(.system(size: 80))
                .foregroundStyle(.tint)
                .accessibilityHidden(true)

            Text("Welcome")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("We're glad you're here. Let's show you around.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .accessibilityElement(children: .combine)
    }
}
