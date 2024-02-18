g=9.8;d=2;th=pi/3; %Input data
Dc = d/2*(1-cos(th));
Qnum = (2^(3/2)*Dc^(5/2)*sqrt(g)*(th-0.5*sin(2*th))^(3/2));
Qden = 8*sqrt(sin(th))*(1-cos(th))^(5/2);
Q = Qnum/Qden; %m^3/s
%%%% Variable Precision Arithmetic%%
% vpa(expression,n)
% n is number of precision u yg jg ban
% Example y = 32!-e^100
y = vpa(factorial(32)-exp(100),50);
%% Differentiation and Integration
%  diff(f,x,n)
syms b t;
dt =diff(b*cos(b*t),t,1); % first derivative of bcos(bt)
db = diff(b*cos(b*t),b,1);
%% Plotting Data on graph by using various methods
%% plot = basic plot command
%% xlable and ylable
%%Example 
 t = 0:1:100;
 y1 =  sin(t).*t;  % elementwiswe multiplication 
 y2 = cos(t).*t ;  %.* is element wise multiplication
 plot(t,y1,'+',t,y2,'-');
 hold on 
 plot(t,y1+y2);
 hold off
 