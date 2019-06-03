clear all;
close all;
% load('R_EV');

k = 1;
t = 4;
for class = (t*3-2):t*3   %%%%%%%%%%%%%%%%%%%  4   :  45
    %  读取mat数据
    disp(['Class= ', int2str(class)]);   % 输出所读取的动作序号
    filename = getdata_mat_RMS(class); 
    load(filename);  % 导入数据
    EMG_RMS = RMSData';     % 转置，得到行数为通道个数的矩阵
    %***********************************
    filename = getdata_voice_VF_Median(class); 
    load(filename);  % 导入数据
    Voice_f_Median = N_median';
    for channel = 1:120
        corr_EV = [EMG_RMS(:,channel),Voice_f_Median];
        r_EV{channel} = corrcoef(corr_EV);
        R_EV(channel) = min(min(r_EV{channel}));
    end
    R_EV_t(k,:)= R_EV;
    k = k+1;
    %**********************
    %****************************
%     figure();
%     plot(R_EV,'ro','MarkerFaceColor','r') % %     plot(x1,R_EV,'rs','MarkerFaceColor','r')
%     axis([0,7,0.5,1.2])
end

 figure;
 x1 = unifrnd(1,2,1,120);
 y1 = R_EV_t(1,:);
 plot(x1,y1,'ro');
 axis([0,7,0.5,1.2]) 
 M_y1 = mean(y1);
 SD_y1 = std(y1);
 min_y1 = min(y1);
 max_y1 = max(y1);
 hold on;
 %********
 t = 1:2;
 y11 = ones(length(t))*M_y1;
 plot(t,y11,'k-');
 hold on;
 errorbar(1.5,M_y1,SD_y1,'k');
 %%
 %****************************
 hold on;
 x2 = unifrnd(3.5,4.5,1,120);
 y2 = R_EV_t(2,:);
 plot(x2,y2,'bo');  %g
 axis([0,7,0.5,1.2])  
 M_y2 = mean(y2);
 SD_y2 = std(y2);
 min_y2 = min(y2);
 max_y2 = max(y2);
 %********
 t = 3.5:4.5;
 y12 = ones(length(t))*M_y2;
 plot(t,y12,'k-');
 hold on;
 errorbar(4,M_y2,SD_y2,'k');
 %%
%****************************
 hold on;
 x3 = unifrnd(6,7,1,120);
 y3 = R_EV_t(3,:);
 plot(x3,y3,'ko');
 axis([0,8,0,1.2])  
 M_y3 = mean(y3);
 SD_y3 = std(y3);
 min_y3 = min(y3);
 max_y3 = max(y3);
 %********
 t = 6:7;
 y13 = ones(length(t))*M_y3;
 plot(t,y13,'k-');
 hold on;
 errorbar(6.5,M_y3,SD_y3,'k');

