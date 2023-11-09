syms s ; 
ts = sym2poly(s^4 +s^3 + 2 * s^2 -s +5) ; 
ms = sym2poly(2*s^5 - s^3 +7*s) ; 
T = tf(ts , ms) ; 