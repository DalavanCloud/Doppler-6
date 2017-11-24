clear;
fc=1e8:1e8:1e10;
v_resolution_fc=zeros(1,100);
for i=1:100
    v_resolution_fc(i)=v_resolution(fc(i),50000,10);
end
figure(1)
plot(fc,v_resolution_fc)
title('�ٶȷֱ�������Ƶ�Ĺ�ϵ(�źų���ʱ��0.5s�������10dB)')
xlabel('��Ƶ/Hz')
ylabel('�ٶȷֱ���/(m/s)')
N=500:500:50000;
fr=1e5;
t=N./fr;
for i=1:100
    v_resolution_fc(i)=v_resolution(1e9,N(i),10);
end
figure(2)
plot(t,v_resolution_fc)
title('�ٶȷֱ������źų���ʱ��Ĺ�ϵ(��Ƶ1GHz�������10dB)')
xlabel('�źų���ʱ��/s')
ylabel('�ٶȷֱ���/(m/s)')
SNR=0.2:0.2:20;
for i=1:100
    v_resolution_fc(i)=v_resolution(1e9,50000,SNR(i));
end
figure(3)
plot(t,v_resolution_fc)
title('�ٶȷֱ���������ȵĹ�ϵ(��Ƶ1GHz���źų���ʱ��0.5s)')
xlabel('�����/dB')
ylabel('�ٶȷֱ���/(m/s)')