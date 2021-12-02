function H = homographic_matrix(pts_o, pts_t)
    
    %
    % pts_o : [x1, y1; x2, y2; x3, y3; x3, y3]
    % pts_t : [x1, y1; x2, y2; x3, y3; x3, y3]
    %
    
    A = zeros(8, 8);
    B = zeros(8, 1);
    
    for pt_index=1:1:4
        A(2*(pt_index-1)+1, :) = [-pts_o(pt_index,1), -pts_o(pt_index,2), -1, 0, 0, 0, pts_o(pt_index,1)*pts_t(pt_index,1), pts_t(pt_index,1)*pts_o(pt_index,2)];
        A(2*pt_index, :) = [0, 0, 0, -pts_o(pt_index,1), -pts_o(pt_index,2), -1, pts_o(pt_index,1)*pts_t(pt_index,2), pts_o(pt_index,2)*pts_t(pt_index,2)];
        
        B(2*(pt_index-1)+1, 1) = - pts_t(pt_index, 1);
        B(2*pt_index, 1) = - pts_t(pt_index, 2);
    end

    h_vect = A \ B;
    

    
    h_vect = [h_vect; 1];
    H = reshape(h_vect, 3, 3)';

end