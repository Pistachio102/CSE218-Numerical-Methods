fprintf('Calculating the value of Cos(x) using taylor series.\n');
value1=input('Enter the value of x : \n');
n1=input('Enter the number of terms : \n');
answer=CosFunc(value1,n1)


%Plotting

range=[-2*pi : 0.2 : 2*pi , 2*pi];
bCos=cos(range);
n1=CosFunc(range,1);
n2=CosFunc(range,3);
n3=CosFunc(range,5);
n4=CosFunc(range,20);


fprintf('\nPlotting Cosine Graph\n');
figure
plot(range,bCos,'-xr',range,n1,'-.*y',range,n2,'--go',range,n3,'-.cd',range,n4,':bs');
legend('cos(x) (library)','cos(x) (nTerm-01)','cos(x) (nTerm-03)','cos(x) (nTerm-05)','cos(x) (nTerm-20)');
title(' Graph of Cos(x)');
xlabel('-2\pi \leq x \leq 2\pi');
ylabel('Cos(x)');




fprintf('\nPlotting Relative Error\n');
testVal = zeros(50);
relError = zeros(49);
for n = 1:50
    testVal(n) = CosFunc(1.5,n);
    if( n ~= 1)
        relError(n-1) = abs((testVal(n)-testVal(n-1))/testVal(n))*100;
    end
end
figure
plot(relError);
title('Approximate Relative Error');
xlabel('Iterations');
ylabel('Relative Error');
