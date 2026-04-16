import SwiftUI

/// Final onboarding page — contains the "Get Started" button that completes onboarding.
struct OnboardingPage4View: View {

    /// Called when the user taps "Get Started".
    let onGetStarted: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 80))
                .foregroundStyle(.tint)
                .accessibilityHidden(true)

            Text("You're All Set")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Let's get started on your journey.")
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Button(action: onGetStarted) {
                Text("Get Started")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 48)
            .padding(.top, 16)
            .accessibilityLabel("Get Started")
            .accessibilityHint("Completes onboarding and opens the home screen")
        }
        .accessibilityElement(children: .contain)
    }
}
