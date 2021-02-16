function coefficients = multiLinearRegression (X, Y)
[nRow,nCol]=size(X);
xVals = zeros(nCol+1);
yVals = zeros(nCol+1,1);
augX=[ones(nRow,1),X];
for i=1:nCol+1
  for j=1:nCol+1
    sumX=sum(augX(:,i).*augX(:,j));
    xVals(i,j)=sumX;
end
  sumY=sum(Y.*augX(:,i));
  yVals(i)=sumY;
end
coefficients = (xVals\yVals);