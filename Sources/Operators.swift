import Operadics

precedencegroup SequentialCompositionPrecedence {
	associativity: left
	higherThan: CompositionPrecedence
}

infix operator ... : SequentialCompositionPrecedence

precedencegroup LogicalImplicationPrecedence {
	associativity: left
	higherThan: TernaryPrecedence
	lowerThan: LogicalDisjunctionPrecedence
}

infix operator => : LogicalImplicationPrecedence
