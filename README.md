# AbsintheDialyzerWarning

This repo demonstrated a bug that causes dialyzer warnings when implementing the `middleware` callback in an Absinthe.Schema.

## Details

Absinthe.Schema injects a function when used called
[`__do_absinthe_middleware__`](https://github.com/absinthe-graphql/absinthe/blob/5ae9ea2dd21e064efef6d7adc47d2b1de3b8175c/lib/absinthe/schema.ex#L139-L147) which calls the `middleware` callback and
then uses a case statement to match on the results. The first case in
that case statement is a match on `[]`. Absinthe is checking to make
sure our middleware callback really retruned a non-empty list and
raising an excpetion if we didn't. The problem is that dialyzer is smart
enough to see that our middleware function is incapable or returning an
empty list, and so it complains that that part of the case statment can
never be reached and should be removed. Which generates the following
warning:

```
lib/absinthe_dialyzer_warning.ex:2: The pattern [] can never match the type [any(),...]
```

The short term solution here is to use this module attribute to silence
the warning with:

```
@dialyzer {:nowarn_function, __do_absinthe_middleware__: 3}
```

Ideally Absinthe.Schema could be "fixed" in such a way that this warning is not generated.
