function r = manipulateImg(img,res)
imgGRS = rgb2gray(img);

% Converto l'immagine in B/N
imgBW = imbinarize(imgGRS);

% Calcolo il negativo dell'immagine se questa è troppo chiara
% utile per le operazioni successive

% Prima somma per le colonne, seconda per le righe
nPixelW = sum(sum(imgBW));
if(nPixelW >= res/2)
    imgBW_old = imgBW;
    imgBW = imcomplement(imgBW);
end
%% Elimino difetti nell'immagine
% utile per eliminare artefatti grafici (es: ombre)
% Filtriamo in base al perimetro delle sagome bianche su sfondo nero.
% pxToDel = 50;        % Soglia di pixel da considerare come rumore.
% % pxToDel = 40000;      % Soglia per Ombra
% nPixelB = maxRes(1)*maxRes(2)-nPixelW;
% pxToDel = round(nPixelW/nPixelB*10000)
% % imgBW2 = bwareaopen(imgBW,pxToDel);
imgBW2 = bwpropfilt(imgBW,'perimeter',1);
%% Applico Maschere di Dilatazione ed Erosione
% Definisco operatore morfologico: Applico maschere quadrate
mask=strel('disk',100,8);
%imgBW3=imdilate(imgBW2,mask);
mask1=strel('square',5);
% imclose() applica operatori morfologici su immagini in b/n  o greyscale
imgBW3 = imclose(imgBW2, mask);
imgBW3 = imopen(imgBW3, mask1);
%% Eliminazione "buchi" dall'immagine
% permette di eliminare artefatti grafici simili a riflessi sulla
% superficie dell'oggetto, o buchi nello stesso.
imgBW4 = imfill(imgBW3,'holes');
r={imgGRS,imgBW,imgBW2,imgBW3,imgBW4};
end
