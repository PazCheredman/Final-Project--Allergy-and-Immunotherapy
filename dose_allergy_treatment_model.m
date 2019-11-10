
clear all
clc
global x m4 a v p m1 m2 c dose special_Dose;       
x=0.8; m4=0.25; a=10; v=8; p=1.02; m1=0.2; 
m2=0.1; c=1e-4;dose=10; special_Dose=1.6;

%% time scaling
t0=0; tf=23; % number of hours a day
step=1; % sample the results once in an hour
tspan=t0:step:tf;
Days=30; % total amount of days
% global N T1 T2 Tr A  %********

%% solution of equations
%options = odeset('RelTol',1e-5,'AbsTol',[1e-5 1e-5 1e-5 1e-5 1e-5 1e-5 1e-5 1e-5 1e-5]);%,'NonNegative',[1:9]);
%ys=[0.01 0.003];
yy1=[a 0.002 0.01 0.003 500000]; % starter guess
t1=[];
y1=[];
for i=1:Days % number of days we want to look at
     %if(i<30)
        k=mod(i,2);
        if(k==0)
        special_Dose=special_Dose+(0.5);
        dose=special_Dose;
        else
        dose=0;
        end
        if(i>365)
            special_Dose=1.6;
            dose=special_Dose;
        end
%         if(i==28 || i==56 || i==84 || i==112 || i==140 || i==168 || i==196 || i==224 || i==252 || i==280 || i==308 || i==336)
%             special_Dose=special_Dose+150;
%             dose=special_Dose;
%         end
     %end
%      if(i>=30 && i<60)
%         k=mod(i,5);
%         if(k==0)
%         special_Dose=special_Dose+(50);
%         dose=special_Dose;
%         else
%         dose=0;
%         end
%      end 
%      if(i>=60)
%         k=mod(i,7);
%         if(k==0)
%         special_Dose=special_Dose+(100);
%         dose=special_Dose;
%         else
%         dose=0;
%         end
%      end
    
    y0=yy1(end,:);% starting condition for the solutions
    [tt1,yy1]=ode45(@ode_system,tspan,y0);
    y1=[y1;yy1]; % creating a constant solution
    t1=[t1,length(tspan)*(i-1)+1:length(tspan)*i];

end
% 
%% plotting
figure(1)
plot(t1',y1(:,2:4));
grid on
legend('T1','T2','Tr');
xlabel('time (months)');
ylabel('concentration');
%xticklabels([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30])
% TicksLength=24;
%stairs(t1, y1,'LineWidth',1)
set(gca, 'YScale', 'log')
% figure(2)
% subplot(2,1,1)
% x=linspcae(0,800);
% set(gca, 'YScale', 'log')
% plot(x,y1(:,2))
% subplot(2,1,2)
% x=linspcae(0,800);
% set(gca, 'YScale', 'log')
% plot(x,y1(:,3))
% subplot(2,1,3)
% x=linspcae(0,800);
% set(gca, 'YScale', 'log')
% plot(x,y1(:,4))
% 
% 
% figure(2)
% plot(y1(:,3)./y1(:,4))
% title('The ratio T2/Tr')
% xlabel('time (months)');
% ylabel('concentration');