public typealias Endo<T> = (T) -> T

public struct Both<A,B> {
	public let left: A
	public let right: B

	public init(_ left: A, _ right: B) {
		self.left = left
		self.right = right
	}

	public var unwrap: (A,B) {
		return (left,right)
	}

	public func fold<T>(_ transform: (A,B) -> T) -> T {
		return transform(left,right)
	}

	public func map<T,U>(onLeft: (A) -> T, onRight: (B) -> U) -> Both<T,U> {
		return Both<T,U>(onLeft(left), onRight(right))
	}

	public func map<T>(onLeft: (A) -> T) -> Both<T,B> {
		return Both<T,B>(onLeft(left), F.identity(right))
	}

	public func map<U>(onRight: (B) -> U) -> Both<A,U> {
		return Both<A,U>(F.identity(left), onRight(right))
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

	public func map<T,U>(onLeft: (A) -> T, onRight: (B) -> U) -> Either<T,U> {
		switch self {
		case .left(let value):
			return .left(onLeft(value))
		case .right(let value):
			return .right(onRight(value))
		}
	}
}
