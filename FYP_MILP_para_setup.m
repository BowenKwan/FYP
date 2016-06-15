%% Plant 

A=2
p=0.5

%% Controller
Beta=0.2
C=Beta
K=1

%% Simulation parameter
N=10
Ts=0.01
r=zeros(1/Ts,1)
tail=N
%% constraint
% fix u
% variable
% k_v v_e k_u u_e k_f f_e y_hat y_q y r 
h=[];
for i=1:N
    h(i)=[A*p^(i-2)];
end
h(1)=0;
conv_h_m=[];
for i=1:N
    conv_h_m(i,:)=[ h(i:-1:1) zeros(1,N-i)];
    %conv_h_m(i,:)=[ zeros(1,N-i) h(1:i) ];
end


%on C*v_hat-u_hat+u_e-C*f_hat=0
Aeq1=[Beta*2^(-l)*eye(N,N) zeros(N,N) -2^(-l)*eye(N,N) eye(N,N) -Beta*2^(-l)*eye(N) zeros(N,5*N)];
Beq1=zeros(N,1);

%on -f_hat+f_e+Ky_hat=0
Aeq2=[zeros(N,4*N) -2^(-l)*eye(N,N) eye(N,N) K*2^(-l)*eye(N,N) zeros(N,3*N)];
Beq2=zeros(N,1);

%on GhCPr-(I+CPK)y=0
Aeq3=[zeros(N,8*N) -eye(N,N)-Beta*K*conv_h_m 2^(-l)*Gh*Beta*conv_h_m*eye(N,N)];
Beq3=zeros(N,1);

%on v_hat-v_e-Ghr=0
Aeq4=[2^(-l)*eye(N,N) -eye(N,N) zeros(N,7*N) -2^(-l)*Gh*eye(N,N)];
Beq4=zeros(N,1);

%on Pu_hat-y_hat+y_q=0
Aeq5=[zeros(N,2*N) 2^(-l)*conv_h_m*eye(N,N) zeros(N,3*N) -2^(-l)*eye(N,N) eye(N,N) zeros(N,2*N)];
Beq5=zeros(N,1);
%%
Aeq=[Aeq1;Aeq2;Aeq3;Aeq4;Aeq5];
Beq=[Beq1;Beq2;Beq3;Beq4;Beq5];
%Aeq=[Aeq5];
%Beq=[Beq5];
%% objective function
%f= [0 1]*[zeros(N,7*N) eye(N,N) zeros(N,2*N)];
%f= [0 0 1 zeros(1,N-3)]*[zeros(N,4*N) 2^(-l)*eye(N,N)/K -eye(N)/K zeros(N,2*N) -eye(N) zeros(N,N)];
%f=[zeros(1,10-1) 1 zeros(1,N-10)]*[zeros(N,6*N) 2^(-l)*eye(N) -eye(N) -eye(N) zeros(N,N)];
f=ones(1,N)*[zeros(N,6*N) 2^(-l)*eye(N) -eye(N) -eye(N) zeros(N,N)];
%% Update max attainable error

FYP_update_max_attainable_error
L1=he1*(2^(-l-1))*(1/Beta+2+K);
Tighten=he1*(u_e_max/Beta+f_e_max+v_e_max+K*y_q_max);
