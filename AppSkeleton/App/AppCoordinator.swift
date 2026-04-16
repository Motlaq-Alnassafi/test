import Foundation

/// Root coordinator that decides whether to show onboarding or the home screen.
///
/// > Important: This coordinator intentionally does **not** import SwiftUI.
@Observable
@MainActor
final class AppCoordinator: Coordinator {

    // MARK: - Types

    /// The two top-level screens the app can display.
    enum Screen {
        case onboarding
        case home
    }

    // MARK: - State

    /// The screen currently shown to the user.
    private(set) var currentScreen: Screen

    /// Coordinator that owns the onboarding feature's state.
    private(set) var onboardingCoordinator: OnboardingCoordinator?

    // MARK: - Dependencies

    private let storage: OnboardingStorage

    // MARK: - Init

    init(storage: OnboardingStorage = UserDefaultsOnboardingStorage()) {
        self.storage = storage
        let screen: Screen = storage.hasCompletedOnboarding ? .home : .onboarding
        self.currentScreen = screen
        if screen == .onboarding {
            self.onboardingCoordinator = OnboardingCoordinator()
        }
    }

    // MARK: - Actions

    /// Marks onboarding as complete, persists the flag, and transitions to home.
    func completeOnboarding() {
        storage.hasCompletedOnboarding = true
        currentScreen = .home
        onboardingCoordinator = nil
    }
}
