intcon_fe=[1 3]
%on -f_hat+f_e+Ky_hat=0
Aeq_fe=[-2^(-l) 1 K*2^(-l)]
Beq_fe=0
x_f_e=[]
f_fe= [0 1 0];

lb_fe=[-a; -2^(-l-1)+2^(-m); -a]
ub_fe=[a-1; 2^(-l-1); a-1]
opts=optiset('maxnodes',2000000,'maxtime',5000,'display','iter')
%opts=optiset('maxnodes',10000000,'maxtime',5000,'display','final','solver','SCIP')


Opt = opti('f',f_fe','eq',Aeq_fe,Beq_fe,'bounds',lb_fe,ub_fe,'xtype',intcon_fe,'options',opts)

%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)
x_f_e=[x_f_e abs(x(2))]

f_fe=-f_fe
Opt = opti('f',f_fe','eq',Aeq_fe,Beq_fe,'bounds',lb_fe,ub_fe,'xtype',intcon_fe,'options',opts)

%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)
x_f_e=[x_f_e abs(x(2))]

f_e_max=max(x_f_e)