import SwiftUI

struct WelcomeView: View {
    static let headingText = "Welcome"
    static let getStartedButtonTitle = "Get Started"
    static let getStartedTappedMessage = "Get Started tapped"
    static let headingAccessibilityLabel = "Welcome heading"
    static let getStartedAccessibilityLabel = "Get Started"
    static let getStartedAccessibilityHint = "Starts the onboarding flow"

    private let onGetStarted: () -> Void

    init(onGetStarted: @escaping () -> Void = {
        print(Self.getStartedTappedMessage)
    }) {
        self.onGetStarted = onGetStarted
    }

    var body: some View {
        VStack(spacing: 16) {
            Text(Self.headingText)
                .font(.largeTitle)
                .accessibilityLabel(Self.headingAccessibilityLabel)

            Button(Self.getStartedButtonTitle) {
                onGetStarted()
            }
            .accessibilityLabel(Self.getStartedAccessibilityLabel)
            .accessibilityHint(Self.getStartedAccessibilityHint)
        }
        .padding()
    }

    func triggerGetStarted() {
        onGetStarted()
    }
}
