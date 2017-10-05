import Operadics

extension F {
	public static func identity <A> (_ value: A) -> A {
		return value
	}

	public static func ignore <A> (_ value: A) {}

	public static func ignore () {}

	public static func apply <A,B> (_ function: (A) throws -> B, _ value: A) rethrows -> B {
		return try function(value)
	}
}

public func § <A,B> (function: (A) throws -> B, value: A) rethrows -> B {
	return try F.apply(function, value)
}

public func |> <A,B> (value: A, function: (A) throws -> B) rethrows -> B {
	return try F.apply(function, value)
}

public func <| <A,B> (function: (A) throws -> B, value: A) rethrows -> B {
	return try F.apply(function, value)
}
