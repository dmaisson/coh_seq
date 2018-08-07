cd 'C:\Users\David Maisson\Google Drive\DJFolder\MyWorks\Research\MyCoding\chronux\spectral_analysis\continuous';

%% Params
params.fpass = [.1 100]; % essentially a bandpass filter that restricts to range within the signal
params.Fs = 2000; % sampling rate; or 2034 if right room
params.trialave = 0; % or 1
params.tapers = [3 5]; % taper of 5...but look into this more
params.pad = 0; % adds padding of zeros on either side of the selected chunk of signal
params.err = [2 .05];
movingwin = [.5 .05];

%adjust for # of channels
trials=12;

% %% Flip variable axes
% 
% for i=1:trials
%     for j=1:bins
%       Choice.HC.Correct{i,j} = Choice.HC.Correct{i,j}';
%       Choice.HC.Incorrect{i,j} = Choice.HC.Incorrect{i,j}';
%       
%       Choice.MEC.Correct{i,j} = Choice.MEC.Correct{i,j}';
%       Choice.MEC.Incorrect{i,j} = Choice.MEC.Incorrect{i,j}';
%       
%       Choice.Re.Correct{i,j} = Choice.Re.Correct{i,j}';
%       Choice.Re.Incorrect{i,j} = Choice.Re.Incorrect{i,j}';
%       
%       Sample.HC.Correct{i,j} = Sample.HC.Correct{i,j}';
%       Sample.HC.Incorrect{i,j} = Sample.HC.Incorrect{i,j}';
%       
%       Sample.MEC.Correct{i,j} = Sample.MEC.Correct{i,j}';
%       Sample.MEC.Incorrect{i,j} = Sample.MEC.Incorrect{i,j}';
%       
%       Sample.Re.Correct{i,j} = Sample.Re.Correct{i,j}';
%       Sample.Re.Incorrect{i,j} = Sample.Re.Incorrect{i,j}';
%     end
% end
% 
% clear i j k;
%% Coherence (3D)
%% HC_MEC
%Sample
for i=1:trials
    [C,phi,S12,S1,S2,t,f,confC,phistd,Cerr]=cohgramc(HC.Sample.Correct(i).trials,MEC.Sample.Correct(i).trials,movingwin,params);
    Sample.HC_MEC.Correct(i).Coh=C;
    Sample.HC_MEC.Correct(i).phi=phi;
    Sample.HC_MEC.Correct(i).S12=S12;
    Sample.HC_MEC.Correct(i).S1=S1;
    Sample.HC_MEC.Correct(i).S2=S2;
    Sample.HC_MEC.Correct(i).t=t;
    Sample.HC_MEC.Correct(i).f=f;
    Sample.HC_MEC.Correct(i).confC=confC;
    Sample.HC_MEC.Correct(i).phistd=phistd;
    Sample.HC_MEC.Correct(i).Cerr=Cerr;
end

clear C phi S12 S1 S2 t f confC phistd Cerr ;

%Choice
for i=1:trials
    [C,phi,S12,S1,S2,t,f,confC,phistd,Cerr]=cohgramc(HC.Choice.Correct(i).trials,MEC.Choice.Correct(i).trials,movingwin,params);
    Choice.HC_MEC.Correct(i).Coh=C;
    Choice.HC_MEC.Correct(i).phi=phi;
    Choice.HC_MEC.Correct(i).S12=S12;
    Choice.HC_MEC.Correct(i).S1=S1;
    Choice.HC_MEC.Correct(i).S2=S2;
    Choice.HC_MEC.Correct(i).t=t;
    Choice.HC_MEC.Correct(i).f=f;
    Choice.HC_MEC.Correct(i).confC=confC;
    Choice.HC_MEC.Correct(i).phistd=phistd;
    Choice.HC_MEC.Correct(i).Cerr=Cerr;
end

clear C phi S12 S1 S2 t f confC phistd Cerr;

