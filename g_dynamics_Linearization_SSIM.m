function out1 = g_dynamics_Linearization_SSIM(in1)
%G_DYNAMICS_LINEARIZATION_SSIM
%    OUT1 = G_DYNAMICS_LINEARIZATION_SSIM(IN1)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    05-May-2020 18:58:12

s1 = in1(1,:);
s2 = in1(2,:);
s3 = in1(3,:);
s4 = in1(4,:);
s5 = in1(5,:);
s6 = in1(6,:);
t2 = s1-s2;
t3 = s1-s3;
t4 = sin(t2);
t5 = s4-s5;
t6 = cos(t2);
t7 = t6.*(3.0./2.0);
t8 = s2-s3;
t9 = sin(t3);
t10 = s4-s6;
t11 = sin(t8);
t12 = s5-s6;
t13 = cos(t3);
t14 = t13.*(1.0./2.0);
t15 = cos(t8);
t16 = t15.*(1.0./2.0);
out1 = reshape([1.0,0.0,0.0,0.0,t4.*t5.*(-3.0./2.0),t9.*t10.*(-1.0./2.0),0.0,1.0,0.0,t4.*t5.*(-3.0./2.0),0.0,t11.*t12.*(-1.0./2.0),0.0,0.0,1.0,t9.*t10.*(-1.0./2.0),t11.*t12.*(-1.0./2.0),0.0,0.0,0.0,0.0,1.3e1./4.0,t7,t14,0.0,0.0,0.0,t7,9.0./4.0,t16,0.0,0.0,0.0,t14,t16,5.0./4.0],[6,6]);
