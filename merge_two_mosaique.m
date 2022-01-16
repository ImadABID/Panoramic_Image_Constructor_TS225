function new_mosaique = merge_two_mosaique(mosaique1, mosaique2)

    %% get boite
    new_mosaique.boite = [ ...
        min(mosaique1.boite(1, 1), mosaique2.boite(1, 1)), min(mosaique1.boite(1, 2), mosaique2.boite(1, 2)); ...
        max(mosaique1.boite(2, 1), mosaique2.boite(2, 1)), max(mosaique1.boite(2, 2), mosaique2.boite(2, 2))
    ];

    %% init masque & image
    new_h = new_mosaique.boite(2, 2) - new_mosaique.boite(1, 2) + 1;
    new_w = new_mosaique.boite(2, 1) - new_mosaique.boite(1, 1) + 1;

    new_mosaique.masque = zeros(new_h, new_w);
    new_mosaique.image = zeros(new_h, new_w, 3);

    %% Populate masque & image

    % coordonnées matercielles
    
    x_m1_min = mosaique1.boite(1,1) - new_mosaique.boite(1,1) + 1;
    y_m1_min = mosaique1.boite(1,2) - new_mosaique.boite(1,2) + 1;
    x_m1_max = mosaique1.boite(2,1) - new_mosaique.boite(1,1) + 1;
    y_m1_max = mosaique1.boite(2,2) - new_mosaique.boite(1,2) + 1;

    x_m2_min = mosaique2.boite(1,1) - new_mosaique.boite(1,1) + 1;
    y_m2_min = mosaique2.boite(1,2) - new_mosaique.boite(1,2) + 1;
    x_m2_max = mosaique2.boite(2,1) - new_mosaique.boite(1,1) + 1;
    y_m2_max = mosaique2.boite(2,2) - new_mosaique.boite(1,2) + 1;

    % populate with mosaique1
    new_mosaique.masque(y_m1_min:y_m1_max, x_m1_min:x_m1_max) = mosaique1.masque;

    new_mosaique.image(y_m1_min:y_m1_max, x_m1_min:x_m1_max, :) = mosaique1.image;
    
    % populate with mosaique2
    new_mosaique.masque(y_m2_min:y_m2_max, x_m2_min:x_m2_max) = ...
    new_mosaique.masque(y_m2_min:y_m2_max, x_m2_min:x_m2_max) + mosaique2.masque;

    new_mosaique.image(y_m2_min:y_m2_max, x_m2_min:x_m2_max, :) = ...
    new_mosaique.image(y_m2_min:y_m2_max, x_m2_min:x_m2_max, :) + mosaique2.image;

    % normalizing
    new_mosaique.image(:,:,1) = new_mosaique.image(:,:,1) ./ (new_mosaique.masque + (new_mosaique.masque == 0));
    new_mosaique.image(:,:,2) = new_mosaique.image(:,:,2) ./ (new_mosaique.masque + (new_mosaique.masque == 0));
    new_mosaique.image(:,:,3) = new_mosaique.image(:,:,3) ./ (new_mosaique.masque + (new_mosaique.masque == 0));

    new_mosaique.masque = new_mosaique.masque ./ (new_mosaique.masque + (new_mosaique.masque == 0));

end
