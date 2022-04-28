 pkg load signal

 a = [ 1.0 -1.6216505 1.1102795 -0.4621741 0.2075552 -0.018756746 ];
 white = rand(1,16384);
 signal = detrend(filter(0.70181,a,white));
 % frequency shift by modulating with exp(j.omega.t)
 skewed = signal.*exp(2*pi*i*2/25*[1:16384]);

 [Pxx,f] = pwelch(signal);
 [Pxx,f] = pwelch(skewed);
 
