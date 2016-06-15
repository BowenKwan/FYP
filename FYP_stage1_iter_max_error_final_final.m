FYP_set_plant1_para_final_final
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
% Beta=-0.05+j*0.1
% C=Beta
% K=1
% FYP_set_plant1_para_final_final
% error=[v_e_max;
% u_e_max;
% f_e_max;
% y_q_max;
% he1*(2^(-l-1))*(1/Beta+2+K); 
% he1*(u_e_max/Beta+f_e_max+v_e_max+K*y_q_max)];
% error_m=[error_m error]


%FYP_set_plant1_para_final_final_fixY
%FYP_set_plant1_para_final_final_individual_component
%min output diff (y_tilta-y)
%f=[zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,6*N) 2^(-l)*eye(N) -eye(N) -eye(N) zeros(N,N)];
%max output diff (y_tilta-y)
f=-[zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,6*N) 2^(-l)*eye(N,N) -eye(N) -eye(N) zeros(N,N)];
%f=-[zeros(1,N-1) 1 zeros(1,N-N)]*[zeros(N,6*N) 2^(-l)*eye(N,N) -eye(N) -eye(N) zeros(N,N)];

%min error sum
%f=[zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,N) eye(N,N) zeros(N,N) eye(N,N)/Beta zeros(N,N) -eye(N,N) zeros(N,N) -K*eye(N,N)zeros(N,N) zeros(N,N)];
%max error sum
%f=-[zeros(1,j-1) 1 zeros(1,N-j)]*[zeros(N,N) eye(N,N) zeros(N,N) eye(N,N)/Beta zeros(N,N) -eye(N,N) zeros(N,N) -K*eye(N,N) zeros(N,N) zeros(N,N)];

FYP_stage1_plant1_3error_round_final_final;
exitflag_iter=[exitflag_iter exitflag]
SimOut = sim('discrete_p1P_3error_round_additive', 'ReturnWorkspaceOutputs', 'on');
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
% k_v=res(1:N,:)
% v_e=res(N+1:2*N,:)
% k_u=res(2*N+1:3*N,:)
% u_e=res(3*N+1:4*N,:)
% k_f=res(4*N+1:5*N,:);
% f_e=res(5*N+1:6*N,:);
% e_tilta=res(6*N+1:7*N,:);
% f_dash=res(7*N+1:8*N,:);

