function [] = QuadraticSpline(x,y,xx)
figure
n   =   length(x)-1;
xVals   =   zeros(3*n);
yVals   =   zeros(3*n,1);

varIdx=1;
yIdx=1;

for i=2:2:2*n    
    xVals(i,yIdx:yIdx+2) =   [x(varIdx)^2 x(varIdx) 1];
    yVals(i) =   y(varIdx);
    varIdx =   varIdx+1;
    xVals(i+1,yIdx:yIdx+2) =   [x(varIdx)^2 x(varIdx) 1];  
    yVals(i+1) = y(varIdx);
    yIdx = yIdx+3;
end

varIdx=1;
slopeIdx=2;
for i=2*n+2:3*n
    
    xVals(i,varIdx:varIdx+1)            =   [2*x(slopeIdx) 1];
    xVals(i,varIdx+3:varIdx+4)          =   [-2*x(slopeIdx) -1];
    varIdx                     =   varIdx+3;
    slopeIdx                     =   slopeIdx+1;
end
xVals(1,1)=1;
Coeff       =       xVals\yVals;
varIdx=1;
hold on;
for i=1:n
    Eqn=@(l) Coeff(varIdx)*l.^2+Coeff(varIdx+1)*l+Coeff(varIdx+2);
    fplot(Eqn,[x(i),x(i+1)]);
    hold on
    varIdx=varIdx+3;
end

title('Shampoo : Quadratic Spline Interpolation');
xlabel('time');
ylabel('shampoo sold');
hold on

for j = 1 : numel(xx)
   for i = 1 : n-1 
        if xx(j) >= x(i) && xx(j) <= x(i+1)
            Eqn=@(l) Coeff(3*i-2)*l.^2+Coeff(3*i-1)*l+Coeff(3*i);
            scatter(xx(j),Eqn(xx(j)),40,'g','filled');
            hold on
        end
   end
end
