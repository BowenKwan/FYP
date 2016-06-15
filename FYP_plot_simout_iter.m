%figure
for i=10
simout=res(i);
k_y1=k_y_m(1:end,i);
y_q1=y_q_m(1:end,i);
y1=y_m(1:end,i);
%figure
%plot(f_d1(1:20)/8-f_e1(1:20))
%subplot(3,3,i)
plot_simout

%simout.Data(3:13,3)-simout.Data(3:13,5)
%k_y1/8-y_q1-y1
end
%legend('reference','manipulated input (29.3)','output (29.3)','ideal manipulated input (double)','ideal output (12.20)','error_h','error_l','ILP output','ideal model with additive error','manipulated input (ideal model additive error)','FontSize',16);
