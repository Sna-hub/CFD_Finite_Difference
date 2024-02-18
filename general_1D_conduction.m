clc
close all
clear all10
%% Geometry Infomation
L = input('Rod Length in cm = '); % User input value
L=L/100;                          %convert length of rod in meter(10cm)
N=input('Number of Nodes =');     %no of node will be entered
dx = L/(N-1);                     % grid size
%% Initial condition
T=zeros(N,1);      %initialize boundcary condition
Tb =input('Base Temperature =');
disp('Enter 0 for insulated or 1 for dissipated tip')
tx =input('Enter= ');
if tx==0
T_tip=T(N-1,1);     % initial guess tip temperature
elseif tx==1
    T_tip =input('Enter Temp at Tip= ');
else
    disp('Wrong Input');
    stop;
end
%% solution
n=input('No.Iteration= ');  %Iteration to converge
for j=1:1:n
  T(1,1) =Tb;     %temp of fist node
  for i=2:1:N-1
      T(i,1)=(T(i+1,1)+T(i-1,1))/2;
  end
     if tx==0
       T_tip=T(N-1,1); % Assign T(N-1) to T_tip
       T(N,1)=T_tip; % Pass new T_tip value to T(N,1)
     else
       T(N,1)=T_tip;
     end
  plot(T);
  xlabel('Step');
  ylabel('Temperature');
  hold on;
end

