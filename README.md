# Functional
[![travis-ci](https://travis-ci.org/facile-it/Functional.svg?branch=master)](https://travis-ci.org/facile-it/Functional)
[![codecov](https://codecov.io/gh/facile-it/Functional/branch/master/graph/badge.svg)](https://codecov.io/gh/facile-it/Functional)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Basic functions and combinators for functional programming in Swift: it can be considered as an extension to `Foundation`.

------

The project depends on [`Operadics`](https://github.com/typelift/Operadics). Because `Operadics` is not ready for Carthage, it has to be built manually.

After checking out this project, please run the following from the project folder:

`bash buildOperadics.sh`.

**If you're using Carthage** please run the following instead **from the main project folder** after a `carthage update` or `carthage bootstrap` failed:

`bash buildOperadicsCarthage.sh`

Sorry for the inconvenience.
