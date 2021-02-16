function [root,n_iter] =fp(func,xl,xh,es,max)
while(func(xl)*func(xh)>0)
xl=input('Lower limit: ');
xh = input('Higher limit: ');
end;
if(xl>xh)
    fprintf("blabla")
temp = xh;
xh = xl;
xl =temp;
end;

n_iter = 0;
xro = xl;
ea =1.1*es;

while(n_iter < max && ea > es)
n_iter = n_iter + 1;
xr = xh -((func(xh)*(xl-xh))/(func(xl)-func(xh)));
if(func(xl) * func(xr) < 0)
xh = xr;
ea = abs((xr-xro)/xr)*100;
xro = xr;
elseif (func(xl)*func(xr) > 0 )
xl =xr;
ea = abs((xr-xro)/xr)*100;
xro = xr;
else
    fprintf("blablalbla")
ea = 0;
root = xr;
break;
end;

end;

root = xr;
fprintf('\nFalse position Method:%0.5f \n',root);
fprintf('Ea: %0.3f\n',ea);
fprintf('Number of iteration: %d\n',n_iter);

end
