cd 'X:\03. Lab Procedures and Protocols\MATLABToolbox\chronux\spectral_analysis\continuous';

%% Params
params.fpass = [.1 100]; % essentially a bandpass filter that restricts to range within the signal
params.Fs = 2000; % sampling rate; or 2034 if right room
params.trialave = 0; % or 1
params.tapers = [20 39]; % taper of 5...but look into this more
params.pad = 0; % adds padding of zeros on either side of the selected chunk of signal
params.err = [2 .05];
movingwin = [4 .05];

%% Flip variable axes
%adjust for # of channels
bins=size(Choice.HC.Correct,2);
trials=size(Choice.HC.Correct,1);

for i=1:trials
    for j=1:bins
      Choice.HC.Correct{i,j} = Choice.HC.Correct{i,j}';
      Choice.HC.Incorrect{i,j} = Choice.HC.Incorrect{i,j}';
      
      Choice.MEC.Correct{i,j} = Choice.MEC.Correct{i,j}';
      Choice.MEC.Incorrect{i,j} = Choice.MEC.Incorrect{i,j}';
      
      Choice.Re.Correct{i,j} = Choice.Re.Correct{i,j}';
      Choice.Re.Incorrect{i,j} = Choice.Re.Incorrect{i,j}';
      
      Sample.HC.Correct{i,j} = Sample.HC.Correct{i,j}';
      Sample.HC.Incorrect{i,j} = Sample.HC.Incorrect{i,j}';
      
      Sample.MEC.Correct{i,j} = Sample.MEC.Correct{i,j}';
      Sample.MEC.Incorrect{i,j} = Sample.MEC.Incorrect{i,j}';
      
      Sample.Re.Correct{i,j} = Sample.Re.Correct{i,j}';
      Sample.Re.Incorrect{i,j} = Sample.Re.Incorrect{i,j}';
    end
end

clear i j k;
%% Coherence (3D)
%Sample
for i=1:trials
    for j=1:bins
    [C,phi,S12,S1,S2,t,f,confC,phistd,Cerr]=cohgramc(Sample.HC.Correct{i,j},Sample.MEC.Correct{i,j},movingwin,params);
    Sample.Coh.HC_MEC.Correct{i,j}=C';
    Sample.phi.HC_MEC.Correct{i,j}=phi;
    Sample.S12.HC_MEC.Correct{i,j}=S12;
    Sample.S1.HC_MEC.Correct{i,j}=S1;
    Sample.S2.HC_MEC.Correct{i,j}=S2;
    Sample.t.HC_MEC.Correct{i,j}=t;
    Sample.f.HC_MEC.Correct{i,j}=f;
    Sample.confC.HC_MEC.Correct{i,j}=confC;
    Sample.phistd.HC_MEC.Correct{i,j}=phistd;
    Sample.Cerr.HC_MEC.Correct{i,j}=Cerr;
    end
end

clear C phi S12 S1 S2 t f confC phistd Cerr ;

%% Coherence (2d)
%Choice
for i=1:trials
    for j=1:bins;
    [C,phi,S12,S1,S2,f,confC,phistd,Cerr]=coherencyc(CLFP_MEC{i,j},CLFP_HC{i,j},params);
    C_2d_all{i,j}=C';
    phi_2d_all{i,j}=phi;
    S12_2d_all{i,j}=S12;
    S1_2d_all{i,j}=S1;
    S2_2d_all{i,j}=S2;
    f_2d_all{i,j}=f;
    confC_2d_all{i,j}=confC;
    phistd_2d_all{i,j}=phistd;
    Cerr_2d_all{i,j}=Cerr;
    end
end

clear C phi S12 S1 S2 t f confC phistd Cerr S12_2d_all S1_2d_all S2_2d_all confC_2d_all phistd_2d_all;

%% Reconstruct Matrix

for i=1:bins
    C_f{1,i}(1,1)=C_f_alpha(1,i);
    C_f{1,i}(1,2)=C_f_theta(1,i);
    C_f{1,i}(1,3)=C_f_beta(1,i);
    C_f{1,i}(1,4)=C_f_lgamma(1,i);
    C_f{1,i}(1,5)=C_f_hgamma(1,i);
    
    C_C{1,i}(1,1)=C_C_alpha(1,i);
    C_C{1,i}(1,2)=C_C_theta(1,i);
    C_C{1,i}(1,3)=C_C_beta(1,i);
    C_C{1,i}(1,4)=C_C_lgamma(1,i);
    C_C{1,i}(1,5)=C_C_hgamma(1,i);
end

for i=1:bins
    C_C{1,i}=C_C{1,i}';
end

clear C_C_alpha C_C_beta C_C_hgamma C_C_lgamma C_C_theta C_f_alpha C_f_beta C_f_hgamma C_f_lgamma C_f_theta;
%% Figures

% plot - Sample
figure;
subplot 121;
hold on;
plot(S_f_MECHC{1,1},S_C_MECHC{1,1},'r');
plot(S_f_MECHC{1,2},S_C_MECHC{1,2},'g');
plot(S_f_MECHC{1,3},S_C_MECHC{1,3},'b');
plot(S_f_MECHC{1,4},S_C_MECHC{1,4},'m');
plot(S_f_MECHC{1,5},S_C_MECHC{1,5},'c');
legend('Stem','CP','Rew Arm','Rew Zone','Ret Arm');
title('Sample Phase - Binned Maze');
ylabel('Coherence (Avg. witin Freq Band)');
xlabel('Frequency (Hz)');

subplot 122;
hold on;
plot(C_f_MECHC{1,1},C_C_MECHC{1,1},'r');
plot(C_f_MECHC{1,2},C_C_MECHC{1,2},'g');
plot(C_f_MECHC{1,3},C_C_MECHC{1,3},'b');
plot(C_f_MECHC{1,4},C_C_MECHC{1,4},'m');
plot(C_f_MECHC{1,5},C_C_MECHC{1,5},'c');
legend('Stem','CP','Rew Arm','Rew Zone','Ret Arm');
title('Choice Phase - Binned Maze');
ylabel('Coherence (Avg. witin Freq Band)');
xlabel('Frequency (Hz)');

%% Save
save ('X:\08. Lab personnel\Current\David\Projects\Ephys\HC Modulation - Re_Vs_dcMEC LFP\2. Output\Was\Analyses\Day1_Maze_Coh.mat','-v7.3');