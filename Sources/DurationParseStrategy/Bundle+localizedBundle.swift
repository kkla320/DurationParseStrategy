import Foundation

extension Bundle {
    /// Returns the bundle for the given locale.
    /// - Parameter locale: The locale to get the bundle for.
    /// - Returns: The bundle for the given locale if it exists.
    func localizedBundle(for locale: Locale) -> Bundle? {
        guard let path = languageSpecificDirectory(for: locale) else {
            return nil
        }
        
        return Bundle(path: path)
    }
    
    private func languageSpecificDirectory(for locale: Locale) -> String? {
        let languageCode = locale.language.languageCode?.identifier
        return languageSpecificDirectory(named: locale.identifier) ?? languageCode.flatMap(languageSpecificDirectory(named:))
    }
    
    private func languageSpecificDirectory(named name: String) -> String? {
        return path(forResource: name, ofType: "lproj")
    }
}
