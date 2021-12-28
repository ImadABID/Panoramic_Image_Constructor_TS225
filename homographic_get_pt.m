function new_pt = homographic_get_pt(H, pt)
    pt = double(pt);
    new_pt = round([(H(1,1)*pt(1)+H(1,2)*pt(2)+H(1,3))/(H(3,1)*pt(1)+H(3,2)*pt(2)+H(3,3)),(H(2,1)*pt(1)+H(2,2)*pt(2)+H(2,3))/(H(3,1)*pt(1)+H(3,2)*pt(2)+H(3,3))]);

end

