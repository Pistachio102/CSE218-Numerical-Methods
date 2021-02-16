close all; clear; clc;
%--------------------------------------------------------------------------------------

%func = inline('x./((1-x).*(6./(2+x)).^0.5)-0.05');

[rootFP, nIterFP] = falsePositionMethod(@Off,-.9,.9,0.5,100);



[rootSM, nIterSM] = Secant(@Off,-.9,.9,0.5,100);