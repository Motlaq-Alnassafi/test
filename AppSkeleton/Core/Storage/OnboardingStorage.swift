import Foundation

/// Abstraction for reading and writing onboarding-completion state.
protocol OnboardingStorage: AnyObject {
    var hasCompletedOnboarding: Bool { get set }
}
