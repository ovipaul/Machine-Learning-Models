x=[0.4 0.75 0.9 1.9 2.45 3.9 4.2 5.65 5.8 6.25 6.6 7.5];
y=[1.3 1.5 1.9 -1.6 -1.8 2.25 1.95 2.15 2.2 1.25 0.75 2.1];
test1=[x y]';
test2=[x;y]';
test2(:,1:1);
test2(1:2,1:1);
test2(1:2,:); %(1:end) and (:)
%Both lengths gives the same result
length(x);
length(y');
squaredError=(sum((x-y).^2))/length(x)
