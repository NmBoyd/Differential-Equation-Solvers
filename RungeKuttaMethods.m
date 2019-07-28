clc
clear all

%ODE y_prime = sqrt(x*y) in domain [1,2] with initial value y(x=1)=1/9
%apply 4th Order Runge-Kutta with n=10
%the analytical solution is y=(x^3)/9
 a = 1;
 b = 2;
 h = (b-a)/10;
 x = a:h:b;
 
 y_anal = (x.^3)/9; 
 y = zeros(1,length(x));
 y(1) = (1^3)/9;
 for i=1:length(x)-1
     k(1) = sqrt(x(i)*y(i));
     k(2) = sqrt((x(i)+(1/3)*h)*(y(i)+((1/3)*h*k(1))));
     k(3) = sqrt((x(i)+(2/3)*h)*(y(i)-((1/3)*h*k(1))+(h*k(2))));
     k(4) = sqrt((x(i)+h)*(y(i)+(h*k(1))-(h*k(2))+(h*k(3))));
     y(i+1) = y(i)+((h/8)*(k(1)+3*k(2)+3*k(3)+k(4)));
 end
 
 plot(x,y_anal,x,y,'x','linewidth',2);
 legend('Analytical','Runge-Kutta','location','north');