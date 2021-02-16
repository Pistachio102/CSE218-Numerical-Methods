x=-1:0.1:1;
y=x./((1-x).*(6./(2+x)).^0.5)-0.05;
figure
plot(x,y);
xlim([-1,1]);
ylim([-5,5]);
xlabel('Values of X');
ylabel('Values of f(x)');
hold on;