
function [] = LinearSpline(x, y, xx)
n = length(x);

figure
for i = 1 : n-1 
    LinEqn = @(input) y(i) + (y(i+1)-y(i))/(x(i+1)-x(i))*(input-x(i));
    fplot(LinEqn,[x(i),x(i+1)]);
    hold on
end

title('Shampoo : Linear Spline Interpolation');
xlabel('time');
ylabel('shampoo sold');
hold on

for j = 1 : numel(xx)
   for i = 1 : n-1 
        if xx(j) >= x(i) && xx(j) <= x(i+1)
            LinEqn = @(input) y(i) + (y(i+1)-y(i))/(x(i+1)-x(i))*(input-x(i));
            scatter(xx(j),LinEqn(xx(j)),40,'g','filled');
            hold on
        end
    end 
end