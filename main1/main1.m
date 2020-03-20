#Ergasia 1

#Erwthma a

G = tf([1 2],[1 4]) #G(s)=(s+2)/(s+4)

H = tf([1],[1 2]) #H(s)=1/(s+2)

F = feedback(G,H) #F(s)=G(s)/(1+G(s)*H(S))=(s^2 + 4s +4)/(s^2 + 7s +10)

#Erwthma b

P = pole(F)
Z = zero(F)
figure(1)
[p,z] = pzmap(F)  #Calculation of Poles and Zeros
pzmap(F)
legend('Poles','Zeros') #Symbolize Poles and Zeros
grid on #Sketch the diagramm of poles and zeros

#Erwthma c

Fmin = minreal(F) #New simplified tranfer function

#Erwthma d

figure(2)
[y1,t1] = step(F) #step response for the initial transfer function
hold on
[y2,t2] = step(Fmin) #step response for the simplified transfer function
plot(t1,y1,t2,y2)
legend('F','Fmin')
xlabel('time')
ylabel('response')
hold off

