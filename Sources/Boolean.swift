extension Bool {
	public func and(_ other: @autoclosure () -> Bool) -> Bool {
		return self && other()
	}

	public func or(_ other: @autoclosure () -> Bool) -> Bool {
		return self || other()
	}

	public var not: Bool {
		return !self
	}

	public func implies(_ other: @autoclosure () -> Bool) -> Bool {
		return self.not.or(other())
	}
}

precedencegroup LogicalImplicationPrecedence {
	associativity: left
	higherThan: TernaryPrecedence
	lowerThan: LogicalDisjunctionPrecedence
}

infix operator => : LogicalImplicationPrecedence

public func => (_ left: Bool, _ right: @autoclosure () -> Bool) -> Bool {
	return left.implies(right())
}

extension Bool {
	public func ifTrue<A>(then: @autoclosure () -> A, else: @autoclosure () -> A) -> A {
		if self {
			return then()
		} else {
			return `else`()
		}
	}

	public func ifTrue(_ call: () -> ()) {
		ifTrue(then: call(), else: ())
	}

	public func ifFalse(_ call: () -> ()) {
		ifTrue(then: (), else: call())
	}
}
