% Image Compression using K-Means clustering

clear ; close all; clc


% ============= K-Means Clustering on Pixels ===============
%  Here we used K-Means to compress an image. To do this, we
%  first run K-Means on the colors of the pixels in the image and
%  then mapped each pixel onto its closest centroid.

%  Load an image 
A = double(imread('bird_small.png'));

% If imread does not work try instead
%   load ('bird_small.mat');

A = A / 255; % Divide by 255 so that all values are in the range 0 - 1

% Size of the image
img_size = size(A);

% Reshape the image into an Nx3 matrix where N = number of pixels.
% Each row will contain the Red, Green and Blue pixel values
% This gave us our dataset matrix X that we used K-Means on.
X = reshape(A, img_size(1) * img_size(2), 3);

% Running K-Means algorithm on this data
K = 16; 
max_iters = 10;

% When using K-Means, it is important to initialize the centroids
% randomly. 
initial_centroids = kMeansInitCentroids(X, K);
% Run K-Means
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);


% ================= Image Compression ======================
%  Here, we used the clusters of K-Means to compress an image. 
%  To do this, we first find the closest clusters for
%  each example.

% Find closest cluster members
idx = findClosestCentroids(X, centroids);

% Essentially, now I have represented the image X as in terms of the
% indices in idx. 

% We can now recover the image from the indices (idx) by mapping each pixel
% (specified by its index in idx) to the centroid value
X_recovered = centroids(idx,:);
X_recovered 
% Reshape the recovered image into proper dimensions
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

% Display the original image 
subplot(1, 2, 1);
imagesc(A); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));
