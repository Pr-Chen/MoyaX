import Foundation
import ReactiveCocoa

/// Extension for processing raw NSData generated by network access.
@available(*, deprecated, message="This will be removed when ReactiveCocoa 4 becomes final. Please visit https://github.com/MoyaX/MoyaX/issues/298 for more information.")
public extension RACSignal {

    /// Filters out responses that don't fall within the given range, generating errors when others are encountered.
    public func filterStatusCodes(range: ClosedInterval<Int>) -> RACSignal {
        return tryMap { object, error in
            do {
                return try cast(object).filterStatusCodes(range)
            } catch let Error {
                error.memory = (Error as! MoyaX.Error).nsError
                return nil
            }
        }
    }

    public func filterStatusCode(code: Int) -> RACSignal {
        return tryMap { object, error in
            do {
                return try cast(object).filterStatusCode(code)
            } catch let Error {
                error.memory = (Error as! MoyaX.Error).nsError
                return nil
            }
        }
    }

    public func filterSuccessfulStatusCodes() -> RACSignal {
        return tryMap { object, error in
            do {
                return try cast(object).filterSuccessfulStatusCodes()
            } catch let Error {
                error.memory = (Error as! MoyaX.Error).nsError
                return nil
            }
        }
    }

    public func filterSuccessfulStatusAndRedirectCodes() -> RACSignal {
        return tryMap { object, error in
            do {
                return try cast(object).filterSuccessfulStatusAndRedirectCodes()
            } catch let Error {
                error.memory = (Error as! MoyaX.Error).nsError
                return nil
            }
        }
    }

    /// Maps data received from the signal into an Image. If the conversion fails, the signal errors.
    public func mapImage() -> RACSignal {
        return tryMap { object, error in
            do {
                return try cast(object).mapImage()
            } catch let Error {
                error.memory = (Error as! MoyaX.Error).nsError
                return nil
            }
        }
    }

    /// Maps data received from the signal into a JSON object. If the conversion fails, the signal errors.
    public func mapJSON() -> RACSignal {
        return tryMap { object, error in
            do {
                return try cast(object).mapJSON()
            } catch let Error {
                error.memory = (Error as! MoyaX.Error).nsError
                return nil
            }
        }
    }

    /// Maps data received from the signal into a String. If the conversion fails, the signal errors.
    public func mapString() -> RACSignal {
        return tryMap { object, error in
            do {
                return try cast(object).mapString()
            } catch let Error {
                error.memory = (Error as! MoyaX.Error).nsError
                return nil
            }
        }
    }
}

/// Trys to cast object to the expected Response
@available(*, deprecated, message="This will be removed when ReactiveCocoa 4 becomes final. Please visit https://github.com/MoyaX/MoyaX/issues/298 for more information.")
private func cast(object: AnyObject) throws -> Response {
    return object as! Response
}
