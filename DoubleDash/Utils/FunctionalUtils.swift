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

/// Binds a value to a closure and returns the result of the closure.
///
/// This function is a basic representation of the bind operation (also known as flatMap in some contexts).
/// It takes a value and a closure, applies the closure to the value, and then returns the result.
///
/// - Parameters:
///   - x: The value to be passed to the closure.
///   - closure: The closure that takes the value and returns a result.
/// - Returns: The result of applying the closure to the value.
func bind<T, U>(_ x: T, _ closure: (T) -> U) -> U {
    return closure(x)
}
