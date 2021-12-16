function new_mosaique = transform_mosaique(mosaique, H_to_new_mosaique)

    [h, w]= size(mosaique.image);

    %% get boit

    corners = zeros(4, 2);
    corners(1,:) = homographic_get_pt(H_to_new_mosaique, [1, 1]);
    corners(2,:) = homographic_get_pt(H_to_new_mosaique, [w, 1]);
    corners(3,:) = homographic_get_pt(H_to_new_mosaique, [w, h]);
    corners(4,:) = homographic_get_pt(H_to_new_mosaique, [1, h]);

    x_min = min(corners(:, 1));
    x_max = max(corners(:, 1));
    y_min = min(corners(:, 2));
    y_max = max(corners(:, 2));

    new_mosaique.boite = [x_min, y_min; x_max, y_max];

    %% get masque & image
    H_to_old_mosaique = inv(H_to_new_mosaique); % le masque ne contienne que des uns.

    new_h = y_max-y_min+1;
    new_w = x_max-x_min+1;

    new_mosaique.masque = zeros(new_h, new_w);
    new_mosaique.image = zeros(new_h, new_w);

    for i=1:new_h
        for j=1:new_w
            new_pt = homographic_get_pt(H_to_old_mosaique, [j, i]);
            if 1 >= new_pt(1) && new_pt(1) <= new_w && 1 >= new_pt(2) && new_pt(2) <= new_h
                new_mosaique.image(i, j, :) = mosaique.image(new_pt(2), new_pt(1), :);
                new_mosaique.masque(i, j, :) = 1;
            else
                new_mosaique.image(i, j, :) = 0 * mosaique.image(1, 1, :); % pour garder le format d'image (rgb ou niveau de gris)
                new_mosaique.masque(i, j, :) = 0;
            end
        end
    end

end
