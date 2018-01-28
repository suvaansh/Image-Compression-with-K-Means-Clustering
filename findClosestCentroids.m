function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example

%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])


% Set K
K = size(centroids, 1);

idx = zeros(size(X,1), 1);

 
% X1 = sum(((bsxfun(@minus,X,centroids(1,:))).^2),2);
% X2 = sum(((bsxfun(@minus,X,centroids(2,:))).^2),2);
% X3 = sum(((bsxfun(@minus,X,centroids(3,:))).^2),2);

dist = zeros(size(X,1),K);

for i=1:K
    dist(:,i) = sum(((bsxfun(@minus,X,centroids(i,:))).^2),2);
end;

% initial_centroids(2)
% X2 = bsxfun(@minus,X,initial_centroids(2,:))
% X2 = X2.^2
% X2 = sum(X2,2)
 
% dist = [X1 X2 X3];

[d,idx] = min(dist');

idx = idx';

end

