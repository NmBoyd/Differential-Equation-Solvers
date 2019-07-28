clc 
clear all

%solve: y_prime = x*y from [0,1]
%with initial condition y(x=0)=1
%simplify to (dy/y)=(x*dx) ==>> y=exp((x^2)/2)*C, where C = 1 

a = 0;
b =1;
n=10;
h = (b-a)/n;
x = a:h:b;

y_true = exp(x.^2/2);       %the actual curve equation

y_e = zeros(1,length(x));   %the y for Heuns method
y_h = zeros(1,length(x));   %the y for Eulers method

%define initial values
y_e(1) = 1;     
y_h(1) = 1;     

y_prime_avg =0;
for i=1:length(x)-1
    %(y_i+1 = y_i + h*f_i) EULERS METHOD
    y_e(i+1) = y_e(i) + h*(x(i)*y_e(i));  %f_i was hardcoded
    
    %HEUNS METHOD
    y_prime_avg = 0.5*((x(i)*y_h(i))+(x(i+1)*(y_h(i)+h*(x(i)*(y_h(i))))));  %a messy bunch of substitution
    y_h(i+1) = y_h(i)+h*y_prime_avg;
end

plot(x,y_true,x,y_e,'+',x,y_h,'x','linewidth',2);
legend('True Solution','Eulers Method','Heuns Method','location','north');
