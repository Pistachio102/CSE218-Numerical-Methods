function yy = LagrangeInterpolation(x,y,xx)

n = numel(x);
temp = 0;
for i = 1:n
prodTerm = y(i);
for j = 1:n
if i ~= j
prodTerm = prodTerm*(xx-x(j))/(x(i)-x(j));
end
end
temp = temp+prodTerm;
end
yy = temp;