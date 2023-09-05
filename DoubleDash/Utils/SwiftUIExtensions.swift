//
//  SwiftUIExtensions.swift
//  DoubleNumbers
//
//  Created by Minh Vo on 16/08/2023.
//

import SwiftUI

extension View {
    
    /// Converts the view into an `AnyView`.
    ///
    /// This method is useful for type-erasing views, which can be beneficial in certain SwiftUI scenarios
    /// where the compiler struggles with complex view hierarchies.
    ///
    /// - Returns: The type-erased view (`AnyView`).
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
    
}

// Define a postfix operator `>*` for a shorthand way to type-erase views.
postfix operator >*

/// A postfix function that type-erases the given view.
///
/// - Parameter lhs: The view to be type-erased.
/// - Returns: The type-erased view (`AnyView`).
postfix func >*<V>(lhs: V) -> AnyView where V: View {
    return lhs.eraseToAnyView()
}
