import Foundation

extension Locale {
    enum SymbolNames: String {
        case hours
        case minutes
        case seconds
    }
    
    /// Returns the localized hour symbols.
    var hourSymbols: [String] {
        return symbols(named: .hours)
    }
    
    /// Returns the localized minute symbols.
    var minuteSymbols: [String] {
        return symbols(named: .minutes)
    }
    
    /// Returns the localized second symbols.
    var secondSymbols: [String] {
        return symbols(named: .seconds)
    }
    
    /// Returns the localized symbols for the given name.
    /// - Parameter name: The name of the symbols to return.
    /// - Returns: The localized symbols for the given name.
    func symbols(named name: SymbolNames) -> [String] {
        guard let bundle = Bundle.module.localizedBundle(for: self) else {
            return Locale.default.symbols(named: name)
        }
        
        return bundle.localizedString(forKey: name.rawValue, value: nil, table: nil)
            .lowercased()
            .components(separatedBy: ",")
    }
}
