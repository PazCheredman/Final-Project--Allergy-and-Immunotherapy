function dy= ode_system(t,y)
global x m4 a v p m1 m2 c dose ; 
    dy(1)=-y(1)+a-y(1)*y(5)*(y(2)/(1+m2*y(3))+c)-p*y(1)*y(5)*(y(3)+c)-x*y(1)*y(5)*(y(4)+c);
dy(2)=-y(2)+(v*y(1)*y(5)/(1+m4*y(4)))*(y(2)/(1+m2*y(3))+c);
dy(3)=-y(3)+p*(v*y(1)*y(5)/(1+m4*y(4)))*((y(3)+c)/(1+((m1*y(2))/(1+m2*y(3)))));
dy(4)=-y(4)+x*v*y(1)*y(5)*(y(4)+c);
dy(5)=-y(5)*(y(2)+y(3)+y(4))+dose;
dy=dy';
end