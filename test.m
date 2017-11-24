clear;
fc=1e9;
fr=100000;
A=1;
rate=0.2;
N=50000;
D1=50;
SNR=10;
[y,fs] = Doppler(281.3836,fc,fr,A,rate,N,SNR);
t=0:1/fs:(length(y)-1)/fs;
fct=A*cos(2*pi*fc*t);
y1 = y.*fct;
y1_f=fft(y1,length(y1));
%低通滤波
y2 = low_pass_filter(y1,fs,1/6*fs,1/3*fs,0.057501127785,0.0001,16);
%降采样
y3=zeros(1,fix(length(y2)/D1));
for i=1:fix(length(y2)/D1)
     y3(i) = y2(D1*i);
end
%再一次低通滤波
y4 = low_pass_filter(y3,fs/D1,fs/D1/6,fs/D1/3,0.057501127785,0.0001,16);
figure(3);
plot(y4);
title('y4');
y4_f=fft(y4,length(y4));
figure(4)
plot(abs(y4_f));
title('y4_f');
fd=(argmax(abs(y4_f))-1)/length(y4)*fs/D1