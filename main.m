clear all
clc
close all

%% Loading saved data

%%% V_ext, V_f, J_mf data:
load t_100Hz
load V_ext_100Hz
load t_100Hz_V_f
load V_f_100Hz
load t_100Hz_J_mf
load J_mf_100Hz

load t_EMvelop_stim
load V_ext_EMvelop
load t_EMvelop_stim_V_f
load V_f_EMvelop
load t_EMvelop_stim_J_mf
load J_mf_EMvelop

%%% AM variable data:
load t_EMvelop_stim_AM_1
load V_ext_EMvelop_AM_1
load t_V_f_EMvelop_stim_AM_1
load V_f_EMvelop_AM_1

load t_EMvelop_stim_AM_5
load V_ext_EMvelop_AM_5
load t_V_f_EMvelop_stim_AM_5
load V_f_EMvelop_AM_5

load t_EMvelop_stim_AM_15
load V_ext_EMvelop_AM_15
load t_V_f_EMvelop_stim_AM_15
load V_f_EMvelop_AM_15

%%% channel prob data
load t_100Hz_stim_chProb_NaAct
load chProb_NaAct_100Hz
load t_100Hz_stim_chProb_NaInAct
load chProb_NaInAct_100Hz
load t_100Hz_stim_chProb_KAct
load chProb_KAct_100Hz

load t_EMvelop_stim_chProb_NaAct
load chProb_NaAct_EMvelop
load t_EMvelop_stim_chProb_NaInAct
load chProb_NaInAct_EMvelop
load t_EMvelop_stim_chProb_KAct
load chProb_KAct_EMvelop

%%% m,h,n - steady-state values
load t_100Hz_stim_NaAct_ss
load ss_NaAct_100Hz
load t_100Hz_stim_NaInAct_ss
load ss_NaInAct_100Hz
load t_100Hz_stim_KAct_ss
load ss_KAct_100Hz

load t_EMvelop_stim_NaAct_ss
load ss_NaAct_EMvelop
load t_EMvelop_stim_NaInAct_ss
load ss_NaInAct_EMvelop
load t_EMvelop_stim_KAct_ss
load ss_KAct_EMvelop

%%% m,h,n - tau values
load t_100Hz_stim_NaAct_tau
load tau_NaAct_100Hz
load t_100Hz_stim_NaInAct_tau
load tau_NaInAct_100Hz
load t_100Hz_stim_KAct_tau
load tau_KAct_100Hz

load t_EMvelop_stim_NaAct_tau
load EMvelop_NaAct_100Hz
load t_EMvelop_stim_NaInAct_tau
load tau_NaInAct_EMvelop
load t_EMvelop_stim_KAct_tau
load tau_KAct_EMvelop


%% General plot parameters
my_linewidth = 2;
my_fontsize = 22;

greenColor = [77, 175, 74]/255;
blueColor = [0, 0, 255]/255;
grayColor = [.7 .7 .7];
left_axis_color = [0 0 0]; %black color
right_axis_color = [0.6350 0.0780 0.1840]; % dark red color

%% Fig. 3: V_ext vs V_f plots
min_y = -140;
max_y = 110;

% 100 Hz 
plot_voltage_comparison(t_100Hz, V_ext_100Hz, greenColor, t_100Hz_V_f, V_f_100Hz, blueColor,...
    my_linewidth, min_y, max_y, my_fontsize, false, true, '(A) 100 Hz stimulation', '100Hz_V_f')

% EMvelop
plot_voltage_comparison(t_EMvelop_stim, V_ext_EMvelop, greenColor, t_EMvelop_stim_V_f, V_f_EMvelop, blueColor,...
    my_linewidth, min_y, max_y, my_fontsize, false, false, '(B) EMvelop stimulation', 'EMvelop_V_f')

%% Fig. 4: V_ext vs J_mf plots
min_y = -70;
max_y = 70;

% 100 Hz J_mf
plot_current_dual_axis(t_100Hz, V_ext_100Hz, t_100Hz_J_mf, J_mf_100Hz, ...
    [min_y, max_y], [-6, 6], '(A) 100 Hz stimulation', '100Hz_J_mf', left_axis_color,...
    right_axis_color, greenColor, my_fontsize, my_linewidth, false, true);

% EMvelop J_mf
plot_current_dual_axis( t_EMvelop_stim, V_ext_EMvelop, t_EMvelop_stim_J_mf, J_mf_EMvelop,...
    [min_y, max_y], [-15, 60], '(B) EMvelop stimulation', 'EMvelop_J_mf', left_axis_color,...
    right_axis_color, greenColor, my_fontsize, my_linewidth, false, false);

%% Fig.8: Effect of AM plots
min_y = -140;
max_y = 110;

% EMvelop : AM_1
plot_voltage_comparison(t_EMvelop_stim_AM_1, V_ext_EMvelop_AM_1, greenColor, t_V_f_EMvelop_stim_AM_1, V_f_EMvelop_AM_1 , blueColor,...
    my_linewidth, min_y, max_y, my_fontsize, false, true, '(A)  {\it A}_1 = 1 {\it mV}, {\it A}_2 = 49 {\it mV}', 'EMvelop_V_f_AM_1')


