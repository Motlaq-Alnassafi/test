import Testing
@testable import WelcomeFeatureiOSApp

// MARK: - Mock

/// In-memory ``OnboardingStorage`` for testing.
final class MockOnboardingStorage: OnboardingStorage {
    var hasCompletedOnboarding: Bool

    init(completed: Bool = false) {
        self.hasCompletedOnboarding = completed
    }
}

// MARK: - Tests

@Suite("AppCoordinator Tests")
@MainActor
struct AppCoordinatorTests {

    @Test("Shows onboarding when storage reports incomplete")
    func showsOnboarding() {
        let storage = MockOnboardingStorage(completed: false)
        let coordinator = AppCoordinator(storage: storage)

        #expect(coordinator.currentScreen == .onboarding)
        #expect(coordinator.onboardingCoordinator != nil)
    }

    @Test("Shows home when storage reports complete")
    func showsHome() {
        let storage = MockOnboardingStorage(completed: true)
        let coordinator = AppCoordinator(storage: storage)

        #expect(coordinator.currentScreen == .home)
        #expect(coordinator.onboardingCoordinator == nil)
    }

    @Test("completeOnboarding transitions to home and persists")
    func completeOnboarding() {
        let storage = MockOnboardingStorage(completed: false)
        let coordinator = AppCoordinator(storage: storage)

        coordinator.completeOnboarding()

        #expect(coordinator.currentScreen == .home)
        #expect(storage.hasCompletedOnboarding)
        #expect(coordinator.onboardingCoordinator == nil)
    }

    @Test("completeOnboarding is idempotent")
    func completeOnboardingIdempotent() {
        let storage = MockOnboardingStorage(completed: false)
        let coordinator = AppCoordinator(storage: storage)

        coordinator.completeOnboarding()
        coordinator.completeOnboarding()

        #expect(coordinator.currentScreen == .home)
        #expect(storage.hasCompletedOnboarding)
    }
}
