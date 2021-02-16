function [y]=CosFunc(value,n)
syms x;
f(x)=taylor(cos(x),'Order',2*n);
[y]=f(value);