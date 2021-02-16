shampoo = csvread('shampoo.csv',1,0);

givenRows = shampoo(:,2)~=0;
givenShampoo = shampoo(givenRows,:);
missingRows = shampoo(:,2)==0;
missingShampoo = shampoo(missingRows,:);

smp_x = givenShampoo(:,1);
smp_y = givenShampoo(:,2);
scatter(smp_x,smp_y,40,'b','filled');
title('Shampoo Data');
xlabel('time');
ylabel('shampoo sold');

smp_plt_x = 1 : .2 : 36;
smp_plt_y = zeros(size(smp_plt_x));

for i = 1 : length(missingShampoo)
    missingShampoo(i,2) = NewtonInterpolation(givenShampoo(:,1),givenShampoo(:,2),missingShampoo(i,1));
end

for i = 1 : length(smp_plt_x)
    smp_plt_y(i) = NewtonInterpolation(givenShampoo(:,1),givenShampoo(:,2),smp_plt_x(i));
end
figure
plot(smp_plt_x,smp_plt_y);
title('Shampoo : Newton Interpolation');
xlabel('time');
ylabel('shampoo sold');
hold on
scatter(missingShampoo(:,1),missingShampoo(:,2),40,'g','filled');


for i = 1 : length(missingShampoo)
    missingShampoo(i,2) = LagrangeInterpolation(givenShampoo(:,1),givenShampoo(:,2),missingShampoo(i,1));
end

for i = 1 : length(smp_plt_x)
    smp_plt_y(i) = LagrangeInterpolation(givenShampoo(:,1),givenShampoo(:,2),smp_plt_x(i));
end
figure
plot(smp_plt_x,smp_plt_y);
title('Shampoo : Lagrange Interpolation');
xlabel('time');
ylabel('shampoo sold');
hold on
scatter(missingShampoo(:,1),missingShampoo(:,2),40,'g','filled');

LinearSpline(givenShampoo(:,1),givenShampoo(:,2),missingShampoo(:,1));

QuadraticSpline(givenShampoo(:,1),givenShampoo(:,2),missingShampoo(:,1));