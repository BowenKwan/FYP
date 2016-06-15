FYP_MILP_para_setup
res=[]
exitflag_iter=[]
k_v_m=[]
v_e_m=[]
k_u_m=[]
u_e_m=[]
k_f_m=[]
f_e_m=[]
k_y_m=[]
y_q_m=[]
r_p1_m_M=[]
y_m=[]
f_m=[]
r_m=[]
error_m=[]
tic
for j=1:10
%min output diff (y_tilta-y)
%f=[zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,6*N) 2^(-l)*eye(N) -eye(N) -eye(N) zeros(N,N)];
%max output diff (y_tilta-y)
f=-[zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,6*N) 2^(-l)*eye(N,N) -eye(N) -eye(N) zeros(N,N)];
%f=-[zeros(1,N-1) 1 zeros(1,N-N)]*[zeros(N,6*N) 2^(-l)*eye(N,N) -eye(N) -eye(N) zeros(N,N)];

%min error sum
%f=[zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,N) eye(N,N) zeros(N,N) eye(N,N)/Beta zeros(N,N) -eye(N,N) zeros(N,N) -K*eye(N,N)zeros(N,N) zeros(N,N)];
%max error sum
%f=-[zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,N) eye(N,N) zeros(N,N) eye(N,N)/Beta zeros(N,N) -eye(N,N) zeros(N,N) -K*eye(N,N) zeros(N,N) zeros(N,N)];

FYP_stage1_plant1_4error_round;
exitflag_iter=[exitflag_iter exitflag]
SimOut = sim('discrete_p1P_4error_round_additive', 'ReturnWorkspaceOutputs', 'on');
simout=SimOut.get('simout');
res=[res simout];
r_p1_m_M=[r_p1_m_M r_p1];
k_v_m=[k_v_m k_v];
v_e_m=[v_e_m v_e];
k_u_m=[k_u_m k_u];
u_e_m=[u_e_m u_e];
k_f_m=[k_f_m k_f];
f_e_m=[f_e_m f_e];
k_y_m=[k_y_m k_y];
y_q_m=[y_q_m y_q];
y_m=[y_m y];
r_m=[r_m r];
f_m=[f_m fval]
end
t=toc
