// covers the compound bitwise/shift assignment operators
// |= &= ^= <<= >>= >>>=

local a = 12
a |= 3;   print("or " + a + "\n")
a &= 6;   print("and " + a + "\n")
a ^= 15;  print("xor " + a + "\n")
a <<= 3;  print("shl " + a + "\n")
a >>= 1;  print("shr " + a + "\n")
a = -16
a >>>= 60; print("ushr " + a + "\n")

local t = { v = 5, w = 1 }
t.v |= 2
t.w <<= 4
print("table " + t.v + " " + t.w + "\n")

local arr = [1, 2]
arr[0] |= 8
arr[1] ^= 3
print("array " + arr[0] + " " + arr[1] + "\n")

let f = function() {
  local o = 1
  return function() { o <<= 2; return o }
}()
print("outer " + f() + " " + f() + "\n")

local x = 1
x |= 2 + 4
print("prec " + x + "\n")

local s = "a"
try { s |= 2; print("FAIL: no error\n") }
catch (e) { print("caught: " + e + "\n") }
