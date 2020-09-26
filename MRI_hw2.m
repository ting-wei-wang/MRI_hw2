T1 = 100;% 100ms
T2 = 5;  %5ms
A = 1.5; %1.5tesla
t = 0:1:1000-1; % sample 1000
S1 = A * exp(-t/T1) ;
S2 = A * exp(-t/T2) ;
%-----plot line----------------------------------------------------------
figure;
plot(S1);hold on;
plot(S2);
title('T2 decay');
xlabel('msec');ylabel('A');legend('100ms','5ms');
%-----calculate frequency------------------------------------------------
f = 1000/2*linspace(-1,1,1000);
%-----plot fft real-----------------------------------------------------
figure;
r1 = fftshift(real(fft(S1))); % get real number
r2 = fftshift(real(fft(S2))); % get real number
plot(f,r1,f,r2);title('real number compare(FFT)');
xlabel('frequency(hz)');ylabel('S1(FFT)');legend('100ms','5ms');
%-----plot fft imaginary-----------------------------------------------------
i1 = fftshift(imag(fft(S1)));
i2 = fftshift(imag(fft(S2)));
figure;
plot(f,i1,f,i2);title('imaginary number compare(FFT)');
xlabel('frequency(hz)');ylabel('S2(FFT)');legend('100ms','5ms');