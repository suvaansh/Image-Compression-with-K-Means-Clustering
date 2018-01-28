function centroids = computeCentroids(X, idx, K)
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

centroids = zeros(K, n);


% sum1 = [0 0];
% sum2 = [0 0];
% sum3 = [0 0];
% ix = [0;0;0]
% for i = 1:m
%     if(idx(i)==1)
%         sum1 = sum1+X(i,:);  ix(1)=ix(1)+1;
%     end;
%     if(idx(i)==2)
%         sum2 = sum2+X(i,:);  ix(2)=ix(2)+1;
%     end;
%     if(idx(i)==3)
%         sum3 = sum3+X(i,:);  ix(3)=ix(3)+1;
%     end;
% end;
summ = zeros(K,n);

for i = 1:K
    summ(i,:) = sum(X(find(idx==i),:));
end;

for i=1:K
    centroids(i,:) = summ(i,:)./(size(find(idx==i),1));
end;

% sum1  = sum(X(find(idx==1),:));
% sum2  = sum(X(find(idx==2),:));
% sum3  = sum(X(find(idx==3),:));


end

