function rC = g_rC(in1)
%G_RC
%    RC = G_RC(IN1)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    05-May-2020 18:58:15

q1 = in1(1,:);
q2 = in1(2,:);
q3 = in1(3,:);
rC = [sin(q1).*(5.0./6.0)+sin(q2).*(1.0./2.0)+sin(q3).*(1.0./6.0);0.0;cos(q1).*(5.0./6.0)+cos(q2).*(1.0./2.0)+cos(q3).*(1.0./6.0)];
