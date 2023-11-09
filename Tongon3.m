ts = 1 ; 
ms = [1 3 1 0] ; 
Gs = tf(ts , ms) ; 
Hs = 1 ; 
T = feedback(Gs, Hs) ; %ham truyen 
step(T) 