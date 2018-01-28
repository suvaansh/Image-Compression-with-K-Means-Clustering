function centroids = kMeansInitCentroids(X, K)

%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X

centroids = zeros(K, size(X, 2));

%  randomly chosen examples from the dataset X



ind = floor(300*rand(K,1));
for i = 1:K
    centroid(i,:) = X(ind(i));
end;






% =============================================================

end

