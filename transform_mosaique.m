function new_mosaique = transform_mosaique(mosaique,  H_for_boite, H_for_browse)

    [h, w, c]= size(mosaique.image);

    if c ~= 3
        error("transform_mosaique : handle only images with 3 channel color.");
    end

    %% get boit

    corners = zeros(4, 2);
    corners(1,:) = homographic_get_pt(H_for_boite, [1, 1]);
    corners(2,:) = homographic_get_pt(H_for_boite, [w, 1]);
    corners(3,:) = homographic_get_pt(H_for_boite, [w, h]);
    corners(4,:) = homographic_get_pt(H_for_boite, [1, h]);

    x_min = min(corners(:, 1));
    x_max = max(corners(:, 1));
    y_min = min(corners(:, 2));
    y_max = max(corners(:, 2));

    new_mosaique.boite = [x_min-1, y_min-1; x_max-1, y_max-1];

    %% get masque & image

    new_h = y_max-y_min+1;
    new_w = x_max-x_min+1;

    new_mosaique.masque = zeros(new_h, new_w);
    new_mosaique.image = zeros(new_h, new_w, c);

    for i=1:new_h
        for j=1:new_w
            new_pt = homographic_get_pt(H_for_browse, [j+new_mosaique.boite(1, 1), i+new_mosaique.boite(1,2)]);
            if 1 <= new_pt(1) && new_pt(1) <= w && 1 <= new_pt(2) && new_pt(2) <= h
                new_mosaique.image(i, j, :) = mosaique.image(new_pt(2), new_pt(1), :);
                new_mosaique.masque(i, j) = 1;
            else
                new_mosaique.image(i, j, :) = 0 * mosaique.image(1, 1, :); % pour garder le format d'image (rgb ou niveau de gris)
                new_mosaique.masque(i, j) = 0;
            end
        end
    end

end
