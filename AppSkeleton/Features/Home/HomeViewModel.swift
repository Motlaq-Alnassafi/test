import Foundation

/// View model for the home screen.
///
/// > Important: This view model intentionally does **not** import SwiftUI.
@Observable
@MainActor
final class HomeViewModel {

    /// Greeting text displayed on the home screen.
    let greeting: String = "Welcome Home!"
}
