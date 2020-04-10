public enum TrailerStatus<T: Headers> {
    // Continue filter chain iteration.
    case `continue`(T)

    // Do not iterate to any of the remaining filters in the chain. Calling
    // continueDecoding()/continueEncoding() MUST be called if continued filter iteration is desired.
    case stopIteration(T)
}