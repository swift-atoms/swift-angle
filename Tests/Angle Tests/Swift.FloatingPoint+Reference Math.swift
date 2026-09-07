
public import Trigonometry
#if canImport(Darwin)
import Darwin
extension Swift.Double: @retroactive Trigonometry.`Protocol` {
    public static func sin(_ x: Double) -> Double { Darwin.sin(x) }
    public static func cos(_ x: Double) -> Double { Darwin.cos(x) }
    public static func tan(_ x: Double) -> Double { Darwin.tan(x) }
    public static func asin(_ x: Double) -> Double { Darwin.asin(x) }
    public static func acos(_ x: Double) -> Double { Darwin.acos(x) }
    public static func atan(_ x: Double) -> Double { Darwin.atan(x) }
    public static func atan2(_ y: Double, _ x: Double) -> Double { Darwin.atan2(y, x) }
    public static func sinh(_ x: Double) -> Double { Darwin.sinh(x) }
    public static func cosh(_ x: Double) -> Double { Darwin.cosh(x) }
    public static func tanh(_ x: Double) -> Double { Darwin.tanh(x) }
    public static func asinh(_ x: Double) -> Double { Darwin.asinh(x) }
    public static func acosh(_ x: Double) -> Double { Darwin.acosh(x) }
    public static func atanh(_ x: Double) -> Double { Darwin.atanh(x) }
}
extension Swift.Float: @retroactive Trigonometry.`Protocol` {
    public static func sin(_ x: Float) -> Float { Darwin.sinf(x) }
    public static func cos(_ x: Float) -> Float { Darwin.cosf(x) }
    public static func tan(_ x: Float) -> Float { Darwin.tanf(x) }
    public static func asin(_ x: Float) -> Float { Darwin.asinf(x) }
    public static func acos(_ x: Float) -> Float { Darwin.acosf(x) }
    public static func atan(_ x: Float) -> Float { Darwin.atanf(x) }
    public static func atan2(_ y: Float, _ x: Float) -> Float { Darwin.atan2f(y, x) }
    public static func sinh(_ x: Float) -> Float { Darwin.sinhf(x) }
    public static func cosh(_ x: Float) -> Float { Darwin.coshf(x) }
    public static func tanh(_ x: Float) -> Float { Darwin.tanhf(x) }
    public static func asinh(_ x: Float) -> Float { Darwin.asinhf(x) }
    public static func acosh(_ x: Float) -> Float { Darwin.acoshf(x) }
    public static func atanh(_ x: Float) -> Float { Darwin.atanhf(x) }
}
#elseif canImport(Glibc)
import Glibc
extension Swift.Double: @retroactive Trigonometry.`Protocol` {
    public static func sin(_ x: Double) -> Double { Glibc.sin(x) }
    public static func cos(_ x: Double) -> Double { Glibc.cos(x) }
    public static func tan(_ x: Double) -> Double { Glibc.tan(x) }
    public static func asin(_ x: Double) -> Double { Glibc.asin(x) }
    public static func acos(_ x: Double) -> Double { Glibc.acos(x) }
    public static func atan(_ x: Double) -> Double { Glibc.atan(x) }
    public static func atan2(_ y: Double, _ x: Double) -> Double { Glibc.atan2(y, x) }
    public static func sinh(_ x: Double) -> Double { Glibc.sinh(x) }
    public static func cosh(_ x: Double) -> Double { Glibc.cosh(x) }
    public static func tanh(_ x: Double) -> Double { Glibc.tanh(x) }
    public static func asinh(_ x: Double) -> Double { Glibc.asinh(x) }
    public static func acosh(_ x: Double) -> Double { Glibc.acosh(x) }
    public static func atanh(_ x: Double) -> Double { Glibc.atanh(x) }
}
extension Swift.Float: @retroactive Trigonometry.`Protocol` {
    public static func sin(_ x: Float) -> Float { Glibc.sinf(x) }
    public static func cos(_ x: Float) -> Float { Glibc.cosf(x) }
    public static func tan(_ x: Float) -> Float { Glibc.tanf(x) }
    public static func asin(_ x: Float) -> Float { Glibc.asinf(x) }
    public static func acos(_ x: Float) -> Float { Glibc.acosf(x) }
    public static func atan(_ x: Float) -> Float { Glibc.atanf(x) }
    public static func atan2(_ y: Float, _ x: Float) -> Float { Glibc.atan2f(y, x) }
    public static func sinh(_ x: Float) -> Float { Glibc.sinhf(x) }
    public static func cosh(_ x: Float) -> Float { Glibc.coshf(x) }
    public static func tanh(_ x: Float) -> Float { Glibc.tanhf(x) }
    public static func asinh(_ x: Float) -> Float { Glibc.asinhf(x) }
    public static func acosh(_ x: Float) -> Float { Glibc.acoshf(x) }
    public static func atanh(_ x: Float) -> Float { Glibc.atanhf(x) }
}
#else
#error("A test-only reference math backend is required on this platform")
#endif
