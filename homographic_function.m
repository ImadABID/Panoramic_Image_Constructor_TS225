function  homographic_function(img1,img2)

pts0 = zeros(4,2);
pts0 = zeros(4,2);

im1 = imread(img1);
im2 = imread(img2);

figure,
imshow(im1);
pts0 = ginput(4);
title("image 1");
figure,
imshow(im2);
pts1 = ginput(4);
title("image 2");

H = homographic_matrix(pts0,pts1);


end

