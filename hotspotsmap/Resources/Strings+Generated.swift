// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Cancel
  internal static let cancel = L10n.tr("Localizable", "cancel")
  /// Failed to load hotspots
  internal static let failedToLoadHotspots = L10n.tr("Localizable", "failed_to_load_hotspots")
  /// Error
  internal static let generalErrorTitle = L10n.tr("Localizable", "general_error_title")
  /// Loading hotspots...
  internal static let loadingsStatus = L10n.tr("Localizable", "loadings_status")
  /// Too many points. Increase the search area.
  internal static let tooManyPointsError = L10n.tr("Localizable", "too_many_points_error")
  /// Oops, something went wrong
  internal static let unknownError = L10n.tr("Localizable", "unknown_error")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
