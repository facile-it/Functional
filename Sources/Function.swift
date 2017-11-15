//public protocol FunctionType {
//	associatedtype SourceType
//	associatedtype TargetType
//
//	func call(_ source: SourceType) -> TargetType
//}
//
//public struct Function<A,B>: FunctionType {
//	private let _call: (A) -> B
//	init(_ call: @escaping (A) -> B) {
//		self._call = call
//	}
//
//	public typealias SourceType = A
//	public typealias TargetType = B
//
//	public func call(_ source: A) -> B {
//		return self._call(source)
//	}
//}
//
//extension FunctionType {
//	public func dimap<A,B>(source: @escaping (A) -> SourceType, target: @escaping (TargetType) -> B) -> Function<A,B> {
//		return Function<A,B>.init { value in target(self.call(source(value))) }
//	}
//
//	public func map<T>(_ transform: @escaping (TargetType) -> T) -> Function<SourceType,T> {
//		return dimap(source: { $0 }, target: transform)
//	}
//
//	public func contramap<T>(_ transform: @escaping (T) -> SourceType) -> Function<T,TargetType> {
//		return dimap(source: transform, target: { $0 })
//	}
//}
//
//extension FunctionType where SourceType == TargetType {
//	public static var identity: Function<SourceType,TargetType> {
//		return Function<SourceType,TargetType>.init { $0 }
//	}
//}

