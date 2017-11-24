function [v_ratio]= v_resolution(fc,N,SNR)
c = 3.0*10^8;
lamda =c/fc;
fr=100000;
A=1;
rate=0.2;
D1=50;
[y,fs] = Doppler(300,fc,fr,A,rate,N,SNR);
t=0:1/fs:(length(y)-1)/fs;
fct=A*cos(2*pi*fc*t);
y1 = y.*fct;
y1_f=fft(y1,length(y1));
%��ͨ�˲�
y2 = low_pass_filter(y1,fs,1/6*fs,1/3*fs,0.057501127785,0.0001,16);
%������
y3=zeros(1,fix(length(y2)/D1));
for i=1:fix(length(y2)/D1)
     y3(i) = y2(D1*i);
end
%��һ�ε�ͨ�˲�
y4 = low_pass_filter(y3,fs/D1,fs/D1/6,fs/D1/3,0.057501127785,0.0001,16);
v_ratio=lamda/2/length(y4)*fs/D1;
