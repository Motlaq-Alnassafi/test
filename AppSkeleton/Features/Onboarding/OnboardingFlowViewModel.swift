import Foundation

/// Manages the page state and progress of the onboarding flow.
///
/// > Important: This view model intentionally does **not** import SwiftUI.
@Observable
@MainActor
final class OnboardingFlowViewModel {

    // MARK: - Published State

    /// The zero-based index of the currently visible page.
    var currentPage: Int = 0

    // MARK: - Constants

    /// Total number of onboarding pages.
    let totalPages: Int = 4

    // MARK: - Derived State

    /// `true` when the user is viewing the final onboarding page.
    var isOnLastPage: Bool {
        currentPage == totalPages - 1
    }

    /// Normalised progress value in the range `0...1`.
    var progress: Double {
        Double(currentPage + 1) / Double(totalPages)
    }
}
