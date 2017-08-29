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
