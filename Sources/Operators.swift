import Operadics

precedencegroup SequentialCompositionPrecedence {
	associativity: left
	higherThan: CompositionPrecedence
}

infix operator ... : SequentialCompositionPrecedence

public typealias Endo<T> = (T) -> T
