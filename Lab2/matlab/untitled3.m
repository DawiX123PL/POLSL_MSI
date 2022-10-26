clc

T = [-1 -1 1; 1 -1 1]'
net = newhop(T);

Ai = T;

Ai(3,2) = 0;
Ai(3,1) = 0;
A = Ai(:,1)


[Y,Pf,Af] = net(1, [], A)
    

W = T*T' / 2