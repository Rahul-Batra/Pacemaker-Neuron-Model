tspan = 0:0.01:40;
[T, Y]=ode15s('pacemakerPreBotC',tspan,[-49.62249385170052 0.005732605363421063 0.3976212815079196]);
figure(1);
plot(T,Y(:,1))
axis([0 40 -60 0])
xlabel('Time (ms)')
ylabel('V (mV)')