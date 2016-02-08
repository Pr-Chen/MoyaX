import Foundation
import RxSwift

/// Extension for processing raw NSData generated by network access.
extension ObservableType where E == Response {

    /// Filters out responses that don't fall within the given range, generating errors when others are encountered.
    public func filterStatusCodes(range: ClosedInterval<Int>) -> Observable<E> {
        return flatMap { response -> Observable<E> in
            return Observable.just(try response.filterStatusCodes(range))
        }
    }

    public func filterStatusCode(code: Int) -> Observable<E> {
        return flatMap { response -> Observable<E> in
            return Observable.just(try response.filterStatusCode(code))
        }
    }

    public func filterSuccessfulStatusCodes() -> Observable<E> {
        return flatMap { response -> Observable<E> in
            return Observable.just(try response.filterSuccessfulStatusCodes())
        }
    }

    public func filterSuccessfulStatusAndRedirectCodes() -> Observable<E> {
        return flatMap { response -> Observable<E> in
            return Observable.just(try response.filterSuccessfulStatusAndRedirectCodes())
        }
    }

    /// Maps data received from the signal into a UIImage. If the conversion fails, the signal errors.
    public func mapImage() -> Observable<Image!> {
        return flatMap { response -> Observable<Image!> in
            return Observable.just(try response.mapImage())
        }
    }

    /// Maps data received from the signal into a JSON object. If the conversion fails, the signal errors.
    public func mapJSON() -> Observable<AnyObject> {
        return flatMap { response -> Observable<AnyObject> in
            return Observable.just(try response.mapJSON())
        }
    }

    /// Maps data received from the signal into a String. If the conversion fails, the signal errors.
    public func mapString() -> Observable<String> {
        return flatMap { response -> Observable<String> in
            return Observable.just(try response.mapString())
        }
    }
}