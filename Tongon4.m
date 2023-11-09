syms s ; 
ts = 1 ; 
ms = sym2poly(s + 2) ; 
T = tf(ts , ms) ; 
bode(T) ; 
margin(T) ; 
bode(T , Gs) 