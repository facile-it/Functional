public protocol FunctionType {
	associatedtype SourceType
	associatedtype TargetType

	func call(_ source: SourceType) -> TargetType
}

public struct Function<A,B>: FunctionType {
	private let _call: (A) -> B
	init(_ call: @escaping (A) -> B) {
		self._call = call
	}

	public typealias SourceType = A
	public typealias TargetType = B

	public func call(_ source: A) -> B {
		return self._call(source)
	}
}

extension FunctionType {
	public func promap<A,B>(source: @escaping (A) -> SourceType, target: @escaping (TargetType) -> B) -> Function<A,B> {
		return Function<A,B>.init { value in target(self.call(source(value))) }
	}

	public func map<T>(_ transform: @escaping (TargetType) -> T) -> Function<SourceType,T> {
		return promap(source: F.identity, target: transform)
	}

	public func contramap<T>(_ transform: @escaping (T) -> SourceType) -> Function<T,TargetType> {
		return promap(source: transform, target: F.identity)
	}
}
