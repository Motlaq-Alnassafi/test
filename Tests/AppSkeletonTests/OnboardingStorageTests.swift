import Foundation
import Testing
@testable import WelcomeFeatureiOSApp

@Suite("OnboardingStorage Tests")
struct OnboardingStorageTests {

    /// Creates a fresh `UserDefaults` suite and guarantees cleanup.
    private func makeCleanDefaults(suite: String) -> UserDefaults {
        let defaults = UserDefaults(suiteName: suite)!
        defaults.removePersistentDomain(forName: suite)
        return defaults
    }

    @Test("Defaults to false when nothing has been persisted")
    func defaultsToFalse() {
        let suite = "test.onboarding.default.\(UUID().uuidString)"
        let defaults = makeCleanDefaults(suite: suite)
        defer { defaults.removePersistentDomain(forName: suite) }

        let storage = UserDefaultsOnboardingStorage(defaults: defaults)
        #expect(!storage.hasCompletedOnboarding)
    }

    @Test("Persists true after setting hasCompletedOnboarding")
    func persistsCompletion() {
        let suite = "test.onboarding.persist.\(UUID().uuidString)"
        let defaults = makeCleanDefaults(suite: suite)
        defer { defaults.removePersistentDomain(forName: suite) }

        let storage = UserDefaultsOnboardingStorage(defaults: defaults)
        storage.hasCompletedOnboarding = true
        #expect(storage.hasCompletedOnboarding)

        // A second instance reading the same defaults should see `true`.
        let storage2 = UserDefaultsOnboardingStorage(defaults: defaults)
        #expect(storage2.hasCompletedOnboarding)
    }

    @Test("Can reset back to false")
    func resetsToFalse() {
        let suite = "test.onboarding.reset.\(UUID().uuidString)"
        let defaults = makeCleanDefaults(suite: suite)
        defer { defaults.removePersistentDomain(forName: suite) }

        let storage = UserDefaultsOnboardingStorage(defaults: defaults)
        storage.hasCompletedOnboarding = true
        storage.hasCompletedOnboarding = false
        #expect(!storage.hasCompletedOnboarding)
    }
}
