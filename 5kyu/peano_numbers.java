package codewars;

import static codewars.PeanoNumbers.Peano.Zero;
import static codewars.PeanoNumbers.Peano.Succ;

public final class PeanoNumbers {
	interface Peano {
		final class Zero implements Peano {
			static Zero INSTANCE = new Zero();
			private Zero() {}
		}

		final class Succ implements Peano {
			final Peano peano;
			Succ(Peano peano) {
				this.peano = peano;
			}
		}
	}

	enum Ordering {GT, LT, EQ}

	static Peano add(Peano a, Peano b) {
      if (b instanceof Zero) return a;
      if (a instanceof Zero) return b;
      if (compare(a, b) == Ordering.LT) return add(b, a);
		  return add(new Succ(a), ((Succ) b).peano);
	}

	static Peano sub(Peano a, Peano b) {
      if (b instanceof Zero) return a;
      if (a instanceof Zero) throw new ArithmeticException("negative number");
      return sub(((Succ)a).peano, ((Succ)b).peano);
  }
  
  static Peano mul(Peano a, Peano b) {
      if (a instanceof Zero) return a;
		  if (b instanceof Zero) return b;
      return add(a, mul(a, ((Succ) b).peano));
  }
  
  static Peano div(Peano a, Peano b) {
      if (b instanceof Zero) throw new ArithmeticException("divide by 0");
      if (a instanceof Zero) return a;
      if (((Succ)b).peano instanceof Zero) return a;
      if (compare(a, b) == Ordering.LT) return Zero.INSTANCE;
      return new Succ(div (sub(a, b), b));
  }
  
  static boolean even(Peano p) {
      if (p instanceof Zero) return true;
      return odd(((Succ)p).peano);
  }
  
  static boolean odd(Peano p) {
      if (p instanceof Zero) return false;
      if (((Succ)p).peano instanceof Zero) return true;
      return even(((Succ)p).peano);
  }
  
  static Ordering compare(Peano a, Peano b) {
      if (a instanceof Zero && b instanceof Zero) return Ordering.EQ;
      if (a instanceof Zero) return Ordering.LT;
      if (b instanceof Zero) return Ordering.GT;
      return compare(((Succ)a).peano, ((Succ)b).peano);
  }
}
