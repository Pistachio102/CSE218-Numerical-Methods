function [root, numOfiter] = Secant(func, xl, xu, es, maxIter)
%similar to false position method
  if( xl > xu)
    xl = xl + xu;
    xu = xl - xu;
    xl = xl - xu;
   
  end

   numOfiter = 0;
   ea = (1.1 * es + 0.1);
   xr0 = xl;

  while ( numOfiter < maxIter && ea > es)
  numOfiter = numOfiter + 1;
  xr = xu - ((func(xu)*(xl - xu))/(func(xl)-func(xu)));
  ea = abs((xr-xr0)/xr)*100;
  xr0=xr;
  xl=xu;
  xu=xr;
%ea = abs((xr-xr0)/xr)*100;
if(abs(xr-xu)<es)
root=xr;

end


  end
 root=xr;
 
   fprintf('\nSecant position method\n\n');
   fprintf('Estimated Root = %0.6f\n', root);
   fprintf('Function(Root) = %0.6f\n', func(root));
   fprintf('Approximate error = %0.6f\n', ea);
   fprintf('Number of iterations = %d\n', numOfiter);
   
end