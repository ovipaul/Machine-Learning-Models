p1 = [0 0]; t1=0;
p2 = [0 1]; t2=0;
p3 = [1 0]; t3=0;
p4 = [1 1]; t4=1;

target = [0 1 1 1]';
p=[0 0; 0 1; 1 0; 1 1];

wb=12;
w1 = -12;
w2 = 30;
one=ones(1,4)';
w=[w1 w2 wb];

x=[p one];

[row, col] = size(x);

%learning rate
u = 0.2;
wOld =w;
wNew=wOld;

for k=1:100
    counter=0;
	for i = 1: row
			inputs=x(i:i,1:3);
			y = hardlim(wOld*inputs');
			if(target(i)~=y)
				wNew = wOld' + (target(i)-y)*inputs';			
				counter=counter+1;
			end
			wOld= wNew';
    end
            if(counter==0)
                break;
            end
end
class1=[];
class2=[];
for i = 1: row
	inputs=x(i:i,1:3);
    y = hardlim(wOld*inputs');
	if(target(i)==y && target(i)==1)
        class1=[class1;inputs(1:1,1:2)];
	end
	if(target(i)==y && target(i)==0)
		class2=[class2;inputs(1:1,1:2)];
	end
end

figure (1);
%Plotting 1st cluster red
x1=class1(:,1);
y1=class1(:,2);
scatter(x1, y1,'red');
hold on;

%Ploting 2nd cluster with color blue
x2=class2(:,1);
y2=class2(:,2);
scatter(x2, y2,'blue');
hold on;

%Ploting 2nd cluster with color blue
%x3=wOld(1:end,1:2);
%y3=inputs(1:end,1:2);
%scatter(x3, y3,'black');
