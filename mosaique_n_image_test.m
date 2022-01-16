clear all;
close all;
clc;

% images_path = [ ...
%     "our_images/petites_imgs/img01.jpg.jpeg",   ...
%     "our_images/petites_imgs/img02.jpg.jpeg",   ...
%     "our_images/petites_imgs/img03.jpg.jpeg"    ...
% ];

images_path = [ ...
    "our_images/img01.jpg",   ...
    "our_images/img02.jpg",   ...
    "our_images/img03.jpg"    ...
];

images_nbr = length(images_path);

%image = rgb2gray(imread(images_path(1)));
image = imread(images_path(1));
assembled_mosaique = image_to_mosaique(image);

mosaique_figure = figure;
mosaique_figure.Position(1:2) = [200 400];

ginput_figure = figure;
ginput_figure.Position(1:2) = [1000 400];

figure(mosaique_figure),
imshow(uint8(assembled_mosaique.image));
title('Mosaique');

for i=2:1:images_nbr

    %image = rgb2gray(imread(images_path(i)));
    image = imread(images_path(i));
    tmp_mosaique = image_to_mosaique(image);
    figure(ginput_figure),
    imshow(uint8(tmp_mosaique.image));
    title('image to insert : Select 4 points !!');
    pts_t = ginput(4);
    title('image to insert');
    
    figure(mosaique_figure),
    title('Mosique : Select 4 points !!');
    pts_o = ginput(4);
    pts_o(:,1) = pts_o(:,1) + assembled_mosaique.boite(1, 1);
    pts_o(:,2) = pts_o(:,2) + assembled_mosaique.boite(1, 2);
    title('Mosique');

    H_for_boite = homographic_matrix(pts_t, pts_o);
    H_for_browse = homographic_matrix(pts_o, pts_t);

    tmp_mosaique  = transform_mosaique(tmp_mosaique, H_for_boite, H_for_browse);

    assembled_mosaique = merge_two_mosaique(assembled_mosaique, tmp_mosaique);
    
    figure(mosaique_figure), imshow(uint8(assembled_mosaique.image));

    fprintf("%d,%d %d,%d\n", assembled_mosaique.boite(1,1), assembled_mosaique.boite(1,2), assembled_mosaique.boite(2,1), assembled_mosaique.boite(2,2));

end

