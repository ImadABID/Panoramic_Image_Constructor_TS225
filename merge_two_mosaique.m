function new_mosaique = merge_two_mosaique(mosaique1, mosaique2)

    %% get boite
    new_mosaique.boite = [ ...
        min(mosaique1.boit(1, 1), mosaique2.boit(1, 1)), min(mosaique1.boit(1, 2), mosaique2.boit(1, 2)); ...
        max(mosaique1.boit(2, 1), mosaique2.boit(2, 1)), max(mosaique1.boit(2, 2), mosaique2.boit(2, 2))
    ];

    %% get masque & image
    new_h = new_mosaique.boite(2, 2) - new_mosaique.boite(1, 2) + 1;
    new_w = new_mosaique.boite(2, 1) - new_mosaique.boite(1, 1) + 1;

    new_mosaique.masque = zeros(new_h, new_w);
    new_mosaique.image = zeros(new_h, new_w);

    new_mosaique.masque(mosaique1.boit(1,2)+1:mosaique1.boit(2,2)+1, mosaique1.boit(1,1)+1:mosaique1.boit(1,2)+1) = ...
    new_mosaique.masque(mosaique1.boit(1,2)+1:mosaique1.boit(2,2)+1, mosaique1.boit(1,1)+1:mosaique1.boit(1,2)+1) + mosaique1.masque;

    new_mosaique.image(mosaique1.boit(1,2)+1:mosaique1.boit(2,2)+1, mosaique1.boit(1,1)+1:mosaique1.boit(1,2)+1) = ...
    new_mosaique.image(mosaique1.boit(1,2)+1:mosaique1.boit(2,2)+1, mosaique1.boit(1,1)+1:mosaique1.boit(1,2)+1) + mosaique1.image;

    new_mosaique.masque(mosaique2.boit(1,2)+1:mosaique2.boit(2,2)+1, mosaique2.boit(1,1)+1:mosaique2.boit(1,2)+1) = ...
    new_mosaique.masque(mosaique2.boit(1,2)+1:mosaique2.boit(2,2)+1, mosaique2.boit(1,1)+1:mosaique2.boit(1,2)+1) + mosaique2.masque;

    new_mosaique.image(mosaique2.boit(1,2)+1:mosaique2.boit(2,2)+1, mosaique2.boit(1,1)+1:mosaique2.boit(1,2)+1) = ...
    new_mosaique.image(mosaique2.boit(1,2)+1:mosaique2.boit(2,2)+1, mosaique2.boit(1,1)+1:mosaique2.boit(1,2)+1) + mosaique2.image;

    
    new_mosaique.image = new_mosaique.image ./ (new_mosaique.masque + (new_mosaique.masque == 0));
    new_mosaique.masque = new_mosaique.masque ./ (new_mosaique.masque + (new_mosaique.masque == 0));

end
