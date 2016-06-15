intcon=[1:N 2*N+1:3*N 4*N+1:5*N 6*N+1:7*N 9*N+1:10*N];
%intcon=[2*N+1:3*N];

% xtypeI=[]
% xtypeC=[]
% 
% xtypeI = [repmat('I',1,N)]
% xtypeC = [repmat('C',1,N)]
% xtype=[xtypeI xtypeC xtypeI xtypeC xtypeI xtypeC xtypeC xtypeI];
%Aeq=[p_m*2^(-l) zeros(N,N) -(u_m-a_m/Beta) -p_m zeros(N,N); u_m*Beta*(2^(-l)) zeros(N) u_m (a_m-u_m*Beta) -a_m*2^(-l)];
%Beq= [a_m*e; zeros(N,1)]
%%
% 3 error

% round
%lb=[ones(N,1)*(-Inf); -(ones(N,1)*(2^(-lv)-2^(-m)));ones(N,1)*(-Inf); -(ones(N,1)*(2^(-lu)-2^(-m)));ones(N,1)*(-Inf); -(ones(N,1)*(2^(-lf)-2^(-m)));ones(N,1)*(-Inf)];
%lb=lb/2;
%ub=[ones(N,1)*(Inf);(ones(N,1)*(2^(-lv)));ones(N,1)*(Inf);(ones(N,1)*(2^(-lu)));ones(N,1)*(Inf);(ones(N,1)*(2^(-lf))) ;ones(N,1)*(Inf)];
%ub=[ones(N,1)*(Inf); 0; (ones(N-1,1)*(2^(-l)-2^(-m)));0; (ones(N-1,1)*(2^(-l)-2^(-m)));ones(N,1)*(Inf);0; (ones(N-1,1)*(2^(-l)-2^(-m))) ;ones(N,1)*(Inf);ones(N,1)*(Inf) ];

% %force u_e max
% ub=[ones(N,1)*(Inf); 0; (ones(N-1,1)*(2^(-l)-2^(-m)));0; -(ones(N-1,1)*(2^(-l)-2^(-m)));0; (ones(N-1,1)*(2^(-l)-2^(-m))) ;ones(N,1)*(Inf) ];
% 
%ub=ub/2;
% lb=[ones(N,1)*(-100);0; -(ones(N-1,1)*(2^(-l)-2^(-m)));0; -(ones(N-1,1)*(2^(-l)-2^(-m)));ones(N,1)*(-100);0; -(ones(N-1,1)*(2^(-l)-2^(-m)));ones(N,1)*(-100);ones(N,1)*(-100);];
% ub=[ones(N,1)*(100); zeros(N,1); zeros(N,1); ones(N,1)*(100); zeros(N,1);ones(N,1)*(100);ones(N,1)*(100);];
% %ub=[ones(N,1)*(Inf); zeros(1*N,1);0; -(ones(N-1,1)*(2^(-l)-2^(-m))); ones(N,1)*(Inf);  zeros(1*N,1); ones(N,1)*(Inf); ones(N,1)*(Inf)];

%a=32;
lb=[ones(N,1)*(-a); -(ones(N,1)*(2^(-lv-1)-2^(-m)));ones(N,1)*(-a); -(ones(N,1)*(2^(-lu-1)-2^(-m)));ones(N,1)*(-a); -(ones(N,1)*(2^(-lf-1)-2^(-m)));ones(N,1)*(-a); -(ones(N,1)*(2^(-l-1)-2^(-m)));ones(N,1)*(-a);ones(N,1)*(-a)];
ub=[ones(N,1)*(a-1);(ones(N,1)*(2^(-lv-1)));ones(N,1)*(a-1);(ones(N,1)*(2^(-lu-1)));ones(N,1)*(a-1);(ones(N,1)*(2^(-lf-1))) ;ones(N,1)*(a-1); (ones(N,1)*(2^(-l-1)));ones(N,1)*(a-1);ones(N,1)*(a-1)];

% 1 error
%a=32;
%lb=[ones(N,1)*(-a); -(zeros(N,1)*(2^(-lv-1)-2^(-m)));ones(N,1)*(-a); -(ones(N,1)*(2^(-lu-1)-2^(-m)));ones(N,1)*(-a); -(zeros(N,1)*(2^(-lf-1)-2^(-m)));ones(N,1)*(-a); -(zeros(N,1)*(2^(-l-1)-2^(-m)));ones(N,1)*(-a);ones(N,1)*(-a)];
%a=a-1
%ub=[ones(N,1)*(a);(zeros(N,1)*(2^(-lv-1)));ones(N,1)*(a);(ones(N,1)*(2^(-lu-1)));ones(N,1)*(a);(zeros(N,1)*(2^(-lf-1))) ;ones(N,1)*(a); (zeros(N,1)*(2^(-l-1)));ones(N,1)*(a);ones(N,1)*(a)];

%%
% N=1
% intcon=[1:N]
% Aeq=[2^(-l)*eye(N) -eye(N)]
% Beq=Gh*r_p1_m(4)
% f=[zeros(1,N) ones(1,N)]
% 
% lb=[ones(N,1)*(-Inf);  -(ones(N,1)*(2^(-l)-2^(-m)))];
% ub=[ones(N,1)*(Inf); zeros(N,1)];
%f=[zeros(1,0) 1 zeros(1,N-1)]*[zeros(N,4*N) 2^(-l)*eye(N,N)/K -eye(N)/K -2^(-l)*eye(N)];
%opts=optiset('maxnodes',300000,'maxtime',2000,'display','iter','solver','LP_SOLVE')
%opts=optiset('maxnodes',2000000,'maxtime',5000,'display','iter')
opts=optiset('maxnodes',10000000,'maxtime',2000,'display','final','solver','SCIP')

%opts=optiset('maxnodes',100000000,'maxtime',20000,'display','final','solver','SCIP')

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

r_p1_ILP=[0; r_p1_m_ILP; ones(1000,1)*r_p1_m_ILP(end)];
v_e1=[0 ;v_e; ones(1000,1)*v_e(end)];
u_e1=[0 ;u_e; ones(1000,1)*u_e(end)];
k_f1=[0 ;k_f; ones(1000,1)*k_f(end)];
k_y1=[0 ;k_y; ones(1000,1)*k_y(end)];
y_q1=[0 ;y_q; ones(1000,1)*y_q(end)];
f_e1=[0 ;f_e; ones(1000,1)*f_e(end)];
y1=[0 ;y; ones(1000,1)*y(end)];

%  u_e1=[0; u_e1]
%  v_e1=[0; v_e1]

% r_p1_ILP=[r_p1_m_ILP; ones(1000,1)*r_p1_m_ILP(end)];
% v_e1=[v_e; ones(1000,1)*v_e(end)];
% u_e1=[u_e; ones(1000,1)*u_e(end)];
% k_f1=[k_f; ones(1000,1)*k_f(end)];
% f_e1=[f_e; ones(1000,1)*f_e(end)];
% e_tilta1=[e_tilta; ones(1000,1)*e_tilta(end)];
r_p1=r_p1_ILP;
k_v_u_3r=k_v;
v_e_u_3r=v_e;
he1