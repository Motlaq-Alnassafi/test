import SwiftUI

/// Second onboarding page — highlights a key feature.
struct OnboardingPage2View: View {

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "sparkles")
                .font(.system(size: 80))
                .foregroundStyle(.tint)
                .accessibilityHidden(true)

            Text("Discover")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Explore powerful features designed just for you.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .accessibilityElement(children: .combine)
    }
}
