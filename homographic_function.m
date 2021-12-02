function  homographic_function(origine_path,panel_path)



origine = imread(origine_path);
[h_origine,w_origine,z_origine] = size(origine);
panel = imread(panel_path);
output = zeros(h_origine,w_origine,z_origine);

figure,
imshow(origine);
pts_o = ginput(4);
title(origine_path);

figure,
imshow(panel);
pts_t = ginput(4);
title(panel_path);

H = homographic_matrix(pts_o,pts_t);

for i = 1:h_origine
    for j = 1:w_origine
        output(i,j,:) = getpx(H,[i,j],origine,panel); 
    end
end

figure,
imshow(output);
title("output");





end

