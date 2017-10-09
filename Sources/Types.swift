public typealias Endo<T> = (T) -> T

public struct Pair<A,B> {
	public let left: A
	public let right: B

	public init(_ left: A, _ right: B) {
		self.left = left
		self.right = right
	}

	public static func wrap(_ tuple: (A,B)) -> Pair<A,B> {
		return Pair<A,B>(tuple.0, tuple.1)
	}

	public var unwrap: (A,B) {
		return (left,right)
	}

	public func fold<T>(_ transform: (A,B) -> T) -> T {
		return transform(left,right)
	}

	public func bimap<T,U>(onLeft: (A) -> T, onRight: (B) -> U) -> Pair<T,U> {
		return Pair<T,U>(onLeft(left), onRight(right))
	}

	public func mapLeft<T>(_ transform: (A) -> T) -> Pair<T,B> {
		return Pair<T,B>(transform(left), F.identity(right))
	}

	public func mapRight<U>(_ transform: (B) -> U) -> Pair<A,U> {
		return Pair<A,U>(F.identity(left), transform(right))
	}
}

extension Pair where A: Equatable, B: Equatable {
	public static func == (left: Pair, right: Pair) -> Bool {
		return left.left == right.left && left.right == right.right
	}
}

public enum Either<A,B> {
	case left(A)
	case right(B)

	public var tryLeft: A? {
		guard case .left(let value) = self else { return nil }
		return value
	}

	public var tryRight: B? {
		guard case .right(let value) = self else { return nil }
		return value
	}

	public func fold<T>(onLeft: (A) -> T, onRight: (B) -> T) -> T {
		switch self {
		case .left(let value):
			return onLeft(value)
		case .right(let value):
			return onRight(value)
		}
	}

	public func foldToLeft(_ transformRight: (B) -> A) -> A {
		return fold(onLeft: F.identity, onRight: transformRight)
	}

	public func foldToRight(_ transformLeft: (A) -> B) -> B {
		return fold(onLeft: transformLeft, onRight: F.identity)
	}

	public func bimap<T,U>(onLeft: (A) -> T, onRight: (B) -> U) -> Either<T,U> {
		switch self {
		case .left(let value):
			return .left(onLeft(value))
		case .right(let value):
			return .right(onRight(value))
		}
	}
}

extension Either where A: Equatable, B: Equatable {
	public static func == (left: Either, right: Either) -> Bool {
		switch (left,right) {
		case (.left(let leftValue),.left(let rightValue)):
			return leftValue == rightValue
		case (.right(let leftValue),.right(let rightValue)):
			return leftValue == rightValue
		default:
			return false
		}
	}
}
