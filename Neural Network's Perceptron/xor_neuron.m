%Data samples for XOR
p=[0 0; 0 1; 1 0; 1 1];
%Adding a one valued column for bias
one=ones(1,4)';
x=[p one];
%Taking row size for iterations
[row, col] = size(x);
%Taking Random Weights
wb=12;
w1 = -12;
w2 = 30;
w=[w1 w2 wb];
%Learning rate-> we can use or not
u = 0.2;
%Hidden layer's output/ output layer's input
h1=[];
h2=[];
%Assigning weights for this particular AND operation
wOld1 =w;
wNew1=wOld1;
%AND operation process
for k=1:100
	counter1=0;
		for i = 1: row
			target1 = [0 0 0 1]';
			inputs=x(i:i,1:3);
%hardlim function gives a value 1 or 0
			y = hardlim(wOld1*inputs');
			if(target1(i)~=y)
%Changing the weight if we get error
				wNew1 = wOld1' + (target1(i)-y)*inputs';
				counter1=counter1+1;
			end
			wOld1= wNew1';
    end
%Finishing the loop if no error counted
		if(counter1==0)
%Getting the outputs for the AND operation
            for i = 1: row
				inputs=x(i:i,1:3);
				y = hardlim(wOld1*inputs');
                h1=[h1 y];
            end
			break;
		end
end
%Assigning weights for this particular NOR operation
wOld2 =w;
wNew2=wOld2;
%NOR operation process
for k=1:100
    counter2=0;
	for i = 1: row
		target2 = [1 0 0 0]';
		inputs=x(i:i,1:3);
		y = hardlim(wOld2*inputs');
		if(target2(i)~=y)
			wNew2 = wOld2' + (target2(i)-y)*inputs';

			counter2=counter2+1;
            wOld2= wNew2';
		end

    end
    if(counter2==0)
        for i = 1: row
				inputs=x(i:i,1:3);
				y = hardlim(wOld2*inputs');
                h2=[h2 y];
            end
       break;
    end
end
%H is the hidden layer's input with one valued column for the Bias
h=[h1;h2;one']';
%O is the final output of the perceptron
o=[];
%Assigning weights for this particular OR operation
wOld3 =w;
wNew3=wOld3;
%OR operation process
for k=1:100
	counter3=0;
		for i = 1: row
%For XOR taget value would be target3=[0 1 1 0]';
%For XNOR target value is given below
				target3 = [1 0 0 1]';
				inputs=h(i:i,1:3);
				y = hardlim(wOld3*inputs');
				if(target3(i)~=y)
					wNew3 = wOld3' + (target3(i)-y)*inputs';
					counter3=counter3+1;
                    wOld3= wNew3';
        end
		end
		if(counter3==0)
            for i = 1: row
				inputs=h(i:i,1:3);
				y = hardlim(wOld3*inputs');
                o=[o;y];
            end
			break;
		end
end
target=o;
%Taking values in separate positive and negative class for values 1 & 0
classPositive=[];
classNegative=[];
%Final testing/verification of the data
for i = 1: row
	 inputs=x(i:i,1:2);
         if(target(i)==1)
            classPositive=[classPositive;inputs(1:1,1:2)];
         end
         if(target(i)==0)
            classNegative=[classNegative;inputs(1:1,1:2)];
         end
 end
classPositive;
classNegative;
%Plotting our data for visualization

%Plotting 1st cluster red
x1=classPositive(:,1);
y1=classPositive(:,2);
scatter(x1, y1);
hold on;

%Ploting 2nd cluster with color blue
x2=classNegative(:,1);
y2=classNegative(:,2);
scatter(x2, y2);
%Unlike matlab octave take separate classes value in separate color
