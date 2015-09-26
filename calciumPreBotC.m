function dY=calciumPreBotC(t,Y)
v=Y(1);
n=Y(2);
h=Y(3);
C=Y(4);
l=Y(5);

 Cms=0.000000000021;
 I_tonic=0;
 vna=50;

vk=-90;
% vk=-88;
% vk=-86;
% vk=-82;

 vm=-34;
 vn=-29;
 vmp=-40;
 vh=-48;
 sm=-5;
 sn=-4;
 smp=-6;
 sh=6;
 taunb=0.010;
 tauhb=10;
 gk=0.0000000112;
 gna=0.000000028;
 gnap=0.0000000028;
 glk=0.0000000024;
 glna=0.0000000004;
 
 Kcan=0.00000000074; 
 ncan=0.00000000097; 
 gcan=0.0000000007;
 I=1;
 Ct=1.25;
 fi=0.000025;
 LL=0.37;
 P=31000;
 Ki=1.0;
 Ka=0.4;
 Ve=400;
 Ke=0.2;
 A=0.005; 
 Kd=0.4;
 sigma=0.185;

minf=1./(1+exp((v-vm) /sm)); 
ninf=1./(1+exp((v-vn) /sn));
minfp=1./(1+exp((v-vmp)/smp));
hinf=1./(1+exp((v-vh) /sh));
caninf =1./(1+(Kcan/C)^ncan);

taun=taunb./cosh((v-vn)/(2*sn));
tauh=tauhb./cosh((v-vh)/(2*sh));

I_na=gna*minf^3*(1-n)*(v-vna);
I_k=gk*n^4*(v-vk);
I_nap=gnap*minfp*h*(v-vna);
I_lk =glk*(v-vk);
I_lna=glna*(v-vna);
Ce = (Ct - C)/sigma;

I_can=gcan*caninf*(v-vna);
J_ER_in=(LL + P*( (I*C*l)/( (I+Ki)*(C+Ka) ) )^3 )*(Ce - C);
J_ER_out=Ve*C^2/(Ke^2+C^2);

dY(1)= (-I_k - I_na-I_nap-I_lk-I_lna-I_tonic-I_can)/Cms;
dY(2)= (ninf-n)/taun;
dY(3)= (hinf-h)/tauh;
dY(4) = fi*( J_ER_in- J_ER_out);
dY(5) = A*( Kd - (C + Kd)*l );
dY = dY';


