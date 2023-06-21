import Foundation

extension Bundle {
    /// Returns the bundle for the given locale.
    /// - Parameter locale: The locale to get the bundle for.
    /// - Returns: The bundle for the given locale if it exists.
    func localizedBundle(for locale: Locale) -> Bundle? {
        guard let path = path(forResource: locale.identifier, ofType: "lproj") else {
            return nil
        }
        
        return Bundle(path: path)
    }
}
