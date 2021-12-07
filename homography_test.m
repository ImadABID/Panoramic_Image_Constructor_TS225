clear all;
close all;
clc;

origine_path = "our_images/twin_centre.jpg";
target_path = "our_images/github_logo.jpg";

origine = imread(origine_path);
target = imread(target_path);

figure,
imshow(origine);
pts_o = ginput(4);
title(origine);

output = homographic_function(origine, target,pts_o);

figure,
imshow(output);
title("output");

