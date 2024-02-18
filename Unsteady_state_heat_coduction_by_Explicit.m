% Usteady_State_Heat Conduction
clear all
clc
%% geometry Information
L=input("Enter rod lenght cm = ");
L=L/100;     %convert to meter
N=input("No. nodes= ");
dl=L/(N-1)   % grid size
x=0:dl:L;    % grid range
dt=input('Time Step: ');     %time step
t_end=input('End time: ');   % maximum time to simulate
t=0:dt:t_end;  % time range

alpha= 0.005;    % diffusion coefficient


%% Initail and Boundary condtion
T_in=input('Initial temp = ');
Tcurrent=ones(1,N)*T_in;
Tb=input("Enter base temp= ");
Ttip=input("Enter tip temp= ");
% solution procedure
d = alpha*dt/dl^2  % Stability criteria parabolic eq
for j=2:length(t)   % for time loop
 T=Tcurrent;
 for k=1:N   % on space stepping
   if k==1
     T(k)=Tb;  % assign Tb to first node
   elseif k==N
     T(k)=Ttip; % assign Ttip to T last node
   else
     T(k)=T(k)+d*(T(k+1)-2*T(k)+T(k-1));
   end
 end
 Tcurrent=T;  % update value to Tcurrent
 time = j*dt;  % time update for plotting
 plot(x,Tcurrent); %plot T in each grid
 xlabel("Length of rod in [m]",'FontSize', 14);
 ylabel("Temperature in[^{o}C]",'FontSize',14);
 set(gca,'FontSize',16);
 str1 = sprintf('Value of d =%d', d);
 str2 = sprintf('Time value =%d', time);
 text(0.15, 150, str1,'FontSize',12);  %to show to text
 text(0.15, 130, str2, 'FontSize',12);
 shg          % To show update in realtime
 pause(0.01)

 end

