function mosaique = image_to_mosaique(image)

    [h, w] = size(image);

    mosaique.image = image;
    mosaique.masque = ones(h, w);
    mosaique.boite = [1, 1; w, h];

end
