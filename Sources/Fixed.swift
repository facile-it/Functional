import Abstract

public func identity <A> (_ a: A) -> A {
	return a
}

public func identity <A,B> (_ a: A, _ b: B) -> (A,B) {
	return (a,b)
}

public func identity <A,B,C> (_ a: A, _ b: B, _ c: C) -> (A,B,C) {
	return (a,b,c)
}

public func deconstruct <A,B,T> (_ function: @escaping ((A,B)) -> T) -> (A,B) -> T {
	return { a, b in function((a,b)) }
}

public func deconstruct <A,B,C,T> (_ function: @escaping ((A,B,C)) -> T) -> (A,B,C) -> T {
	return { a, b, c in function((a,b,c)) }
}

public func ignore () {}

public func ignore <A> (_ a: A) {}

public func ignore <A,B> (_ a: A, _ b: B) {}

public func ignore <A,B,C> (_ a: A, _ b: B, _ c: C) {}

public func first <A,B> (_ a: A, _ b: B) -> A {
	return a
}

public func first <A,B,C> (_ a: A, _ b: B, _ c: C) -> A {
	return a
}

public func second <A,B> (_ a: A, _ b: B) -> B {
	return b
}

public func second <A,B,C> (_ a: A, _ b: B, _ c: C) -> B {
	return b
}

public func third <A,B,C> (_ a: A, _ b: B, _ c: C) -> C {
	return c
}

public func apply <A,B> (_ function: (A) throws -> B, _ value: A) rethrows -> B {
	return try function(value)
}

public func § <A,B> (function: (A) throws -> B, value: A) rethrows -> B {
	return try apply(function, value)
}

public func |> <A,B> (value: A, function: (A) throws -> B) rethrows -> B {
	return try apply(function, value)
}

public func <| <A,B> (function: (A) throws -> B, value: A) rethrows -> B {
	return try apply(function, value)
}
