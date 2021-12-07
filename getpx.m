function px = getpx(H,pt,origine,panel)

[h_panel,w_panel,~] = size(panel);


coor_homogene_origine = [pt(1);pt(2);1];
coor_homogene_panel = round([(H(1,1)*pt(1)+H(1,2)*pt(2)+H(1,3))/(H(3,1)*pt(1)+H(3,2)*pt(2)+H(3,3)),(H(2,1)*pt(1)+H(2,2)*pt(2)+H(2,3))/(H(3,1)*pt(1)+H(3,2)*pt(2)+H(3,3))]);


isinside_panel = (...
    (coor_homogene_panel(1) > 0 && w_panel >= coor_homogene_panel(1)) && ...
    (coor_homogene_panel(2) >0 && h_panel >= coor_homogene_panel(2))...
);


if( isinside_panel)
      px = panel(coor_homogene_panel(2), coor_homogene_panel(1),:);
else
     px = origine(coor_homogene_origine(2), coor_homogene_origine(1),:); 
end

end

