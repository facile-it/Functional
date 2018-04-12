import Abstract

public func compose <A,B,C> (_ first: @escaping (A) -> B, _ second: @escaping (B) -> C) -> (A) -> C {
	return { second(first($0)) }
}

public func compose <A,B,C> (_ first: @escaping (A) throws -> B, _ second: @escaping (B) -> C) -> (A) throws -> C {
	return { try second(first($0)) }
}

public func compose <A,B,C> (_ first: @escaping (A) -> B, _ second: @escaping (B) throws -> C) -> (A) throws -> C {
	return { try second(first($0)) }
}

public func compose <A,B,C> (_ first: @escaping (A) throws -> B, _ second: @escaping (B) throws -> C) -> (A) throws -> C {
	return { try second(first($0)) }
}

public func flip<A,B,C>(_ function: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
	return { b in { a in function(a)(b) } }
}

public func flip<A,B,C>(_ function: @escaping (A) throws -> (B) -> C) -> (B) -> (A) throws -> C {
	return { b in { a in try function(a)(b) } }
}

public func flip<A,B,C>(_ function: @escaping (A) -> (B) throws -> C) -> (B) throws -> (A) throws -> C {
	return { b in { a in try function(a)(b) } }
}

public func flip<A,B,C>(_ function: @escaping (A) throws -> (B) throws -> C) -> (B) throws -> (A) throws -> C {
	return { b in { a in try function(a)(b) } }
}

public func duplicate<A> (_ a: A) -> (A,A) {
	return (a,a)
}

public func duplicate <A,B> (_ f: @escaping (A) -> B) -> (A,A) -> (B,B) {
	return { (a1,a2)  in (f(a1),f(a2)) }
}

public func triplicate <A> (_ a: A) -> (A,A,A) {
	return (a,a,a)
}

public func triplicate <A,B> (_ f: @escaping (A) -> B) -> (A,A,A) -> (B,B,B) {
	return { (a1,a2,a3)  in (f(a1),f(a2),f(a3)) }
}

public func • <A,B,C> (second: @escaping (B) -> C, first: @escaping (A) -> B) -> (A) -> C {
	return compose(first, second)
}

public func • <A,B,C> (second: @escaping (B) -> C, first: @escaping (A) throws -> B) -> (A) throws -> C {
	return compose(first, second)
}

public func • <A,B,C> (second: @escaping (B) throws -> C, first: @escaping (A) -> B) -> (A) throws -> C {
	return compose(first, second)
}

public func • <A,B,C> (second: @escaping (B) throws -> C, first: @escaping (A) throws -> B) -> (A) throws -> C {
	return compose(first, second)
}

public func ... <A,B,C> (first: @escaping (A) -> B, second: @escaping (B) -> C) -> (A) -> C {
	return compose(first, second)
}

public func ... <A,B,C> (first: @escaping (A) throws -> B, second: @escaping (B) -> C) -> (A) throws -> C {
	return compose(first, second)
}

public func ... <A,B,C> (first: @escaping (A) -> B, second: @escaping (B) throws -> C) -> (A) throws -> C {
	return compose(first, second)
}

public func ... <A,B,C> (first: @escaping (A) throws -> B, second: @escaping (B) throws -> C) -> (A) throws -> C {
	return compose(first, second)
}
