# FixedLengthVector
This workspace illustrates an unforeseen side effect of the changes to Collection in Swift 4.1.

The workspace contains two projects, a framework and a macOS application. The framework contains a protocol 
called `FixedLengthVector` that is designed to allow the use of short fixed-length arrays (or vectors --
the design is derived from a C++ project) that are indexed by the cases of an enum type, also defined
within the framework. For external reasons, the underlying type of this enum is `CInt` (or `Int32`) and not `Int`.

The actual vector types are defined in the main application and not in the framework.  For example,
the type `VecSuit4` represents a vector of four elements, indexed by the `Suit` enum (which contains
`.clubs`, `.diamonds`, `.hearts`, and `.spades`). 

This code compiles and works as intended in versions of Swift up to 4.0.3 (in Xcode 9.2). However,
in Xcode 9.3 and later, the compiler issues the following error where the vector types are defined:

`'FixedLengthVector' requires the types 'Suit.RawValue' (aka 'Int32') and 'Int' be equivalent`

My suspicion is that this is related to the change in SE-0191 "Eliminate `IndexDistance` from `Collection`",
in which the associated type `IndexDistance` was fixed to `Int`, but it's not clear to me why this has
affected the requirement of `Int` and I haven't been able to devise a workaround yet.