%% HC_Re
%Sample
for i=1:trials
    [C,phi,S12,S1,S2,t,f,confC,phistd,Cerr]=cohgramc(HC.Sample.Correct(i).trials,Re.Sample.Correct(i).trials,movingwin,params);
    Sample.HC_Re.Correct(i).Coh=C;
    Sample.HC_Re.Correct(i).phi=phi;
    Sample.HC_Re.Correct(i).S12=S12;
    Sample.HC_Re.Correct(i).S1=S1;
    Sample.HC_Re.Correct(i).S2=S2;
    Sample.HC_Re.Correct(i).t=t;
    Sample.HC_Re.Correct(i).f=f;
    Sample.HC_Re.Correct(i).confC=confC;
    Sample.HC_Re.Correct(i).phistd=phistd;
    Sample.HC_Re.Correct(i).Cerr=Cerr;
end

clear C phi S12 S1 S2 t f confC phistd Cerr ;

%Choice
for i=1:trials
    [C,phi,S12,S1,S2,t,f,confC,phistd,Cerr]=cohgramc(HC.Choice.Correct(i).trials,Re.Choice.Correct(i).trials,movingwin,params);
    Choice.HC_Re.Correct(i).Coh=C;
    Choice.HC_Re.Correct(i).phi=phi;
    Choice.HC_Re.Correct(i).S12=S12;
    Choice.HC_Re.Correct(i).S1=S1;
    Choice.HC_Re.Correct(i).S2=S2;
    Choice.HC_Re.Correct(i).t=t;
    Choice.HC_Re.Correct(i).f=f;
    Choice.HC_Re.Correct(i).confC=confC;
    Choice.HC_Re.Correct(i).phistd=phistd;
    Choice.HC_Re.Correct(i).Cerr=Cerr;
end

clear C phi S12 S1 S2 t f confC phistd Cerr;

%% MEC_Re
%Sample
for i=1:trials
    [C,phi,S12,S1,S2,t,f,confC,phistd,Cerr]=cohgramc(MEC.Sample.Correct(i).trials,Re.Sample.Correct(i).trials,movingwin,params);
    Sample.MEC_Re.Correct(i).Coh=C;
    Sample.MEC_Re.Correct(i).phi=phi;
    Sample.MEC_Re.Correct(i).S12=S12;
    Sample.MEC_Re.Correct(i).S1=S1;
    Sample.MEC_Re.Correct(i).S2=S2;
    Sample.MEC_Re.Correct(i).t=t;
    Sample.MEC_Re.Correct(i).f=f;
    Sample.MEC_Re.Correct(i).confC=confC;
    Sample.MEC_Re.Correct(i).phistd=phistd;
    Sample.MEC_Re.Correct(i).Cerr=Cerr;
end

clear C phi S12 S1 S2 t f confC phistd Cerr ;

%Choice
for i=1:trials
    [C,phi,S12,S1,S2,t,f,confC,phistd,Cerr]=cohgramc(MEC.Choice.Correct(i).trials,Re.Choice.Correct(i).trials,movingwin,params);
    Choice.MEC_Re.Correct(i).Coh=C;
    Choice.MEC_Re.Correct(i).phi=phi;
    Choice.MEC_Re.Correct(i).S12=S12;
    Choice.MEC_Re.Correct(i).S1=S1;
    Choice.MEC_Re.Correct(i).S2=S2;
    Choice.MEC_Re.Correct(i).t=t;
    Choice.MEC_Re.Correct(i).f=f;
    Choice.MEC_Re.Correct(i).confC=confC;
    Choice.MEC_Re.Correct(i).phistd=phistd;
    Choice.MEC_Re.Correct(i).Cerr=Cerr;
end

clear C phi S12 S1 S2 t f confC phistd Cerr;
%% Save
save ('X:\08. Lab personnel\Current\David\Projects\Ephys\HC Modulation - Re_Vs_dcMEC LFP\2. Output\Was\Analyses\Day1_Maze_Coh.mat','-v7.3');