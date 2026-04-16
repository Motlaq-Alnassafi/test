import SwiftUI

public struct WelcomeView: View {
    public static let headingText = "Welcome"
    public static let getStartedButtonTitle = "Get Started"
    public static let getStartedTappedMessage = "Get Started tapped"
    public static let headingAccessibilityLabel = "Welcome heading"
    public static let getStartedAccessibilityLabel = "Get Started"
    public static let getStartedAccessibilityHint = "Starts the onboarding flow"

    private let onGetStarted: () -> Void

    public init(onGetStarted: @escaping () -> Void = {
        print(Self.getStartedTappedMessage)
    }) {
        self.onGetStarted = onGetStarted
    }

    public var body: some View {
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
