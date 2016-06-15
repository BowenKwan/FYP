intcon_ve=[1 3]
%on v_hat-v_e-Ghr=0
Aeq_ve=[2^(-l) -1 -2^(-l)*Gh]
Beq_ve=0
x_v_e=[];
f_ve= [0 1 0];

lb_ve=[-a; -2^(-l-1)+2^(-m); -a]
ub_ve=[a-1; 2^(-l-1); a-1]
opts=optiset('maxnodes',2000000,'maxtime',5000,'display','iter')
%opts=optiset('maxnodes',10000000,'maxtime',5000,'display','final','solver','SCIP')

Opt = opti('f',f_ve','eq',Aeq_ve,Beq_ve,'bounds',lb_ve,ub_ve,'xtype',intcon_ve,'options',opts)

%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)
x_v_e=[x_v_e abs(x(2))]

f_ve=-f_ve
Opt = opti('f',f_ve','eq',Aeq_ve,Beq_ve,'bounds',lb_ve,ub_ve,'xtype',intcon_ve,'options',opts)

%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)
x_v_e=[x_v_e abs(x(2))]

v_e_max=max(x_v_e)