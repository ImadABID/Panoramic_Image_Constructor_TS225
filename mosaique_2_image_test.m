clear all;
close all;
clc;

%origine_path = "our_images/petites_imgs/img01.jpg.jpeg";
%target_path = "our_images/petites_imgs/img02.jpg.jpeg";

origine_path = "our_images/img01.jpg";
target_path = "our_images/img02.jpg";

origine = imread(origine_path);
target = imread(target_path);

%origine = rgb2gray(origine);
%target = rgb2gray(target);

% figure(1),
% subplot(1,2,1);
% imshow(origine);
% subplot(1,2,2);
% imshow(target);
% title("test");

figure,
imshow(origine);
pts_o = ginput(4);
title(origine_path);

figure,
imshow(target);
pts_t = ginput(4);
title(target_path);

H_for_boite = homographic_matrix(pts_t, pts_o);
H_for_browse = homographic_matrix(pts_o, pts_t);


mosaique_o = image_to_mosaique(origine);
mosaique_t = image_to_mosaique(target);

mosaique_transform  = transform_mosaique(mosaique_t, H_for_boite, H_for_browse);

figure,
imshow(uint8(mosaique_transform.image));
title("output_tr");

new_mosaique = merge_two_mosaique(mosaique_o,mosaique_transform);

figure,
imshow(uint8(new_mosaique.image));
title("output");

