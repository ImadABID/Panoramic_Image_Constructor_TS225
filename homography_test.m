clear all;
close all;
clc;


pts_o = [0 0; 1 0; 1 1; 0 1];
pts_t = [0 0; 1 0; 0.75 1; 0.25 1];

H = homographic_matrix(pts_o, pts_t);

