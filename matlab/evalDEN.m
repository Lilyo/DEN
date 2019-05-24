clc;
clear all;
close all;


% DEN_ScanNet_DC_SID
result_folder = 'ScanNet_gan_2layer_4dis_4scale_1con_60ch_36z_36z/';
exp_name='650291.mat';

load([result_folder exp_name]);
[m , n, c] = size(prd);

example_error = repmat(struct('error',[]), m, 1);
for a = 1:m
    fprintf('%d/%d\n', a, m);

    result_prd = squeeze(double(prd(a,:,:)))*256/4000;
    raw_ = squeeze(double(raw(a,:,:)))*256/4000;
    gdt_ = squeeze(double(gth(a,:,:)))*256/4000;
    
    diff = abs(result_prd-gdt_);

    valid1 = gdt_>0;
    valid2 = gdt_>0 & raw_>0;
    valid3 = gdt_>0 & raw_==0;

    example_error(a).sqr = diff(valid1(:)).^2;
    example_error(a).rel = diff(valid1(:))./gdt_(valid1(:));
    example_error(a).dt = max(result_prd(valid1(:))./gdt_(valid1(:)), gdt_(valid1(:))./result_prd(valid1(:)));

    example_error(a).sqr_raw = diff(valid2(:)).^2;
    example_error(a).rel_raw = diff(valid2(:))./gdt_(valid2(:));
    example_error(a).dt_raw = max(result_prd(valid2(:))./gdt_(valid2(:)), gdt_(valid2(:))./result_prd(valid2(:)));

    example_error(a).sqr_ukn = diff(valid3(:)).^2;
    example_error(a).rel_ukn = diff(valid3(:))./gdt_(valid3(:));
    example_error(a).dt_ukn = max(result_prd(valid3(:))./gdt_(valid3(:)), gdt_(valid3(:))./result_prd(valid3(:)));  
    clear diff valid1 valid2 valid3 gdt_ raw_ result_prd
end

clear prd raw gth

t = 1;
fprintf('Avg by mean() with t = %f\n',t);
metric.rel = mean(vertcat(example_error.rel));
metric.rmse = sqrt(mean(vertcat(example_error.sqr)));
metric.trmse = sqrt(mean(min(vertcat(example_error.sqr), t.^2)));
dt = vertcat(example_error.dt);
metric.dt = [sum(dt<1.05)/length(dt) sum(dt<1.10)/length(dt) sum(dt<1.25)/length(dt) sum(dt<1.5625)/length(dt) sum(dt<1.9531)/length(dt)];

metric.rel_raw = mean(vertcat(example_error.rel_raw));
metric.rmse_raw = sqrt(mean(vertcat(example_error.sqr_raw)));
metric.trmse_raw = sqrt(mean(min(vertcat(example_error.sqr_raw), t.^2)));
dt = vertcat(example_error.dt_raw);
metric.dt_raw = [sum(dt<1.05)/length(dt) sum(dt<1.10)/length(dt) sum(dt<1.25)/length(dt) sum(dt<1.5625)/length(dt) sum(dt<1.9531)/length(dt)];

metric.rel_ukn = mean(vertcat(example_error.rel_ukn));
metric.rmse_ukn = sqrt(mean(vertcat(example_error.sqr_ukn)));
metric.trmse_ukn = sqrt(mean(min(vertcat(example_error.sqr_ukn), t.^2)));
dt = vertcat(example_error.dt_ukn);
metric.dt_ukn = [sum(dt<1.05)/length(dt) sum(dt<1.10)/length(dt) sum(dt<1.25)/length(dt) sum(dt<1.5625)/length(dt) sum(dt<1.9531)/length(dt)];


fprintf('Done.\n');
clear example_error dt 