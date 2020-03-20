# Erwthma a

b = [ 0 0 0 4 8 4 56 112 56 0 ];   # our input values for the numerator of the transfer function
a = [ 4 1 -191 -38 -420 -2972 -1363 -6282 -4198 -700 ]; # our input values for the denominator of the transfer function 

Ftransfer=tf(b,a) #Calculation of our transfer function F

[A B C D] = tf2ss(b,a)  #Calculation of the matrixes A,B,C,D  so that we check the observability and controllability

Cotrollability_matrix = ctrb(A,B)  # Calculation of the controllability matrix
Observability_matrix = obsv(A,C)  # Calculation of the observability matrix

c_rank = rank(Cotrollability_matrix) #Calculation of controllability's matrix rank
ob_rank = rank(Observability_matrix)  # Calculation of observability's matrix rank

if isequal(c_rank,9)   #Check if the controllability's matrix rank is equal to the full rank 9
    disp('The system is controllable')
else
    disp('The system is not controllable')
end


if isequal(ob_rank,9)  #Check if the observability's matrix rank is equal to the full rank 9
    disp('The system is observable')
else
    disp('The system is not observable')
end

# Erwthma b
 t = 0:0.01:4;  # Define some values for the input t
unitstep = t>=0;
ramp = t.*unitstep; # Define the input ramp

lsim(Ftransfer,ramp,t); # Simulate the time response y(t) for the input ramp and for the different values of time t

xlabel('time(seconds)')
ylabel('y(t)')
