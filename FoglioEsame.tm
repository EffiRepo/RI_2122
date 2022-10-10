<TeXmacs|2.1.2>

<style|<tuple|generic|italian>>

<\body>
  <doc-data|<doc-title|Foglio Esame>>

  <\itemize>
    Lista procedure libreria (Nome procedura, args_in,args_out):

    <item><math|prod_vect<around*|(|vectA,vectB|)>\<rightarrow\>prodotto
    vettoriale>;

    <item><math|anticomm<around*|(|vectA,vectB|)>\<rightarrow\>boolean
    b<around*|{|true\<rightarrow\>verificata,false\<rightarrow\>non
    verificata|}>>

    <item><math|rot2<around*|(|scalar|)>\<rightarrow\>R<rsup|2\<times\>2>>

    <item><math|norm<around*|(|vect|)>\<rightarrow\>norma\<rightarrow\>scalare>

    <item><math|size<around*|(|M|)>\<rightarrow\>dimensione
    dell<rprime|'>input\<rightarrow\><around*|{|row,col|}>>

    <item><math|isRot<around*|(|R|)>\<rightarrow\>check matrice di
    rotation\<rightarrow\>boolean b><math|<around*|{|true\<rightarrow\>verificata,false\<rightarrow\>non
    verificata|}>>

    <item><math|rot3X<around*|(|scalar|)>\<rightarrow\>R<rsup|3\<times\>3>
    matrice asse X>

    <item><math|rot3Y<around*|(|scalar|)>\<rightarrow\>R<rsup|3\<times\>3>
    matrice asse Y>

    <item><math|rot3Z<around*|(|scalar|)>\<rightarrow\>R<rsup|3\<times\>3>
    matrice asse Z>

    <item><math|rot3<around*|(|ax,scalar|)>\<rightarrow\>R<rsup|3\<times\>3>
    matrice asse <around*|{|x,y,z|}>>

    <item><math|nautRot<around*|(|<around*|[|x,y,z|]>,<around*|[|\<alpha\>,\<beta\>,\<gamma\>|]>|)>\<rightarrow\>R<rsup|3\<times\>3>matrice
    di rotazione> nautica

    <item>euleroRot([x,y,z], angle)<math|\<rightarrow\>R<rsup|3\<times\>3>>
    <math|R<rsub|k>=R<rsub|i><around*|(|\<pm\><frac|\<pi\>|2>|)>.R<rsub|j><around*|(|\<pm\>\<gamma\>|)>.R<rsub|j><around*|(|\<mp\><frac|\<pi\>|2>|)>
    i,j,k\<in\><around*|{|x,y,z|}>>

    <item>ternaEulero([axesList],[angleList])<math|\<rightarrow\>Terna di
    Euelero>

    <item><math|S<around*|(|v|)>\<rightarrow\>M<rsup|3\<times\>3> matrice
    antisimmetrica>

    <item><math|isAsim<around*|(|M|)>\<rightarrow\>boolean<around*|{|true\<rightarrow\>se
    verificata,false\<rightarrow\>non verificata|}>>

    <item><math|getAsimVect<around*|(|S|)>\<rightarrow\>\<bbb-R\><rsup|3\<times\>1>
    vettore corrispondente alla matrice antisimmetrica>

    <item><math|antiSimmProduct<around*|(|v,w|)>\<rightarrow\>v\<times\>w=S<around*|(|v|)>\<cdot\>w>

    <item><math|expLaplace<around*|(|M,var|)>\<rightarrow\>M\<in\>\<bbb-R\><rsup|n\<times\>n>,var\<rightarrow\>symbol>
    matrice esponenziale calcolata con Laplace

    <item><math|expVect<around*|(|M,var|)>\<rightarrow\>M\<in\>R<rsup|n\<times\>n>,var\<rightarrow\>symbol>
    Matrice esponenziale tramite Jordan\ 

    <item><math|rotExp<around*|(|M,var|)>\<rightarrow\>M
    antisimmetrica,var\<rightarrow\>symbol>
    <math|S<around*|(|v|)>\<rightarrow\>R>

    <item><math|normalize<around*|(|vector|)>\<rightarrow\><around*|{|versore,norm|}>>

    <item><math|rodrigues<around*|(|vector,scalar|)>\<rightarrow\>R> formula
    di rodrigues

    <item><math|getAxis<around*|(|R|)>\<rightarrow\><around*|{|asse,norma,versore|}>>
    asse da matrice di rotazione

    <item><math|getAngle<around*|(|R|)>\<rightarrow\>angle> da matrice di
    rotazione

    <item>getRotData(R)<math|\<rightarrow\><around*|{|asse,angolo|}>> asse e
    angolo da matrice di rotazione

    <item><math|cayley<around*|(|vector,scalar|)>\<rightarrow\><around*|{|R|}>>
    parametrizzazione di Cayley

    <item>cayleyS(SkewMatrix)<math|\<rightarrow\><around*|{|R|}>> matrice di
    rotazione

    <item><math|invCayley<around*|(|M|)>\<rightarrow\><around*|{|ax,angle|}>>
    Da matrice di rotazione ad asse e angolo

    <item><math|Av<around*|(|vector,Rotscalar,Tralscalar|)>\<rightarrow\>T<rsup|4\<times\>4>=<matrix|<tformat|<table|<row|<cell|R>|<cell|d>>|<row|<cell|0>|<cell|1>>>>>>
    avvitamento su un Asse

    <item>Avx(RotScalar,TraslScalar)<math|\<rightarrow\>T<rsup|4\<times\>4>>
    avvitamento su asse X

    <item>Avz(RotScalar,TraslScalar)<math|\<rightarrow\>T<rsup|4\<times\>4>
    avvitamento su asse Z>

    <item>Qij(thetaZ,dZ,alphaX,aX)<math|\<rightarrow\>T<rsup|4\<times\>4>>
    diretta da SRi-1 a SRi

    <item>DH(table)<math|\<rightarrow\>T<rsup|4\<times\>4>>
    Denavit-Hartenberg

    <item><math|inerzia<around*|(|scalar|)>\<rightarrow\>M<rsup|3\<times\>3>>
    matrice inerzia diagonale relativa a scalar

    <item>formaQuad(M,dim)<math|\<rightarrow\>>identificare una forma
    quadratica

    <item>dev(f,var)<math|\<rightarrow\>>derivata\ 

    <item>Matrixdot(M)<math|\<rightarrow\>>derivata elementi di una matrice

    <item>Ulink(Qh,M)<math|\<rightarrow\>energia potenziale link>

    <item>Tlink(Qh,dof,M)<math|\<rightarrow\>energia cinetica link>

    <item>energia(tab,M,Trs,flag)<math|\<rightarrow\>funzione di calcolo
    energia di un robot>

    <item>euleroLagrange(tabList,Mlist,Fequation,uMatrix,TrszList)<math|\<rightarrow\><around*|{|equation,solutions|}>>
  </itemize>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|prog-scripts|maxima>
  </collection>
</initial>