import Testing
@testable import WelcomeFeature

@Suite("WelcomeView Tests")
@MainActor
struct WelcomeViewTests {
    @Test("Exposes expected title, action, and accessibility strings")
    func exposesStaticStrings() {
        #expect(WelcomeView.headingText == "Welcome")
        #expect(WelcomeView.getStartedButtonTitle == "Get Started")
        #expect(WelcomeView.getStartedTappedMessage == "Get Started tapped")
        #expect(WelcomeView.headingAccessibilityLabel == "Welcome heading")
        #expect(WelcomeView.getStartedAccessibilityLabel == "Get Started")
        #expect(WelcomeView.getStartedAccessibilityHint == "Starts the onboarding flow")
    }

    @Test("Get Started action invokes the configured callback")
    func triggersGetStartedAction() {
        var capturedMessage: String?
        let view = WelcomeView {
            capturedMessage = WelcomeView.getStartedTappedMessage
        }

        view.triggerGetStarted()

        #expect(capturedMessage == "Get Started tapped")
    }
}
