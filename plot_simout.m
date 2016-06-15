figure
hold on
title('4 Error Model Output')
% title('discrete p1P1_1 performance (1 Error, floor, alpha<0)')

xlabel('time(s)')
ylabel('output')
% set(gca,'FontSize',20)
%  axis([0 0.4 0 4])
axis([0 0.15 -0.5 1.5])
%reference
 plot(simout.Time,simout.Data(:,1),'k')
% %controlled input
% plot(simout.Time,simout.Data(:,2),'color',[0.6 0 0.7])
% %system output
 plot(simout.Time,simout.Data(:,3),'b')
% %ideal controlled input
% plot(simout.Time,simout.Data(:,4),'color',[0.5 0.3 0.1])
% %ideal system output
 plot(simout.Time,simout.Data(:,5),'color',[0 0.7 0])
% %error upper bound
 plot(simout.Time,simout.Data(:,6),'r-.')
% %error lower bound
 plot(simout.Time,simout.Data(:,7),'r-.')
% %error upper bound
 plot(simout.Time,simout.Data(:,24),'-.','color',[0.6 0 0.7])
% %error lower bound
 plot(simout.Time,simout.Data(:,25),'-.','color',[0.6 0 0.7])
 %error upper-out
%plot(simout.Time,simout.Data(:,8))
%error lower-out
%plot(simout.Time,simout.Data(:,9))
% ref-out 
%  plot(simout.Time,simout.Data(:,10),'b-.')
% ideal ref-out
%  plot(simout.Time,simout.Data(:,11),'k-.')
%error
% plot(simout.Time,simout.Data(:,12),'r-.')
% plot(d_p1P1_fix_6_3.Time,d_p1P1_fix_6_3.Data(:,6)-d_p1P1_fix_6_3.Data(:,7),'r-.')

%ILP output
%  plot(simout.Time(1:length(k_y1)+2),[0;0;k_y1*(2^(-l))-y_q1],'r*-.')
%  plot(simout.Time(1:length(y1)+2),[0;0;y1],'b*-.')
% plot(simout.Time,[0; k_y1(1:length(simout.Time)-1)*(2^(-l))-y_q1(1:length(simout.Time)-1)],'r*-.')
% plot(simout.Time,[0;y1(1:length(simout.Time)-1)],'b*-.')

%additive error check
%plot(simout.Time,simout.Data(:,15),'m-.')

%manipulated input ideal model with additive error
%plot(simout.Time,simout.Data(:,18),'color',[0.7 0.7 0.3])

% plot(d_p1P1_1_fix_6_3.Time,d_p1P1_1_fix_6_3.Data(:,5)+ Eb1(1:103,1),'LineStyle','-.','color',[0.6 0 0.7]);
% plot(d_p1P1_1_fix_6_3.Time,d_p1P1_1_fix_6_3.Data(:,5)- Eb1(1:103,1),'LineStyle','-.','color',[0.6 0 0.7]);

% plot(simout.Time,ones(1,length(simout.Time))*simout.Data(end,6)*1.05,'r-.')
% plot(simout.Time,ones(1,length(simout.Time))*simout.Data(end,7)*.95,'r-.')


% legend('reference','output (6.3)','ideal output (double)');
% legend('output (6.3)','error_h','error_l','error_h-output','output-error_l');
% legend('output (6.3)','ideal output (double)','error bound_h_1','error bound_l_1','error bound_h_2','error bound_l_2');
% legend('reference','output (32.20)','error_h','error_l','ref_o_u_t','ideal ref_o_u_t');%
% legend('reference','manipulated input (29.3)','output (29.3)','ideal manipulated input (double)','ideal output (12.20)','error_h','error_l','ILP output','ideal model with additive error','manipulated input (ideal model additive error)','FontSize',16);


