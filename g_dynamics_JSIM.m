function out1 = g_dynamics_JSIM(in1)
%G_DYNAMICS_JSIM
%    OUT1 = G_DYNAMICS_JSIM(IN1)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    26-Apr-2020 21:12:27

q1 = in1(1,:);
q2 = in1(2,:);
q3 = in1(3,:);
t2 = q1-q2;
t3 = cos(t2);
t4 = t3.*(5.4e1./5.0);
t5 = q1-q3;
t6 = cos(t5);
t7 = t6.*(1.8e1./5.0);
t8 = q2-q3;
t9 = cos(t8);
t10 = t9.*(1.8e1./5.0);
out1 = reshape([8.6e1./5.0,t4,t7,t4,1.0e1,t10,t7,t10,1.4e1./5.0],[3,3]);