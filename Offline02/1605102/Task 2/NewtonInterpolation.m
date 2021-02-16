
function yy = NewtonInterpolation(x,y,xx)

n = length(x);
DivDef = zeros(n);
DivDef(:,1) = y; 
for j = 2:n
    for i = 1:n-j+1
        DivDef(i,j) = (DivDef(i+1,j-1)-DivDef(i,j-1))/(x(i+j-1)-x(i));
    end
end

temp = 1;
yy = DivDef(1,1);
for j = 1:n-1
temp = temp*(xx-x(j));
yy = yy+DivDef(1,j+1)*temp;
end