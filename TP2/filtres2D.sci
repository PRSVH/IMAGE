// chargement des fonctions necessaires au TP
exec("init_tp_image.sce",-1);



function afficher_fenetre2D(im,m)
    // taille de l'image
    [M,N] = size(im);
    for u = m+1:M-m
        for v = m+1:N-m
            disp(im(u-m:u+m,v-m:v+m));
        end
    end
endfunction
im = diag([1,2,3,4]);
// affichage du tableau
disp(im);
// affichage des fenetres de taille 2m+1 = 3
afficher_fenetre2D(im, 1);

function im2 = moyenne2D(im1, m)
    // taille de l'image
    [M,N] = size(im1);
    // tableau de zeros 
    // de la meme taille que im1
    im2 = zeros(im1);
    for u = m+1 : N-m
        for v = m+1 :N-m
            im2(u,v)=floor((mean(im1(u-m:u+m,v-m:v+m))));
        end
    end
endfunction

function im2 = moyenne2D_W(im1, W)
    // taille de l'image
    [M,N] = size(im1);
    // m est tel que la taille du filtre
    // dans une dimension est 2m+1
    m = (size(W,1)-1)/2;
    im2 = zeros(im1);
    for u = m+1:M-m
        for v = m+1:N-m
            im2(u,v)=floor((mean(im1(u-m:u+m,v-m:v+m))));
        end
    end
endfunction

exec('init_tp_image.sce');

// on initialise l'image avec un fond blanc
im1 = ones(60,60)*255;
// on construit le carre noir
im1(25:35, 25:35) = 0;
// on affiche l'image
afficher_image(im1);
// application du filtre moyenne
im2 = moyenne2D(im1, 1);
afficher_image(im2);

function G2D = W_gauss_2D(sigma)
    // Vous pouvez construire le filtre 2D
    // a partir du filtre 1D
    exec('filtres1D.sci');
    G1D = W_gauss(sigma);
    M = size(G1D,2);
    G2D=zeros(M,M);
    for x = 1:M
        for y = 1:M
            G2D(x,y)=G1D(x)*G1D(y);
        end
    end
endfunction


