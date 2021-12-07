function  output = homographic_function(origine,panel,pts_o)

[h_origine,w_origine,z_origine] = size(origine);
[h_panel,w_panel,~] = size(panel);

output = zeros(h_origine,w_origine,z_origine);

pts_t = [...
    1        , 1; ...
    w_panel  , 1; ...
    w_panel  , h_panel; ...
    1        , h_panel...
];

H = homographic_matrix(pts_o,pts_t);

output = double(output);
origine = double(origine);
panel = double(panel);

for i = 1:h_origine
    for j = 1:w_origine
        output(i,j,:) = getpx(H, [j, i], origine, panel); 
    end
end

output = uint8(output);







end