% EMvelop : AM_5
plot_voltage_comparison(t_EMvelop_stim_AM_5, V_ext_EMvelop_AM_5, greenColor, t_V_f_EMvelop_stim_AM_5, V_f_EMvelop_AM_5 , blueColor,...
    my_linewidth, min_y, max_y, my_fontsize, false, false, '(B)  {\it A}_1 = 5 {\it mV}, {\it A}_2 = 45 {\it mV}', 'EMvelop_V_f_AM_5')

% EMvelop : AM_15
plot_voltage_comparison(t_EMvelop_stim_AM_15, V_ext_EMvelop_AM_15, greenColor, t_V_f_EMvelop_stim_AM_15, V_f_EMvelop_AM_15 , blueColor,...
    my_linewidth, min_y, max_y, my_fontsize, true, false, '(C)  {\it A}_1 = 15 {\it mV}, {\it A}_2 = 35 {\it mV}', 'EMvelop_V_f_AM_15')

%%  Fig.5: Channel Probabilities
min_y = 0;
max_y = 1;
min_x = t_100Hz_stim_chProb_NaAct(1);
max_x = t_100Hz_stim_chProb_NaAct(end);
panel_loc = [32 1.02];

% 100 Hz ch prob
plot_channel_properties(t_100Hz_stim_chProb_NaAct, chProb_NaAct_100Hz, t_100Hz_stim_chProb_NaInAct,...
    chProb_NaInAct_100Hz, t_100Hz_stim_chProb_KAct, chProb_KAct_100Hz, grayColor, min_x, max_x, min_y, max_y,...
    my_fontsize, my_linewidth, 'Probability', panel_loc, '(A) 100 Hz stimulation', {'m','h', 'n_{K\it{v}7}'}, ...
    '100Hz_Ch_prob', false, 'Time (ms)', true)

% EMvelop
plot_channel_properties(t_EMvelop_stim_chProb_NaAct, chProb_NaAct_EMvelop, t_EMvelop_stim_chProb_NaInAct,...
    chProb_NaInAct_EMvelop, t_EMvelop_stim_chProb_KAct, chProb_KAct_EMvelop, grayColor, min_x, max_x, min_y, max_y,...
    my_fontsize, my_linewidth, 'Probability', panel_loc, '(B) EMvelop stimulation', {'m','h', 'n_{K\it{v}7}'}, ...
    'EMvelop_Ch_prob', true, 'Time (ms)', false)

%% Fig.6: Steady-state values
% 100 Hz
min_y = 0;
max_y = 1;
min_x = min(t_100Hz_stim_NaAct_ss);
max_x = max(t_100Hz_stim_NaAct_ss);
panel_loc = [-90 1.02];

close all
plot_channel_properties(t_100Hz_stim_NaAct_ss, ss_NaAct_100Hz, t_100Hz_stim_NaInAct_ss,...
    ss_NaInAct_100Hz, t_100Hz_stim_KAct_ss, ss_KAct_100Hz, grayColor, min_x, max_x, min_y, max_y,...
    my_fontsize, my_linewidth, 'Probability', panel_loc, '(A) 100 Hz stimulation', {'m_{\infty}','h_{\infty}', 'n_{K\it{v}7,\infty}'}, ...
    'Ss_100Hz_Ch_prob', false, 'Voltage (mV)', true)

% EMvelop Hz
plot_channel_properties(t_EMvelop_stim_NaAct_ss, ss_NaAct_EMvelop, t_EMvelop_stim_NaInAct_ss,...
    ss_NaInAct_EMvelop, t_EMvelop_stim_KAct_ss, ss_KAct_EMvelop, grayColor, min_x, max_x, min_y, max_y,...
    my_fontsize, my_linewidth, 'Probability', panel_loc, '(B) EMvelop stimulation', {'m_{\infty}','h_{\infty}', 'n_{K\it{v}7,\infty}'}, ...
    'Ss_EMvelop_Ch_prob', true, 'Voltage (mV)', false)

%% Fig.7: Tau - m, h, n
min_x = min(t_100Hz_stim_NaAct_tau);
max_x = max(t_100Hz_stim_NaAct_tau);
min_y = 0;
max_y = 65;
panel_loc = [-75 60];

% 100 Hz
plot_channel_properties(t_100Hz_stim_NaAct_tau, tau_NaAct_100Hz, t_100Hz_stim_NaInAct_tau,...
    tau_NaInAct_100Hz, t_100Hz_stim_KAct_tau, tau_KAct_100Hz, grayColor, min_x, max_x, min_y, max_y,...
    my_fontsize, my_linewidth, 'Time (ms)', panel_loc, '(A) 100 Hz stimulation', {'\tau_{m}','\tau_{h}', '\tau_{K\it{v}7}'}, ...
    'Tau_100Hz_Ch_prob', false, 'Voltage (mV)', true)

% EMvelop
plot_channel_properties(t_EMvelop_stim_NaAct_tau, EMvelop_NaAct_100Hz, t_EMvelop_stim_NaInAct_tau,...
    tau_NaInAct_EMvelop, t_EMvelop_stim_KAct_tau, tau_KAct_EMvelop, grayColor, min_x, max_x, min_y, max_y,...
    my_fontsize, my_linewidth, 'Time (ms)', panel_loc, '(B) EMvelop stimulation', {'\tau_{m}','\tau_{h}', '\tau_{K\it{v}7}'}, ...
    'Tau_EMvelop_Ch_prob', true, 'Voltage (mV)', false)

%%
