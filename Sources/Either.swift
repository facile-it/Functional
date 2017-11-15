//public protocol EitherType {
//	associatedtype LeftType
//	associatedtype RightType
//
//	func fold<T>(onLeft: (LeftType) -> T, onRight: (RightType) -> T) -> T
//}
//
//public enum Either<A,B>: EitherType {
//	case left(A)
//	case right(B)
//
//	public func fold<T>(onLeft: (A) -> T, onRight: (B) -> T) -> T {
//		switch self {
//		case .left(let value):
//			return onLeft(value)
//		case .right(let value):
//			return onRight(value)
//		}
//	}
//}
//
//extension Either where A: Equatable, B: Equatable {
//	public static func == (left: Either, right: Either) -> Bool {
//		switch (left,right) {
//		case (.left(let leftValue),.left(let rightValue)):
//			return leftValue == rightValue
//		case (.right(let leftValue),.right(let rightValue)):
//			return leftValue == rightValue
//		default:
//			return false
//		}
//	}
//}
//
//extension EitherType {
//	public var tryLeft: LeftType? {
//		return fold(onLeft: identity, onRight: { _ in nil })
//	}
//
//	public var tryRight: RightType? {
//		return fold(onLeft: { _ in nil }, onRight: identity)
//	}
//
//	public func foldToLeft(_ transformRight: (RightType) -> LeftType) -> LeftType {
//		return fold(onLeft: identity, onRight: transformRight)
//	}
//
//	public func foldToRight(_ transformLeft: (LeftType) -> RightType) -> RightType {
//		return fold(onLeft: transformLeft, onRight: identity)
//	}
//
//	public func bimap<T,U>(onLeft: (LeftType) -> T, onRight: (RightType) -> U) -> Either<T,U> {
//		return fold(
//			onLeft: { Either<T,U>.left(onLeft($0)) },
//			onRight: { Either<T,U>.right(onRight($0)) })
//	}
//
//	public func mapLeft<T>(_ transform: (LeftType) -> T) -> Either<T,RightType> {
//		return bimap(onLeft: transform, onRight: identity)
//	}
//
//	public func mapRight<U>(_ transform: (RightType) -> U) -> Either<LeftType,U> {
//		return bimap(onLeft: identity, onRight: transform)
//	}
//}

