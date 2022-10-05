function [ret,maxRes]=preprocess(file,noise)
imgRGB = imread(file);  % Caricamente Immagine
rng('default')
%% Applico rumore per testing sulla robustezza
imgRGB = imnoise(imgRGB,'salt & pepper', noise);
%% Pre-Processamento: Compressione dell'immagine
% Per mantenere un rapporto di grandezze tra l'aspetto dell'immagine in
% ingresso quella post compressione, una delle due dimensioni viene decisa
% dalla libreria in automatico.
maxRes = [480, 640];        % Risoluzione massima desiderata dell'immagine
width = size(imgRGB, 2);    % Larghezza iniziale dell'immagine
height = size(imgRGB, 1);   % Altezza iniziale dell'immagine
if (height > maxRes(1) || width > maxRes(2))
    imgRGB = imresize(imgRGB, [maxRes(1) maxRes(2)]);
end
width = size(imgRGB, 2);    % Larghezza dell'immagine post-compressione
height = size(imgRGB, 1);   % Altezza dell'immagine post-compressione
res = width*height;         % Risoluzione dell'immagine post-compressione
center = [floor((width+1)/2), floor((height+1)/2)];
ret={center,imgRGB,res};
end
