function dY=pacemakerPreBotC(t,Y)
v=Y(1);
n=Y(2);
h=Y(3);

 Cms=0.000000000021;
 I_tonic=0;
 vna=50;
% vk=-78;
% vk=-76.5;
 vk=-78.9;
% vk=-72;
% vk=-80;
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

minf=1./(1+exp((v-vm) /sm)); 
ninf=1./(1+exp((v-vn) /sn));
minfp=1./(1+exp((v-vmp)/smp));
hinf=1./(1+exp((v-vh) /sh));

taun=taunb./cosh((v-vn)/(2*sn));
tauh=tauhb./cosh((v-vh)/(2*sh));

I_na=gna*minf^3*(1-n)*(v-vna);
I_k=gk*n^4*(v-vk);
I_nap=gnap*minfp*h*(v-vna);
I_lk =glk*(v-vk);
I_lna=glna*(v-vna);
dY(1)= (-I_k - I_na-I_nap-I_lk-I_lna-I_tonic)/Cms;
dY(2)= (ninf-n)/taun;
dY(3)= (hinf-h)/tauh;
dY = dY';


