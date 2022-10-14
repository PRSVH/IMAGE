// calcule la norme du gradient d'une image
// le tableau imn en sortie peut comporter 
// des valeurs non entieres
function imn = norme_gradient(im)
    // tableau imn initialise a la meme 
    // taille que l'image
    imn = zeros(im);
    Dx = 0.5*[-1, 0, 1] 
    Dy = 0.5*[1; 0; -1]
    imx = conv2(im, Dx, "same");
    imy = conv2(im, Dy, "same");
    [M,N]= size(im);
    for u= 1:M
        for v = 1:N
            imn(u,v)=sqrt(imx(u,v).^2 + imy(u,v).^2);;
        end
    end
    
endfunction


// determine les contours :
// valeur = 0 partout
// sauf pour pixels ou la norme du gradient est superieure 
// a un seuil, dans ce cas valeur = 255
function imc = contours_seuil(im, seuil)
    imn = norme_gradient(im);
    imc = zeros(im);
    [M,N]= size(im);
    for u = 1:M
        for v = 1:N
            if imn(u,v)<seuil then
                imc(u,v)=0
            else 
                imc(u,v)=255
            end
            
            
    end
    //// A COMPLETER ////
endfunction




// identifie le seuil tel qu'il y a
// un pourcentage p des pixels pour 
// lesquels la norme du gradient est 
// inferieure a ce seuil
function seuil = trouver_seuil(im, p)
    G = norme_gradient(im);
    H = hist_cumul(G);
    v = 1
    seuil = 1;
    while v<= 256
        if H(v)./H(256) > p then
            v = seuil 
            break
        end
        v = v + 1
    end  
endfunction

// determine le seuil a partir d'un 
// pourcentage p
function imc = contours_p(im, p)
    G = norme_gradient(im);
    imc = contours_seuil(im, trouver_seuil(im, p));
endfunction

// calcul de l'histogramme cumule
function Hist = hist_cumul(im)
    // calcul de l'histogramme
    classes = [-0.1, linspace(0,255,256)];
    hist = histc(classes, im, normalization=%f);
    Hist = zeros(256)
    Hist(1) = hist(1)
    for i = 2:256
        Hist(i) = Hist(i-1) + hist(i) 
    end
endfunction

// renvoie une image 500x500 avec un disque blanc
// sur fond noir
function im = disque()
    im = zeros(500, 500)
    for i = 1:500
        for j = 1:500
            if abs(i-250)^2 + abs(j-250)^2 < 150^2 then
                im(i,j) = 255
            end
        end
    end
endfunction
deff("q = f(p)","q = ((255) ./(p1-p0)) .* (p - p0)");
function im2=T_affine(im, p0, p1)
    im2 = f_affine(im, p0, p1);     // appliquer la fonction
    im2 =  min0_max255(im2); // repasser à des valeurs entre 0 et 255 
endfunction
exec('init_tp_image.sce');
im = lire_imageBMPgris('sweets.bmp');
Hist = hist_cumul(im);
// affichage de l'histogramme cumul´e
//plot2d3(Hist);
//p0=90;
//p1=190;
//im2= T_affine(im,p0,p1);
//afficher_image(im);
//imn = norme_gradient(im);
//afficher_image(int(imn));
//p = 0.8;
//im = lire_imageBMPgris('chat.bmp');
//seuil = trouver_seuil(im, p);
//disp(seuil);
//Hist = hist_cumul(im);
//plot2d3(Hist)

//im = lire_imageBMPgris('chat.bmp');
//imc = contours_seuil(im, seuil);
//afficher_image(imc);
//afficher_image(im);
//afficher_image(contours_p(conv2(im, W_gauss_2D(sigma), "same"), p));

// image intialement noire
N = 40;
M = 2*N
im = zeros(N,M);
// l'image est compos´ee de trois bandes de taille n:
n = floor(M/3)
// le premier tiers reste noir
// le deuxi`eme tiers est un d´egrad´e avec un fort gradient
// de 30 `a 255
for j = n:2*n
im(:, j) = 30 + ((j - n)/n)^4*225;
end
// le dernier tiers est `a 255
im = 
im(:, 2*n+1:M) = 255;
// lissage gaussien
G = W_gauss(0.5);
im = conv2(im, G);
scf() ; plot(im(N/2, :))
afficher_image(contours_p(conv2(im, W_gauss_2D(sigma), "same"), p));
disp(norme_gradient(im));

for i = 1:M
    if im(i,30)
end
