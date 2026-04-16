import SwiftUI

/// A horizontal progress bar that visualises how far through onboarding the user is.
struct OnboardingProgressBar: View {

    /// Normalised progress in the range `0...1`.
    let progress: Double

    var body: some View {
        ProgressView(value: progress, total: 1.0)
            .tint(.accentColor)
            .animation(.easeInOut(duration: 0.3), value: progress)
            .accessibilityLabel("Onboarding progress")
            .accessibilityValue("\(Int(progress * 100)) percent complete")
    }
}
