intcon_yq=[1:2*N]
%on Pu_hat-y_hat+y_q=0
Aeq_yq=[2^(-l)*conv_h_m*eye(N,N) -2^(-l)*eye(N,N) eye(N,N)]
Beq_yq=zeros(N,1)

lb_yq=[-a*ones(N,1); -a*ones(N,1);-2^(-l-1)*ones(N,1)]
ub_yq=[(a-1)*ones(N,1); (a-1)*ones(N,1);2^(-l-1)*ones(N,1)]
opts=optiset('maxnodes',2000000,'maxtime',5000,'display','off')
%opts=optiset('maxnodes',10000000,'maxtime',5000,'display','final','solver','SCIP')
x_y_q=[]
fval_yq=[]
j=1
finish=0
while (finish~=1) && (j<=N)
f_yq= [zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,2*N) eye(N,N)];
Opt = opti('f',f_yq','eq',Aeq_yq,Beq_yq,'bounds',lb_yq,ub_yq,'xtype',intcon_yq,'options',opts)

%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)
x_y_q=[x_y_q x]
fval_yq=[fval_yq fval]
    if abs(fval)==2^(-l-1)
        finish=1
    end
j=j+1
end
f_yq=-f_yq
j=1
while (finish==0)&&(j<=N)
f_yq= [zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,2*N) eye(N,N)];
Opt = opti('f',f_yq','eq',Aeq_yq,Beq_yq,'bounds',lb_yq,ub_yq,'xtype',intcon_yq,'options',opts)

%Call solve to solve the problem
[x,fval,exitflag,info] = solve(Opt)
x_y_q=[x_y_q x]
fval_yq=[fval_yq fval]
    if abs(fval)==2^(-l-1)
        finish=1
    end
j=j+1
end
y_q_max=max(abs(fval_yq))
