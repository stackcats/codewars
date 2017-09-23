church_add = lambda c1: lambda c2: lambda f: lambda x: c1(f)(c2(f)(x))
church_mul = lambda c1: lambda c2: lambda f: lambda x: c1(c2(f))(x)
church_pow = lambda cb: lambda ce: lambda f: lambda x: ce(cb)(f)(x)
