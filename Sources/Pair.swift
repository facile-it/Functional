public protocol PairType {
	associatedtype LeftType
	associatedtype RightType

	func fold<T>(_ transform: (LeftType,RightType) -> T) -> T
}

public struct Pair<A,B>: PairType {
	fileprivate let _left: A
	fileprivate let _right: B

	public init(_ left: A, _ right: B) {
		self._left = left
		self._right = right
	}

	public func fold<T>(_ transform: (A,B) -> T) -> T {
		return transform(_left,_right)
	}
}

extension Pair where A: Equatable, B: Equatable {
	public static func == (left: Pair, right: Pair) -> Bool {
		return left._left == right._left && left._right == right._right
	}
}

extension PairType {
	public var left: LeftType {
		return fold { left, _ in left }
	}

	public var right: RightType {
		return fold { _, right in right }
	}

	public var unwrap: (LeftType,RightType) {
		return fold { left, right in (left,right) }
	}

	public func bimap<T,U>(onLeft: (LeftType) -> T, onRight: (RightType) -> U) -> Pair<T,U> {
		return fold { Pair.init(onLeft($0), onRight($1)) }
	}

	public func mapLeft<T>(_ transform: (LeftType) -> T) -> Pair<T,RightType> {
		return bimap(onLeft: transform, onRight: F.identity)
	}

	public func mapRight<U>(_ transform: (RightType) -> U) -> Pair<LeftType,U> {
		return bimap(onLeft: F.identity, onRight: transform)
	}
}
