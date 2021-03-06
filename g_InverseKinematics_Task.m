function Task = g_InverseKinematics_Task(in1)
%G_INVERSEKINEMATICS_TASK
%    TASK = G_INVERSEKINEMATICS_TASK(IN1)

%    This function was generated by the Symbolic Math Toolbox version 8.4.
%    17-Jun-2020 16:53:23

q1 = in1(1,:);
q2 = in1(2,:);
q3 = in1(3,:);
Task = [sin(q1)+sin(q2)+sin(q3);cos(q1)+cos(q2)+cos(q3);q3];
