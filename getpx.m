function px = getpx(H,pt,origine,panel)

%[h_origine,w_origine,z_origine] = size(origine);
[h_panel,w_panel,~] = size(panel);


coor_homogene_origine = [pt(1);pt(2);1];

coor_homogene_panel = round(H*coor_homogene_origine);

%fprintf("(%f, %f) -> (%f, %f)\n", coor_homogene_origine(1), coor_homogene_origine(2), coor_homogene_panel(1), coor_homogene_panel(2));

isinside_panel = (...
    (coor_homogene_panel(1) > 0 && w_panel >= coor_homogene_panel(1)) && ...
    (coor_homogene_panel(2) >0 && h_panel >= coor_homogene_panel(2))...
);

if( isinside_panel)
    %fprintf("isinside_panel\n");
    px = panel(coor_homogene_panel(2), coor_homogene_panel(1), :);
else
    px = origine(coor_homogene_origine(2), coor_homogene_origine(1), :);
end



end

