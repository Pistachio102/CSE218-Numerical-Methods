train = csvread('train.csv',1,0);
test = csvread('test.csv',1,0);

replaceVal = mean(train(:,4));
train(train(:,4)==0,4) = replaceVal;

x = train(:,1:6);
y = train(:,7);
coefficients = multiLinearRegression(x,y);

fprintf(" y = (%.2f) + (%.2f) x1 + (%.2f) x2 + (%.2f) x3 + (%.2f) x4 + (%.2f) x5 + (%.2f) x6 \n",coefficients(1),coefficients(2),coefficients(3),coefficients(4),coefficients(5),coefficients(6),coefficients(7));

y_train_prime = [ones(size(train,1),1),train(:,1:6)] * coefficients;
y_test_prime = [ones(size(test,1),1),test(:,1:6)] * coefficients;

rms_trn = sqrt(mean((train(:,7) - y_train_prime).^2));
rms_tst = sqrt(mean((test(:,7) - y_test_prime).^2));

figure
scatter(train(:,1),train(:,2),train(:,5).*0.03,train(:,7),'filled');
title('Graph of Train data');
cbar = colorbar;
cbar.Label.String = 'Mean Household Value';
xlabel('longitude');
ylabel('latitude');
colormap('jet');

figure
scatter(test(:,1),test(:,2),test(:,5).*0.03,test(:,7),'filled');
title('Graph of Test data');
cbar = colorbar;
cbar.Label.String = 'Mean Household Value';
xlabel('longitude');
ylabel('latitude');
colormap('jet');

disp(['Train RMSE = ', num2str(rms_trn)])
disp(['Test  RMSE = ', num2str(rms_tst)])