intcon=[1:N 2*N+1:3*N 4*N+1:5*N 6*N+1:7*N 9*N+1:10*N];
% round
%a=32;
lb=[ones(N,1)*(-a); -(ones(N,1)*(2^(-lv-1)-2^(-m)));ones(N,1)*(-a); -(ones(N,1)*(2^(-lu-1)-2^(-m)));ones(N,1)*(-a); -(ones(N,1)*(2^(-lf-1)-2^(-m)));ones(N,1)*(-a); -(ones(N,1)*(2^(-l-1)-2^(-m)));ones(N,1)*(-a);ones(N,1)*(-a)];
ub=[ones(N,1)*(a-1);(ones(N,1)*(2^(-lv-1)));ones(N,1)*(a-1);(ones(N,1)*(2^(-lu-1)));ones(N,1)*(a-1);(ones(N,1)*(2^(-lf-1))) ;ones(N,1)*(a-1); (ones(N,1)*(2^(-l-1)));ones(N,1)*(a-1);ones(N,1)*(a-1)];

opts=optiset('maxnodes',10000000,'maxtime',2000,'display','final','solver','SCIP')
\
Opt = opti('f',f','eq',Aeq,Beq,'bounds',lb,ub,'xtype',intcon,'options',opts)

%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)   
%[x,fval,exitflag,info] = opti_glpk(f,[],[],Aeq,Beq,lb,ub,xtype)
r_p1_m_ILP=((x(1:N)*2^(-l))-x(N+1:2*N))/Gh;
k_v=x(1:N)
v_e=x(N+1:2*N)
k_u=x(2*N+1:3*N)
u_e=x(3*N+1:4*N)
k_f=x(4*N+1:5*N);
f_e=x(5*N+1:6*N);
k_y=x(6*N+1:7*N);
y_q=x(7*N+1:8*N);
y=x(8*N+1:9*N);
r=x(9*N+1:10*N);

r_p1_m_ILP=r*2^(-l)
r_p1=r_p1_m_ILP
