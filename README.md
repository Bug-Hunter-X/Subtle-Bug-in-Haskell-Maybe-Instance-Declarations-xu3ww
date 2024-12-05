# Haskell Maybe Instance Bug

This repository demonstrates a subtle bug in Haskell code related to defining instances of `Eq` and `Ord` for the `Maybe` type.  The code compiles without errors but fails to handle cases where the underlying type `a` lacks a proper `Ord` instance.

The `bug.hs` file contains the buggy code. The `bugSolution.hs` file provides a corrected implementation that addresses the issue, explaining the nature of the problem.

## Bug Description

The main problem lies in the `Ord` instance definition. The comparison between `Maybe` values implicitly relies on the comparison of the wrapped values (`a`). If type `a` doesn't have an `Ord` instance (e.g., if `a` is a custom data type without explicit `Ord` defined), then the `compare` function will fail at runtime.  The `Eq` instance faces similar issues, albeit potentially causing less visible issues.

## Solution

The solution is to correctly handle cases where the underlying type `a` may not have `Ord` or `Eq` instances.   This often involves using a more robust approach, perhaps utilizing type classes for greater flexibility and type safety.