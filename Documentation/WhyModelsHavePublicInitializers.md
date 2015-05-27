# Why Models have Public Initializers

since there is already the default initializers.

## Default Initializers for Structure Types are Memberwise

In Apple's documentation: [Default Initializers](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID213), it says **"Structure types automatically receive a memberwise initializer if they do not define any of their own custom initializers."**

When initializing structures in tests, if there's no public initializer, compiler will complain that `StructX cannot be initialised because it has no accessible initializers.`

This is the reason why there are public initializers in models when there are default ones.
