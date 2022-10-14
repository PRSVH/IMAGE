// chargement des fonctions necessaires au TP
exec("init_tp_image.sce",-1);

// définition de la fonction ramenant les valeurs entre 0 et 255
deff('z = min0_max255(y)','z=min(max(y,0),255)');

////// Histogramme cummulé /////

function Hist=hist_cumul(im)
    // classes pour le calcul de l'histogramme
    classes = [-0.1, linspace(0,255,256)];
    // calcul de l'histogramme
    hist = histc(classes, im, normalization=%f);
    // calcul de l'histogramme cumulé
    Hist = zeros(1,256);
    for i = 1: 255
        for j=1:i
            Hist(1,i) = Hist(1,i) + hist(1,j)
        end
    end
endfunction

////// correction affine ///////
deff("q = f(p)","q = ((255) ./(p1-p0)) .* (p - p0)");
function im2=T_affine(im, p0, p1)
    im2 = f_affine(im, p0, p1);     // appliquer la fonction
    im2 =  min0_max255(im2); // repasser à des valeurs entre 0 et 255 
endfunction

/////// calcul de p0 et p1 à partir du seuil //////
function [p0, p1]=calcul_p0p1(im, s)
    p0 = 0;
    p1 = 255;
    cumul = Hist(im)
    disp(cumul)
    [M,N] = size(im);
    prop = cumul ./ (M.*N)
    for i= 1:256
        for j =1:256
            p=im(i,j)
            if Hist(p)/M.N <s./100 
                then p0 = im(i,j)
            end
            //if Hist(p)/M.N> 1-s./100 
                //then p1 =im(i,j)
            //end
        end
    end
    i = 256
    j = 256
    while i >= 1 
        while j >= 1
            if Hist(p)/M.N < 1-s./100 then
                p1 = im(i,j)
            j = j-1
         i = i-1
        end
    end
    disp(p0)
    disp(p1)
        
    end
     
endfunction

////// Egalisation d'histogramme ///////
function im_out=hist_egal(im)
    // calcul de l'histogramme cumulé
    H = hist_cumul(im);
    // on applique la transformation pixel par pixel
    [M,N] = size(im);
    im_out = zeros(M,N);
    // A COMPLETER
endfunction

////// seuillage //////

deff("im3 = produit(im1,im2)","im3 = im1.*im2/255");

function im2=seuillage(im, s)
    [M,N] = size(im);
    im2 = zeros(M,N);
    // A COMPLETER
endfunction

exec('transformations.sci', -1)
im = lire_imageBMPgris('desert.bmp');
// calcul de l'histogramme cumul´e
Hist = hist_cumul(im);
// affichage de l'histogramme cumul´e
plot2d3(Hist);
