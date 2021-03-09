function Disp = ALLmodelpredict5(X_6,X_21)
% totally 19 models to predict

%X_21 = all 21 features * no of data;
%X_6 = (ky	Ts	Mw	PGV	Sa(1.3Ts) * no of data;


%% BM2019 model
Disp(:,20) =log(JM19(X_21));



%%
X_21 =table2array(X_21);
X_6 =table2array(X_6);

%% GLM
S = load('GLMmodel.mat');
GLMmodel = S.GLMmodel;
Disp(:,1) = predict(GLMmodel,X_6);


%% PLSR
S = load('PLScoeff');
PLScoeff = S.PLScoeff;
[m,~] = size(X_21);

Disp(:,2) = [ones(m,1),X_21]*PLScoeff;

%% PCR
S = load('PCRcoeff');
PCRcoeff = S.PCRcoeff;
[m,~] = size(X_21);
Disp(:,3) = [ones(m,1),X_21]*PCRcoeff;


%% bagging and boosting 6 features
S = load('BagBooMdl_6.mat');
BagBooMdl_6 = S.BagBooMdl_6;
Disp(:,4) = predict(BagBooMdl_6,X_6);

%% bagging and boosting 21 features
%S = load('./five_feat/models/BagBooMdl_21.mat');
%BagBooMdl_21 = S.BagBooMdl_21;
%Disp(:,5) = predict(BagBooMdl_21,X_21);

%% random forest with 6 features
S = load('mdlrf6.mat');
mdlrf6 = S.mdlrf6;
Disp(:,6) = predict(mdlrf6,X_6);

%% random forest with 21 features
%S = load('./five_feat/models/mdlrf21.mat');
%mdlrf21 = S.mdlrf21;
%Disp(:,7) = predict(mdlrf21,X_21);

%% kernel with 6 features 
S = load('KernMdl_6.mat');
KernMdl_6 = S.KernMdl_6;
Disp(:,18) = predict(KernMdl_6,X_6);

%% kernel with 21 features 
S = load('KernMdl_21.mat');
KernMdl_21 = S.KernMdl_21;
Disp(:,19) = predict(KernMdl_21,X_21);

%% polynomial models on 2nd/3rd/4th order variables (no interaction) with fixed 6 features

S = load('plymdl2_6.mat');
plymdl2_6 = S.plymdl2_6;
Disp(:,12) = predict(plymdl2_6,X_6.^2);

S = load('plymdl3_6.mat');
plymdl3_6 = S.plymdl3_6;
Disp(:,13) = predict(plymdl3_6,X_6.^3);

S = load('plymdl4_6.mat');
plymdl4_6 = S.plymdl4_6;
Disp(:,14) = predict(plymdl4_6,X_6.^4);


%% polynomial 2nd/3rd order 21 features with no interaction and feature selection
S = load('fwmdl2_21.mat');
fwmdl2_21 = S.fwmdl2_21;
fwmdl2_21_index = S.fwmdl2_21_index;
Disp(:,8) = predict(fwmdl2_21,X_21(:,fwmdl2_21_index).^2);

S = load('fwmdl3_21.mat');
fwmdl3_21 = S.fwmdl3_21;
fwmdl3_21_index = S.fwmdl3_21_index;
Disp(:,9) = predict(fwmdl3_21,X_21(:,fwmdl3_21_index).^3);

%% polynomial- Multiorder 6 features
S = load('MPLYmdl_6.mat');
MPLYmdl_6 = S.MPLYmdl_6;
Disp(:,17) = predict(MPLYmdl_6,X_6);

%% polynomial interactive 6 and 21 features
S = load('intmdl_6.mat');
intmdl_6 = S.intmdl_6;
Disp(:,15) = predict(intmdl_6,X_6);

S = load('intmdl_21.mat');
intmdl_21 = S.intmdl_21;
Disp(:,10) = predict(intmdl_21,X_21);

%% polynomial interactive + quardratic terms 6 and 21 features
S = load('qdmdl_6.mat');
qdmdl_6= S.qdmdl_6;
Disp(:,16) = predict(qdmdl_6,X_6);

S = load('qdmdl_21.mat');
qdmdl_21= S.qdmdl_21;
Disp(:,11) = predict(qdmdl_21,X_21);
Disp = exp(Disp);
end

