# MLslopedisplacement for shallow crustal earthquakes

The MLSD.m file contains a function for slope displacement prediction. The model_coef folder contains the coefficients for the ML models


## How to use

1. Download the MLSD.m file and the model_coef folder
2. Due to the maximum file size limit in Github, please also download the additional files from https://gatech.box.com/s/5fixxcvzzlsufv4090bps040k6n0e0hd and put them in the model_coef folder
3. Run the function MLSD.m in MATLAB


## Input data for MLSD.m

X_5: a N by 5 table where N is the number of data and 5 is the number of features.
The features should be [lnKy, Ts, Mw, lnPGV (cm/s), ln(Sa1.3Ts)]

X_21: a N by 21 table where N is the number of data and 21 is the number of features.
The features should be [lnky	Ts	Mw	lnPGV	lnPGA	lnSa(1.5Ts)	lnSa(2Ts)	lnSa(2.5Ts)	lnSa(3Ts)	lnSa(1.3Ts)	lnSa(1.4Ts)	lnSa(1.6Ts)	lnSa(1.7Ts)	lnSa(1.8Ts)	lnSa(1Ts)	lnSa(1.1Ts)	lnSa(1.2Ts)	lnd5-95	lnIa	lnClstD	lnVs30]

If only 5 features are available, just comment out the models that require X_21 as input in the MLSD.m files.

## Output for MLSD.m

Disp: a N by 19 matrix, where Disp(:,1:19) corresponds to the prediction for the 19 models defined in the paper.


