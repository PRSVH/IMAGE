function afficher_fenetre(s,m)
    // taille du signal
    M = size(s,2);
    for i =m+1:M-m
        disp(s(i-m:i+m))
    end

endfunction



function s2 = moyenne(s1, m)
    // taille du signal 
    M = size(s1,2);
    // on initialise un vecteur de zeros 
    // de meme taille que s1
    s2 = zeros(s1);
    for u = m+1:M-m
        a=mean(s1(u-m:u+m));
        s2(u)=a
    end
    //disp(s2)
endfunction


function s2 = moyenne_W(s1, W)
    // taille du signal
    M = size(s1,2);
    // m est tel que la taille du filtre est
    // 2m+1
    m = (size(W,2)-1)/2;
    // on initialise un vecteur de zeros 
    // de meme taille que s1
    s2 = zeros(s1);
    for i =m+1:M-m
        a=mean(s1(u-m:u+m));
        s2(u)=a
    end
    //disp(s2)
endfunction

//W = 1/3*[1, 1, 1]
//s = [zeros(1,5), ones(1,5)*3];
//disp(moyenne_W(s,W))


function G = W_gauss(sigma)
    // seuil pour definir L
    eps = 10^(-3);
    ////// A COMPLETER //////
    // Le tableau G en sorti doit etre 
    // horizontal
    deff("y=f(x)","y=exp(-(x.^2)./(2.*(sigma.^2)))");
    L=floor(sigma*sqrt(-2*log(eps)));
        
    W=-L:L
    W=exp(-(W.^2)./(2*sigma^2));
    G=W/sum(W);
    //G(0)=f(0)
        
endfunction

sigma = 2;
G = W_gauss(sigma);
disp(G)




