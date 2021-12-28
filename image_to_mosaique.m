function mosaique = image_to_mosaique(image)

    [h, w] = size(image);

    mosaique.image = image;
    mosaique.masque = ones(h, w);
    mosaique.boite = [0, 0; w-1, h-1]; % Coordonées géographique

end
