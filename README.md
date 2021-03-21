# MLslopedisplacement


## How to use

1. download all the files and put them in the same folder
2. run the function ALLmodelpredict5.m


## Input for ALLmodelpredict5

X_6: a N by 5 matrix where N is the number of data and 5 is the number of features.
The features should be [lnKy, Ts, Mw, lnPGV, ln(Sa1.3Ts)]

X_21: a N by 21 matrix where N is the number of data and 21 is the number of features.
The features should be [lnky	Ts	Mw	lnPGV	lnPGA	lnSa(1.5Ts)	lnSa(2Ts)	lnSa(2.5Ts)	lnSa(3Ts)	lnSa(1.3Ts)	lnSa(1.4Ts)	lnSa(1.6Ts)	lnSa(1.7Ts)	lnSa(1.8Ts)	lnSa(1Ts)	lnSa(1.1Ts)	lnSa(1.2Ts)	lnd5-95	lnIa	lnClstD	lnVs30]

if 21 features are not available, just comment out all the model code that requires X_21 as input in ALLmodelpredict5.m

## Output for ALLmodelpredict5

Disp: a N by 20 matrix, where Disp[:,1:19] corresponds to the prediction for the 19 models defined in the paper. Disp[20] is the BM19 model


