import Foundation

/// Concrete ``OnboardingStorage`` backed by `UserDefaults`.
final class UserDefaultsOnboardingStorage: OnboardingStorage {

    // MARK: - Properties

    private let defaults: UserDefaults
    private static let key = "hasCompletedOnboarding"

    // MARK: - Init

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    // MARK: - OnboardingStorage

    var hasCompletedOnboarding: Bool {
        get { defaults.bool(forKey: Self.key) }
        set { defaults.set(newValue, forKey: Self.key) }
    }
}
