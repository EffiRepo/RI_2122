clc
clear 
close all
addpath(genpath('./'));

%%
% variabili simboliche
syms x rect(x,x0,y0,m) rect2p(x,x0,y0,x1,y1)  
rect(x,x0,y0,m)=m*(x-x0)+y0;
rect2p(x,x0,y0,x1,y1) = (x-x0)/(x1-x0)*(y1-y0)+y0;
%% Scelta delle immagini
obsTarget = 4;
noise = 0.0007;
%%
switch(obsTarget)
     case 8
        filename = 'Immagini/verticalCalc.jpg';
     case 7
        filename = 'Immagini/verticalCalcB.jpg';
    case 6
        filename = 'Immagini/horizontalCalcB.jpg';
    case 5
        filename = 'Immagini/horizontalCalcShadow.jpg';
    case 4
        filename = 'Immagini/horizontalCalcW.jpg';
    case 3
        filename = 'Immagini/dadoEsagono.jpg';
    case 2
        filename = 'Immagini/triangolo.jpg';
    case 1
        filename = 'Immagini/quadrato.jpg';

    case 0
        filename = 'Immagini/sfera.jpg';
    otherwise
        disp("No image path avaiable");
end
%% Preprocessamento dell'immagine
% - Caricamento dell'imaggine
% - Aggiunta di rumore tramite il comando imnoise('salt & pepper')
% - Compressione dell'immagine per una migliore analisi
% Input:  nome del file da caricare, rumore
% Output: cellArray {centro immagine,immagine post-processata, risoluzione}
[preprocessdata,maxRes]=preprocess(filename,noise);
center=preprocessdata{1};
imgRGB=preprocessdata{2};
res=preprocessdata{3};
%% Manipolazione Immagine
% - Conversione immagine in B/N
% - Complementare dell'immagine
% - Riduzione dei difetti nell'immagine
% - Applicazione di maschere di dilatazione e erosione
% - Eliminazione di buchi nell'immagine
% Input: immagine
% Output: Immagine manipolata
imgM=manipulateImg(imgRGB,res);
% Visualizzazione immagine modificata
figure(1)
subplot(3,2,1)
imshow(imgRGB)
title("Immagine con rumore")

subplot(3,2,2)
imshow(imgM{1})
title("Immagine in scala di grigio")

subplot(3,2,3)
imshow(imgM{2})
title("Immagine in BW")

subplot(3,2,4)
imshow(imgM{3})
title("Immagine senza rumore")

subplot(3,2,5)
imshow(imgM{4})
title("Immagine con erosione e dilatazione")

subplot(3,2,6)
imshow(imgM{5})
title("Immagine senza buchi")

%% Misure geometriche
% - Calcolo di area e perimetro dell'oggetto nell'immaagine
% - Definizione della forma dell'immagine tramite apotema
% - Identificazione delle diagonali dell'oggetto tramite trasformata di
% Radon
% - Rappresentazione dell'ellisse che meglio circoscrive l'oggetto
% Input: - Immagine
%        - Centro dell'immagine
% Output:   - Area
%           - Perimetro
%           - Forma
%           - Orientamento
%           - Diagonali
%           - Centro dell'ellisse
%           - Asse maggiore
%           - Asseminore

[objArea,objPerim,objShape,orient,diag,obb,...
    z, a, b, alpha]=computeGeometric(imgM{end},center);


%% Grafico contorno dell'oggetto
figure(4)
imshow(imgM{end},'Border','tight');
hold on
plot(obb(:,2),obb(:,1),'g','LineWidth',3,'DisplayName','contorno');

phi = linspace(0,2*pi,50);
cosphi = cos(phi);
sinphi = sin(phi);

xbar = z(1);
ybar = z(2);

a = a/2;
b = b/2;

theta = pi*alpha/180;
R = [ cos(theta)   sin(theta)
     -sin(theta)   cos(theta)];

xy = [a*cosphi; b*sinphi];
xy = R*xy;

xx = xy(1,:) + xbar;
yy = xy(2,:) + ybar;

plot(xx,yy,'r','LineWidth',2,'DisplayName','Ellisse');

%% Disegno assi maggiori dell'oggetto
ang=orient
% aggiungo sfasamento trovato empiricamente dai plot precedenti per far
% coincidere lo 'zero' con quello da noi considerato.
majorax=rect(x,z(1),z(2),ang);
point=subs(majorax,x,z(1)+linspace(-a/2,a/2));
% plot(z(1)+linspace(-a/2,a/2),point)
plot(z(1),z(2),'*g','DisplayName','Centro assi')
% minorax=rect(x,z(1),z(2),-1/ang);
% point=subs(minorax,x,z(1)+linspace(-b,b));
% h=plot(z(1)+linspace(-b,b),point);

hold on
%% Disegno Baricentro dell'oggetto
plot(z(1),z(2),'bo','MarkerSize',10,'DisplayName','Baricentro')
%% Visualizzo Diagonali dell'oggetto
lineOrient =  z(2) + tand(orient) * ( x  - z(1) ) ;
fplot(lineOrient,'y', 'LineWidth', 2.5,'DisplayName','Orientamento');
plot(z(1)*ones(1,maxRes(1)),linspace(0,maxRes(1),maxRes(1)),'--r','linewidth',2,'DisplayName','R0')
plot(linspace(0,maxRes(2),maxRes(2)),z(2)*ones(1,maxRes(2)),'--r','linewidth',2,'DisplayName','R0')
for i =1:size(diag,2)
    eq = diag{i};
    str="diag("+i+")";
    fplot(eq, 'b','LineWidth', 1.5,'DisplayName',str);
    hold on
end
legend
%% Report dell'Identificazione
fprintf("Area: %f, Perimetro: %f\n", objArea, objPerim);
fprintf("Forma dell'Oggetto: %s\n", objShape);
fprintf("Baricentro dell'Oggetto: X[bc] = %f, Y[bc] = %f\n", z(1), z(2));
fprintf("Orientamento dell'Oggetto: %f°\n", -ang);



