function  homographic_function(origine_path,panel_path)



origine = imread(origine_path);
[h_origine,w_origine,z_origine] = size(origine);

panel = imread(panel_path);
[h_panel,w_panel,~] = size(panel);

output = zeros(h_origine,w_origine,z_origine);

figure,
imshow(origine);
pts_o = ginput(4);
title(origine_path);

%figure,
%imshow(panel);
%title(panel_path);
pts_t = [...
    1        , 1; ...
    w_panel  , 1; ...
    w_panel  , h_panel; ...
    1        , h_panel...
];

H = homographic_matrix(pts_o,pts_t);
%H = homographic_matrix(pts_t, pts_o);

for i = 1:h_origine
    for j = 1:w_origine
        output(i,j,:) = getpx(H, [j, i], origine, panel); 
    end
end

output = uint8(output);

figure,
imshow(output);
title("output");





end

