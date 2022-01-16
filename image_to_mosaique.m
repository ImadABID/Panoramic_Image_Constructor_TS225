function mosaique = image_to_mosaique(image)

    [h, w, c] = size(image);

    if c ~= 3
        mosaique.image = double(image);
        mosaique.image(:, :, 2) = double(image);
        mosaique.image(:, :, 3) = double(image);
    else
        mosaique.image = double(image);
    end

    
    mosaique.masque = ones(h, w);
    mosaique.boite = [0, 0; w-1, h-1]; % Coordonées géographique

end
