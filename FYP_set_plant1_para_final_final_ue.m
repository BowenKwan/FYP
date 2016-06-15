intcon_ue=[1 2 4]
%on C*v_hat-u_hat+u_e-C*f_hat=0
Aeq_ue=[Beta*2^(-l) -2^(-l) 1 -Beta*2^(-l)]
Beq_ue=0
x_u_e=[]
f_ue= [0 0 1 0];

lb_ue=[-a;-a; -2^(-l-1)+2^(-m); -a]
ub_ue=[a-1;a-1; 2^(-l-1); a-1]
opts=optiset('maxnodes',2000000,'maxtime',5000,'display','iter')
%opts=optiset('maxnodes',10000000,'maxtime',5000,'display','final','solver','SCIP')


Opt = opti('f',f_ue','eq',Aeq_ue,Beq_ue,'bounds',lb_ue,ub_ue,'xtype',intcon_ue,'options',opts)

%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)
x_u_e=[x_u_e abs(x(3))]

f_ue=-f_ue
Opt = opti('f',f_ue','eq',Aeq_ue,Beq_ue,'bounds',lb_ue,ub_ue,'xtype',intcon_ue,'options',opts)

%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)
x_u_e=[x_u_e abs(x(3))]

u_e_max=max(x_u_e)