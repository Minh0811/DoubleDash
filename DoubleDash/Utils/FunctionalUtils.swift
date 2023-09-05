//
//  FunctionalUtils.swift
//  DoubleNumbers
//
//  Created by Minh Vo on 16/08/2023.
//

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
