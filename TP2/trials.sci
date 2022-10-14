function G = W_gauss(sigma)
    // seuil pour definir L
    eps = 1e-3;
    deff("y = f(x)", "y = exp(-((x.^2)./(2*(sigma.^2))))")
    
    L = round(sigma*sqrt(-2*log(eps)))
    G= zeros(1,(1 + 2*L))
    for i = 1:L
            G(i) = f(i)
        
    end
    P= -1 .* G 
    disp(P)
    G = [P,f(0),G]
    disp(G)
endfunction
sigma = 0.5;
G = W_gauss(sigma);
