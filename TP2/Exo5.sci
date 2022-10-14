exec('init_tp_image.sce');
im_noise = lire_imageBMPgris('papillon_noise.bmp');
// on extrait la 128-eme ligne de l'image
signal_noise = im_noise(128, :);
// affichage sur la figure 0
scf(11);clf(11);plot(signal_noise);title("Signal noise")
// comparaison avec le signal non bruite
im = lire_imageBMPgris('papillon.bmp');
// on extrait la 128-eme ligne de l'image
signal = im(128, :);
// affichage sur la figure 1
scf(1);clf(1);plot(signal);
