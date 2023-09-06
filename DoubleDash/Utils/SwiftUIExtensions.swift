/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Minh Vo
 ID: S3879953
 Created  date: 16/08/2023 (e.g. 31/07/2023)
 Last modified: 6/09/2023 (e.g. 05/08/2023)
 Acknowledgement:
 */

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
