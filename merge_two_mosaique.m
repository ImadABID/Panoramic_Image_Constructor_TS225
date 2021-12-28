function new_mosaique = merge_two_mosaique(mosaique1, mosaique2)

    %% get boite
    new_mosaique.boite = [ ...
        min(mosaique1.boite(1, 1), mosaique2.boite(1, 1)), min(mosaique1.boite(1, 2), mosaique2.boite(1, 2)); ...
        max(mosaique1.boite(2, 1), mosaique2.boite(2, 1)), max(mosaique1.boite(2, 2), mosaique2.boite(2, 2))
    ];

    x_t = mosaique1.boite(1,1) - new_mosaique.boite(1,1);
    y_t = mosaique1.boite(1,2) - new_mosaique.boite(1,2);
   
    
    [h1,w1] = size(mosaique1.masque);
    [h2,w2] = size(mosaique2.masque);

    %% get masque & image
    new_h = new_mosaique.boite(2, 2) - new_mosaique.boite(1, 2)+1;
    new_w = new_mosaique.boite(2, 1) - new_mosaique.boite(1, 1)+1;

    new_mosaique.masque = zeros(new_h, new_w);
    new_mosaique.image = zeros(new_h, new_w);

    %populate mosaique1
    new_mosaique.masque(1+y_t:h1+y_t, 1+x_t:w1+x_t) = ...
    new_mosaique.masque(1+y_t:h1+y_t, 1+x_t:w1+x_t) + mosaique1.masque;

    new_mosaique.image(1+y_t:h1+y_t,1+x_t:w1+x_t) = ...
    new_mosaique.image(1+y_t:h1+y_t,1+x_t:w1+x_t) + mosaique1.image;
    
    %populate mosaique2
    new_mosaique.masque(mosaique2.boite(1,2)+1+y_t:mosaique2.boite(1,2)+y_t+h2, mosaique2.boite(1,1)+1+x_t:mosaique2.boite(1,1)+w2+x_t) = ...
    new_mosaique.masque(mosaique2.boite(1,2)+1+y_t:mosaique2.boite(1,2)+h2+y_t, mosaique2.boite(1,1)+1+x_t:mosaique2.boite(1,1)+w2+x_t) + mosaique2.masque;

    new_mosaique.image(mosaique2.boite(1,2)+1+y_t:mosaique2.boite(1,2)+h2+y_t, mosaique2.boite(1,1)+1+x_t:mosaique2.boite(1,1)+w2+x_t) = ...
    new_mosaique.image(mosaique2.boite(1,2)+1+y_t:mosaique2.boite(1,2)+h2+y_t, mosaique2.boite(1,1)+1+x_t:mosaique2.boite(1,1)+w2+x_t) + mosaique2.image;

    %normalizing
    new_mosaique.image = new_mosaique.image ./ (new_mosaique.masque + (new_mosaique.masque == 0));
    new_mosaique.masque = new_mosaique.masque ./ (new_mosaique.masque + (new_mosaique.masque == 0));

end
