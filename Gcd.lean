import Mathlib.Data.Nat.Basic
import LeanInfer
import Aesop

#init_llm_aesop

open Nat

def divides (m n : ℕ) : Bool :=
  n % m = 0

#eval divides 3 11
#eval divides 3 12

def fib : ℕ → ℕ
| 0 => 0
| 1 => 1
| (n + 2) => fib n + fib (n + 1)

#eval fib 2
#eval fib 3
#eval fib 4
#eval fib 5
#eval fib 6
#eval fib 7

namespace Hidden

def gcd : ℕ → ℕ → ℕ
| 0, y => y
| (x + 1), y => gcd (y % (x + 1)) (x + 1)
decreasing_by apply Nat.mod_lt ; simp  -- Prove `gcd` terminates.

#eval gcd 20 25
#eval gcd 20 20

theorem gcd_self (n : ℕ) : gcd n n = n := by
  cases n
  · unfold gcd
    rfl
  · unfold gcd
    rw [mod_self]
    unfold gcd
    rfl

theorem gcd_self' (n : ℕ) : gcd n n = n := by
  cases n <;> simp [gcd, mod_self]

theorem gcd_self'' (n : ℕ) : gcd n n = n := by
  -- aesop?
  cases n
  · simp_all only [zero_eq]
    apply Eq.refl
  · simp [gcd]

end Hidden
