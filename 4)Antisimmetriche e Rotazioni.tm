<TeXmacs|1.99.18>

<style|<tuple|generic|italian|maxima>>

<\body>
  <doc-data|<doc-title|--Procedure\U>|<\doc-subtitle>
    Matrice Antisimmetrica e legame con Matrici di Rotazione,

    Formula di Rodrigues e Parametrizzazione di Caley
  </doc-subtitle>>

  <\session|maxima|default>
    <\textput>
      <with|font-series|bold|12)Procedura:> definire una matrice
      antisimmetrica <math|S<around*|(|v|)>> dato un vettore <math|v>.

      <\equation*>
        S<around*|(|v|)>=<matrix|<tformat|<table|<row|<cell|0>|<cell|-v<rsub|z>>|<cell|v<rsub|y>>>|<row|<cell|v<rsub|z>>|<cell|0>|<cell|-v<rsub|x>>>|<row|<cell|-v<rsub|y>>|<cell|v<rsub|x>>|<cell|0>>>>>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>126) >
    <|input>
      S(v):=block(

      [S],

      /*Controlliamo che v sia un vettore o una lista*/

      if not(nonscalarp(v)) or length(v) \<less\> 3 or listp(v) then

      \ \ error("Inserire un vettore colonna di tre elementi")

      else(

      \ \ S:matrix([0,-v[3,1],v[2,1]],[v[3,1],0,-v[1,1]],[-v[2,1],v[1,1],0])

      )

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>127) >
    <|unfolded-io>
      vv:matrix([v[x]],[v[y]],[v[z]])
    <|unfolded-io>
      \;

      \;

      \ <math|<with|math-display|true|<text|<verbatim|a><verbatim|p><verbatim|p><verbatim|l><verbatim|y><verbatim|:><verbatim|
      ><verbatim|s><verbatim|u><verbatim|b><verbatim|s><verbatim|c><verbatim|r><verbatim|i><verbatim|p><verbatim|t><verbatim|
      ><verbatim|m><verbatim|u><verbatim|s><verbatim|t><verbatim|
      ><verbatim|b><verbatim|e><verbatim| ><verbatim|a><verbatim|n><verbatim|
      ><verbatim|i><verbatim|n><verbatim|t><verbatim|e><verbatim|g><verbatim|e><verbatim|r><verbatim|;><verbatim|
      ><verbatim|f><verbatim|o><verbatim|u><verbatim|n><verbatim|d><verbatim|:><verbatim|
      >>x>>

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>128) >
    <|unfolded-io>
      S:S(vv)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o128>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|-v<rsub|z>>|<cell|v<rsub|y>>>|<row|<cell|v<rsub|z>>|<cell|0>|<cell|-v<rsub|x>>>|<row|<cell|-v<rsub|y>>|<cell|v<rsub|x>>|<cell|0>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|12.1)Procedura:> Verificare una matrice sia
      antisimmetrica
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>129) >
    <|input>
      isAsim(M):=block(

      [sz:size(M), t, i, j, diagCheck, sideCheck, b],

      /*Verifichiamo che la matrice inserita sia quadrata*/ \ \ \ \ \ \ \ 

      if sz[1]#sz[2] or sz[1] \<less\> 2 or sz[2] \<less\> 2 then
      error("Inserire una matrice quadrata"),

      /*Per verificare che una qualsiasi matrice m x n quadrata sia
      antisimmetrica usiamo una tecnica ricorsiva.*/

      /*caso base:*/

      if sz[1] = 2 then(

      /*Controllo che la diagonale sia tutta nulla*/

      \ \ diagCheck: M[1,1] = M[2,2] and M[1,1] = 0,

      /*Controllo che gli elementi fuori diagonale

      \ \ siano uguali a meno del segno*/

      \ \ sideCheck: M[1,2] = -M[2,1],

      /*Uniamo le due condizioni necessarie*/

      \ \ b: diagCheck and sideCheck,

      \ \ return(is(b))

      ) else (

      /*caso generale*/

      \ \ j:1,

      \ \ diagCheck: M[j,j] = 0,

      \ \ for t:1 thru sz[1] do(

      /*Calcolo i = t mod(n)*/

      \ \ \ \ i:remainder(t,sz[1]),

      \ \ \ \ if i = 0 then i:n,

      \ \ \ \ sideCheck: M[i,j] = -M[j,i], \ \ \ 

      \ \ \ \ b: diagCheck and sideCheck,

      \ /*Se la condizione è violata esco, altrimenti rilancio con la
      sottomatrice ottenuta cancellando la prima riga e la prima colonna*/

      \ \ \ \ if b = false then return(b) else
      return(isAsim(submatrix(i,M,j))) \ \ \ 

      \ \ )

      )

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>130) >
    <|unfolded-io>
      isAsim(S)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o130>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|12.2)Procedura:> data una matrice antisimmetrica
      <math|S<around*|(|v|)>> determinare il vettore <math|v>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>131) >
    <|input>
      getAsimVect(S):=block(

      [v:zeromatrix(3,1)],

      /*Verifico che la matrice è antisimmetrica*/

      if isAsim(S) then(

      /*Mappo le componenti della matrice antisimmetrica nel vettore*/

      \ \ v[1,1]:S[3,2],

      \ \ v[2,1]:S[1,3],

      \ \ v[3,1]:S[2,1],

      \ \ return(v)

      ) else (

      \ \ error("La matrice non è antisimmetrica")

      )

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>132) >
    <|unfolded-io>
      getAsimVect(S)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o132>)
      >><matrix|<tformat|<table|<row|<cell|v<rsub|x>>>|<row|<cell|v<rsub|y>>>|<row|<cell|v<rsub|z>>>>>>>>
    </unfolded-io>

    <\textput>
      <\with|font-shape|right>
        <with|font-series|bold|12.3)Procedura:> calcolare il prodotto
        vettoriale <math|v\<times\>w> come prodotto matriciale

        <center|<center|><math|v\<times\>w=S<around*|(|v|)>\<cdot\>w>>
      </with>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>133) >
    <|input>
      antiSimProduct(v,w):=block(

      [S,Sw],

      \ S:S(v),

      \ Sw:S.w,

      \ return(Sw)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>134) >
    <|unfolded-io>
      ww:matrix([w[x]],[w[y]],[w[z]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o134>)
      >><matrix|<tformat|<table|<row|<cell|w<rsub|x>>>|<row|<cell|w<rsub|y>>>|<row|<cell|w<rsub|z>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>135) >
    <|unfolded-io>
      prod1:antiSimProduct(vv,ww)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o135>)
      >><matrix|<tformat|<table|<row|<cell|v<rsub|y>*w<rsub|z>-w<rsub|y>*v<rsub|z>>>|<row|<cell|w<rsub|x>*v<rsub|z>-v<rsub|x>*w<rsub|z>>>|<row|<cell|v<rsub|x>*w<rsub|y>-w<rsub|x>*v<rsub|y>>>>>>>>
    </unfolded-io>

    <\textput>
      Calcolo il prodotto vettoriale con la mia procedura. Prendiamo il primo
      membro del risultato per come è stata definita.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>136) >
    <|unfolded-io>
      prod2:vect_prod(vv,ww)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o136>)
      >>e<rsub|x>*v<rsub|y>*w<rsub|z>-v<rsub|x>*e<rsub|y>*w<rsub|z>-e<rsub|x>*w<rsub|y>*v<rsub|z>+w<rsub|x>*e<rsub|y>*v<rsub|z>+v<rsub|x>*w<rsub|y>*e<rsub|z>-w<rsub|x>*v<rsub|y>*e<rsub|z>>>
    </unfolded-io>

    <\textput>
      Per verificare il risultato, applichiamo una sostituzione per eliminare
      i versori simbolici
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>137) >
    <|unfolded-io>
      psubst([e[x]=matrix([1],[0],[0]),e[y]=matrix([0],[1],[0]),e[z]=matrix([0],[0],[1])],prod2)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o137>)
      >><matrix|<tformat|<table|<row|<cell|v<rsub|y>*w<rsub|z>-w<rsub|y>*v<rsub|z>>>|<row|<cell|w<rsub|x>*v<rsub|z>-v<rsub|x>*w<rsub|z>>>|<row|<cell|v<rsub|x>*w<rsub|y>-w<rsub|x>*v<rsub|y>>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|13)Procedura:> calcolare l'esponenziale di
      matrice, <math|\<mathe\><rsup|A\<nosymbol\>t>> usando la trasformata di
      Laplace
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>138) >
    <|input>
      expLaplace(A,t):=block(

      [sz, II, s, sIImA, sIImAT, i, iltA], load("my_lib"),

      \ \ \ \ \ /*Controlliamo che la matrice inserita sia quadrata*/

      \ \ \ \ \ sz:size(A),

      \ \ \ \ \ if(sz[1]#sz[2]) then error("Matrice non Quadrata"),

      \ \ \ \ \ II:ident(sz[1]),

      \ \ \ \ \ sIImA:invert(s*II-A), \ \ \ \ 

      \ \ \ \ \ iltA:zerofor(A),

      \ \ \ \ \ for i:1 thru sz[1] do(

      \ \ \ \ \ \ \ for j:1 thru sz[2] do(

      \ \ \ \ \ \ \ \ \ iltA[i,j]:ilt(sIImA[i,j],s,t)

      \ \ \ \ \ \ \ )

      \ \ \ \ \ ),

      \ \ \ \ \ return(mySimp(iltA))

      )$
    </input>

    <\textput>
      <\textput>
        <with|font-series|bold|13.1)Procedura:>
        <with|font-shape|right|Scrivere una procedura che utilizzando la
        forma canonica di Jordan calcoli la matrice esponenziale. Ovvero,
        trovare una matrice invertibile <math|V> tale che:>

        <center|<\math>
          \<mathe\><rsup|A*t>=V\<cdot\>\<mathe\><rsup|J<rsub|A>t>\<cdot\>V<rsup|-1><with|font-shape|right|>
        </math>>
      </textput>

      Dove <math|\<mathe\><rsup|J<rsub|A>t>> è l'esponenziale di matrice
      della forma di jordan <math|J<rsub|A>> della matrice <math|A>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>139) >
    <|input>
      expVect(A,t):=block(

      [sz, V, eigVec, Vi, D, expD, res, theta],

      \ \ \ \ \ \ sz:size(A),

      \ \ \ \ \ \ if(sz[1]#sz[2]) then error("Matrix not Square"),

      /*Definiamo una matrice vuota pronta a contenere vettori colonna di
      dimensione 3*/

      \ \ \ \ \ \ V:zeromatrix(sz[1],0),

      \ \ \ \ \ \ eigVec:myEigens(A)[2],

      \ \ \ \ \ \ for i:1 thru sz[1] do(

      \ \ \ \ \ \ \ \ V:addcol(V, eigVec[i])

      \ \ \ \ \ \ ),

      \ \ \ \ \ \ Vi:invert(V),\ 

      \ \ \ \ \ \ D:Vi.A.V,

      \ \ \ \ \ \ expD:D,

      \ \ \ \ \ \ for i:1 thru sz[1] do(

      \ \ \ \ \ \ \ expD[i,i]:exp(expD[i,i]*t)

      \ \ \ \ \ \ ),

      \ \ \ \ \ \ res:V.expD.Vi,

      \ \ \ \ \ \ return(mySimp(res))

      )$
    </input>

    <\textput>
      Definiamo una matrice <math|A> e verifichiamo il risultato delle due
      procedure.
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>140) >
    <|unfolded-io>
      A:matrix([1,1,0],[0,2,2],[0,0,3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o140>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|2>|<cell|2>>|<row|<cell|0>|<cell|0>|<cell|3>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>141) >
    <|unfolded-io>
      expLaplace(A,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o141>)
      >><matrix|<tformat|<table|<row|<cell|\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|t>>|<cell|<around*|(|\<mathe\><rsup|t>-1|)><rsup|2>*\<mathe\><rsup|t>>>|<row|<cell|0>|<cell|\<mathe\><rsup|2*t>>|<cell|2*<around*|(|\<mathe\><rsup|t>-1|)>*\<mathe\><rsup|2*t>>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|3*t>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>142) >
    <|unfolded-io>
      expVect(A,t)
    <|unfolded-io>
      \;

      solve: all variables must not be numbers.

      #0: myEigens(a=matrix([1,1,0],[0,2,2],[0,0,3])) (my_lib.mac line 137)

      #1: expVect(a=matrix([1,1,0],[0,2,2],[0,0,3]),t=t) (my_lib.mac line
      250)

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>143) >
    <|unfolded-io>
      a:matrix([0,1,0],[1,0,0],[0,0,-1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o143>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>144) >
    <|unfolded-io>
      expand(expVect(a,t))
    <|unfolded-io>
      \;

      solve: all variables must not be numbers.

      #0: myEigens(a=matrix([0,1,0],[1,0,0],[0,0,-1])) (my_lib.mac line 137)

      #1: expVect(a=matrix([0,1,0],[1,0,0],[0,0,-1]),t=t) (my_lib.mac line
      250)

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>145) >
    <|unfolded-io>
      expLaplace(a,t)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o145>)
      >><matrix|<tformat|<table|<row|<cell|<frac|\<mathe\><rsup|t>|2>+<frac|\<mathe\><rsup|-t>|2>>|<cell|<frac|\<mathe\><rsup|t>|2>-<frac|\<mathe\><rsup|-t>|2>>|<cell|0>>|<row|<cell|<frac|\<mathe\><rsup|t>|2>-<frac|\<mathe\><rsup|-t>|2>>|<cell|<frac|\<mathe\><rsup|t>|2>+<frac|\<mathe\><rsup|-t>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|\<mathe\><rsup|-t>>>>>>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|14)Procedura:> verificare che le matrici di
      rotazione sono parametrizzate da esponenziali di matrici
      antisimmetriche. Ovvero

      <\equation*>
        R<rsub|v><around*|(|\<vartheta\>|)>=\<mathe\><rsup|S<rsub|><around*|(|v|)>\<vartheta\>>
      </equation*>

      Dobbiamo eseguire i seguenti passi:

      1) Calcolo della matrice <math|S<around*|(|k|)> con k
      \<in\><around*|{|e<rsub|x>,e<rsub|y>,e<rsub|z>|}> con
      e<rsub|x>,e<rsub|y>,e<rsub|z> versori dei rispettivi assi x,y,z>:

      <space|9em><math|S<around*|(|e<rsub|x>|)>=<matrix|<tformat|<table|<row|<cell|0<space|1em>0<space|1em>0>>|<row|<cell|0<space|1em>0-1>>|<row|<cell|0<space|1em>1<space|1em>0>>>>>;S<around*|(|e<rsub|y>|)>=<matrix|<tformat|<table|<row|<cell|0<space|1em>0<space|1em>1>>|<row|<cell|0<space|1em>0<space|1em>0>>|<row|<cell|-1<space|1em>0<space|1em>0>>>>>;S<around*|(|e<rsub|z>|)>=<matrix|<tformat|<table|<row|<cell|0-1<space|1em>0>>|<row|<cell|1<space|1em>0<space|1em>0>>|<row|<cell|0<space|1em>0<space|1em>0>>>>>.>

      2)Calcolo della matrice <math|s*I-S<around*|(|k|)>> di Laplace con s
      variabile di Laplace e I matrice identità
      <math|I><math|\<in\>R<rsup|3x3>>:

      <space|5em><math|s*I-S<around*|(|e<rsub|x>|)>=><math|<matrix|<tformat|<table|<row|<cell|s<space|1em>0<space|1em>0>>|<row|<cell|0<space|1em>s-1>>|<row|<cell|0<space|1em>1<space|1em>s>>>>>>;<math|s*I-S<around*|(|e<rsub|y>|)>=><math|<matrix|<tformat|<table|<row|<cell|s<space|1em>0<space|1em>1>>|<row|<cell|0<space|1em>s<space|1em>0>>|<row|<cell|-1
      0<space|1em>s>>>>>;s*I-S<around*|(|e<rsub|z>|)>=><math|<matrix|<tformat|<table|<row|<cell|s-1<space|1em>0>>|<row|<cell|1<space|1em>s<space|1em>0>>|<row|<cell|0<space|1em>0<space|1em>s>>>>>>.

      3)Invertire le matrici appena ottenute:

      <space|13em><math|<around*|(|s*I-S<around*|(|e<rsub|x>|)>|)><rsup|-1>=<matrix|<tformat|<table|<row|<cell|<frac|1|s>
      <space|1em>0<space|1em>0>>|<row|<cell|0<space|1em><frac|s|s<rsup|2>+1><space|1em><frac|1|s<rsup|2>+1>>>|<row|<cell|0<space|1em><frac|1|s<rsup|2>+1><space|1em><frac|s|s<rsup|2>+1>>>>>>>;\ 

      <space|13em><math|\<space\><around*|(|s*I-S<around*|(|e<rsub|x>|)>|)><rsup|-1>=<matrix|<tformat|<table|<row|<cell|<frac|s<rsup|2>|s<rsup|3>+s>>|<cell|0>|<cell|<frac|s|s<rsup|3>+s>>>|<row|<cell|0>|<cell|<frac|s<rsup|2>+1|s<rsup|3>+s>>|<cell|0>>|<row|<cell|-<frac|s|s<rsup|3>+s>>|<cell|0>|<cell|<frac|s<rsup|2>|s<rsup|3>+s>>>>>>>;\ 

      <space|13em><math|<around*|(|s*I-S<around*|(|e<rsub|x>|)>|)><rsup|-1>=<matrix|<tformat|<table|<row|<cell|<frac|s<rsup|2>|s<rsup|3>+s>>|<cell|-<frac|s|s<rsup|3>+s>>|<cell|0>>|<row|<cell|<frac|s|s<rsup|3>+s>>|<cell|<frac|s<rsup|2>|s<rsup|3>+s>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|s<rsup|2>+1|s<rsup|3>+s>>>>>>>.

      4)Calcolare l'inversa di Laplace della matrici inverse
      <math|\<cal-L\><around*|{|<around*|(|s*I-S<around*|(|k|)>|)><rsup|-1>|}><rsup|-1>>:

      <\equation*>
        R<rsub|x><around*|(|\<theta\>|)>=<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
        <around*|(|\<vartheta\>|)>>|<cell|-sin
        <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|sin
        <around*|(|\<vartheta\>|)>>|<cell|cos
        <around*|(|\<vartheta\>|)>>>>>>;R<rsub|y><around*|(|\<theta\>|)>=<matrix|<tformat|<table|<row|<cell|cos
        <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|sin
        <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|-sin
        <around*|(|\<vartheta\>|)>>|<cell|0>|<cell|cos
        <around*|(|\<vartheta\>|)>>>>>>;R<rsub|z><around*|(|\<theta\>|)>=<matrix|<tformat|<table|<row|<cell|cos
        <around*|(|\<vartheta\>|)>>|<cell|-sin
        <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|sin
        <around*|(|\<vartheta\>|)>>|<cell|cos
        <around*|(|\<vartheta\>|)>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>>>>>
      </equation*>
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>146) >
    <|input>
      rotExp(S,t):=block(

      [R],

      /*Verifichiamo che S sia antisimmetrica*/

      if isAsim(S) then(

      \ \ R:expLaplace(S,t),

      \ \ return(R)

      ) else (

      \ \ error("Inserire una matrice antisimmetrica")

      )

      )$
    </input>

    <\textput>
      Verifichiamo:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>147) >
    <|unfolded-io>
      v:matrix([1],[sqrt(2)],[0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o147>)
      >><matrix|<tformat|<table|<row|<cell|1>>|<row|<cell|<sqrt|2>>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>148) >
    <|unfolded-io>
      S:S(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o148>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|<sqrt|2>>>|<row|<cell|0>|<cell|0>|<cell|-1>>|<row|<cell|-<sqrt|2>>|<cell|1>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>149) >
    <|unfolded-io>
      R:mySimp(demoivre(rotExp(S,t)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o149>)
      >><matrix|<tformat|<table|<row|<cell|<frac|2*cos
      <around*|(|<sqrt|3>*t|)>+1|3>>|<cell|-<frac|<sqrt|2>*<around*|(|cos
      <around*|(|<sqrt|3>*t|)>-1|)>|3>>|<cell|<frac|<sqrt|2>*sin
      <around*|(|<sqrt|3>*t|)>|<sqrt|3>>>>|<row|<cell|-<frac|<sqrt|2>*<around*|(|cos
      <around*|(|<sqrt|3>*t|)>-1|)>|3>>|<cell|<frac|cos
      <around*|(|<sqrt|3>*t|)>+2|3>>|<cell|-<frac|sin
      <around*|(|<sqrt|3>*t|)>|<sqrt|3>>>>|<row|<cell|-<frac|<sqrt|2>*sin
      <around*|(|<sqrt|3>*t|)>|<sqrt|3>>>|<cell|<frac|sin
      <around*|(|<sqrt|3>*t|)>|<sqrt|3>>>|<cell|cos
      <around*|(|<sqrt|3>*t|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>150) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o150>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|15)Procedura:> implementare la formula di
      Rodrigues

      <\equation*>
        <center|<math|R<rsub|v>*<around*|(|\<vartheta\>|)>=I+S<rsup|2><around*|(|v|)><around*|(|1-cos<around*|(|\<vartheta\>|)>|)>+S<around*|(|v|)>sin<around*|(|\<vartheta\>|)>>>
      </equation*>
    </textput>

    <\textput>
      definiamo una procedura ausiliaria per normalizzare un vettore
      qualsiasi, esprimendolo come:

      <\equation*>
        <wide|v|\<vect\>>=<around*|\<\|\|\>|v|\<\|\|\>>*<wide|u|\<vect\>>
      </equation*>

      Dove <math|<wide|u|\<vect\>>> è un versore.
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>151) >
    <|input>
      normalize(v):=block(

      [norm:0, u, i, sz, vv],

      sz:size(v),

      /*Mi assicuro che v sia un vettore colonna*/

      if nonscalarp(v) and sz[2] = 1 \ then(

      \ \ vv:ratsimp(v), \ norm:sqrt(transpose(vv).vv),

      \ \ /*Applico una semplificazione numerica, dividendo il vettore per
      una sua componente non nulla, al fine di migliorare l'output*/

      \ \ norm:sqrt(transpose(vv).vv),

      \ \ u:ratsimp(vv/norm)

      ),

      return([norm,u])\ 

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>152) >
    <|unfolded-io>
      v:matrix([sqrt(2)],[1.1],[0])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o152>)
      >><matrix|<tformat|<table|<row|<cell|<sqrt|2>>>|<row|<cell|1.1>>|<row|<cell|0>>>>>>>
    </unfolded-io>

    <\textput>
      Verifico il risultato espresso in [norma, versore]
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>153) >
    <|unfolded-io>
      normalize(v)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o153>)
      >><around*|[|<frac|<sqrt|321>|10>,<matrix|<tformat|<table|<row|<cell|<frac|5*2<rsup|<frac|3|2>>|<sqrt|321>>>>|<row|<cell|<frac|11|<sqrt|321>>>>|<row|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>154) >
    <|input>
      rodrigues(v,theta):=block(

      [S,II,S2,rodr,norm,u,theta1],

      /*normaliziamo il vettore*/

      [norm,u]:ratsimp(normalize(v)),

      /*calcoliamo l'antisimmetrica sul versore*/

      \ S:S(u),

      \ II:ident(size(v)[1]),

      \ S2:S.S,

      \ /*implementiamo la formula di rodrigues, moltiplicando l'angolo per
      la norma di v*/

      \ theta1: ratsimp(theta),

      \ rodr:II+S2*(1-cos(norm*theta1))+S*sin(norm*theta1),

      \ return((rodr))

      )$
    </input>

    <\textput>
      Verifichiamo:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>155) >
    <|unfolded-io>
      R:rodrigues(v,theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o155>)
      >><matrix|<tformat|<table|<row|<cell|1-<frac|121*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>|)>|321>>|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>|)>|321>>|<cell|<frac|11*sin
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>|<sqrt|321>>>>|<row|<cell|<frac|55*2<rsup|<frac|3|2>>*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>|)>|321>>|<cell|1-<frac|200*<around*|(|1-cos
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>|)>|321>>|<cell|-<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>|<sqrt|321>>>>|<row|<cell|-<frac|11*sin
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>|<sqrt|321>>>|<cell|<frac|5*2<rsup|<frac|3|2>>*sin
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>|<sqrt|321>>>|<cell|cos
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>>>>>>>>
    </unfolded-io>

    <\textput>
      Controlliamo che è davvero una matrice di rotazione:
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>156) >
    <|unfolded-io>
      isRot(R)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o156>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      Verifichiamo una rotazione generica attorno all'asse <math|x>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>157) >
    <|unfolded-io>
      rx: rodrigues(matrix([1],[0],[0]),theta)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o157>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|cos
      <around*|(|\<vartheta\>|)>>|<cell|-sin
      <around*|(|\<vartheta\>|)>>>|<row|<cell|0>|<cell|sin
      <around*|(|\<vartheta\>|)>>|<cell|cos <around*|(|\<vartheta\>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>158) >
    <|unfolded-io>
      isRot(rx)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o158>)
      >><math-bf|true>>>
    </unfolded-io>

    <\textput>
      <with|font-series|bold|16)Procedura:> Calcolare l'asse di una matrice
      di rotazione
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>159) >
    <|input>
      getAxis(R):=block(

      [II, v, i, u, norm,c],algebraic:true,

      \ \ /*Verifichiamo che la matrice data è di rotazione*/

      \ \ if (isRot(R) = false) then (

      \ \ \ \ error("La matrice inserita non è di rotazione.")

      \ \ ) else (

      \ \ \ \ /*Calcolo autovalori e autovettori*/

      \ \ \ \ eigs:myEigens(R),

      \ \ \ \ for i:1 thru length(eigs[1]) do(

      /*Cerco l'autovettore relativo all'autovalore 1. Unico per ipotesi.*/

      \ \ \ \ \ \ if eigs[1][i] = 1 then( /*scorro autovalori per trovare
      lambda=1*/

      \ \ \ \ \ \ \ \ \ v:simp(eigs[2][i]), \ \ \ \ \ \ \ \ \ 

      \ \ \ \ \ \ \ \ \ [norm, u] : ratsimp(normalize(v)),

      \ \ \ \ \ \ \ \ \ return([v, norm, u])

      \ \ \ \ \ \ )

      \ \ \ \ )

      \ \ ) \ \ \ \ \ \ 

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>160) >
    <|unfolded-io>
      res:getAxis(R)
    <|unfolded-io>
      \;

      solve: all variables must not be numbers.

      #0: myEigens(a=matrix([1-(121*(1-cos((sqrt(321)*theta)/10)))/321,(55*2^(3/2)*(1-cos((sqrt(321)*theta)/10)))/321,(11...)
      (my_lib.mac line 137)

      #1: getAxis(r=matrix([1-(121*(1-cos((sqrt(321)*theta)/10)))/321,(55*2^(3/2)*(1-cos((sqrt(321)*theta)/10)))/321,(11...)

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\textput>
      <with|font-series|bold|17) Procedura:> Determinare l'angolo di una
      matrice di rotazione
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>209) >
    <|input>
      myAtan2(y,x):=block(

      [s, sp, c, cp, myAtan, res, xx:ratsimp(x), yy:ratsimp(y)],

      \ \ \ \ if y = 0 and x = 0 then

      \ \ \ \ \ \ error("Gli argomenti non possono essere entrambi zero"),

      \ \ \ \ if x = 0 and 1 = y then return(%pi/2)

      \ \ \ \ elseif x = 0 and -1 = y then return(-%pi/2),

      \ \ \ \ /*x != 0*/

      \ \ \ \ myAtan:trigreduce(trigsimp(simp(atan(yy/xx)))),print(myAtan),

      \ \ \ \ s:ratsimp(sin(myAtan)), sp:ratsimp(sin(myAtan+%pi)),

      \ \ \ \ c:ratsimp(cos(myAtan)), cp:ratsimp(cos(myAtan+%pi)),

      \ \ \ \ /*x\<gtr\>0, y\<gtr\>0*/

      \ \ \ \ if c = xx and s = yy then return(myAtan)

      \ \ \ \ /*x\<less\>0, y\<less\>0*/

      \ \ \ \ elseif cp = xx and sp = yy then return(myAtan-%pi)

      \ \ \ \ /*x\<less\>0, y\<gtr\>0*/

      \ \ \ \ elseif cp = xx and s = yy then return(myAtan+%pi)

      \ \ \ \ /*x\<gtr\>0, y\<less\>0*/

      \ \ \ \ elseif c = xx and sp = yy then return(-myAtan) \ \ \ 

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>210) >
    <|input>
      getAngle(R):=block(

      [Rplus, Rminus, S1, S2, dim, Rt, v, c, s, norm, u, angle,cc],

      \ \ \ \ \ \ \ \ dim:size(R),

      \ \ \ \ \ \ \ \ Rt:transpose(R),

      \ \ \ \ \ \ \ \ I:ident(dim[1]),

      \ \ \ \ \ \ \ \ Rminus:trigsimp((R-Rt)/2),

      \ \ \ \ \ \ \ \ Rplus:trigsimp((R+Rt)/2-I), \ \ \ \ \ \ \ 

      \ \ \ \ \ \ \ \ [v, norm, u]:getAxis(R), \ \ \ \ \ \ \ 

      \ \ \ \ \ \ \ \ S1:S(u), s:0, c:0,

      \ \ \ \ \ \ \ \ if(isRot(R) = false) then\ 

      \ \ \ \ \ \ \ \ error("La matrice inserita non è di rotazione."),
      \ \ \ \ 

      \ \ \ \ \ \ \ \ for i:1 thru dim[1] do(

      \ \ \ \ \ \ \ \ \ \ for j:1 thru dim[2] do(

      \ \ \ \ \ \ \ \ \ \ \ if(S1[i][j]#0) then

      \ \ \ \ \ \ \ \ \ \ \ \ \ s:Rminus[i][j]/S1[i][j],

      \ \ \ \ \ \ \ \ \ \ \ \ \ return(s)

      \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ S2:S1.S1,

      \ \ \ \ \ \ \ \ \ for i:1 thru dim[1] do(

      \ \ \ \ \ \ \ \ \ \ for j:1 thru dim[2] do(

      \ \ \ \ \ \ \ \ \ \ \ if(S2[i][j]#0) then

      \ \ \ \ \ \ \ \ \ \ \ \ \ c:expand(1-Rplus[i][j]/S2[i][j]),

      \ \ \ \ \ \ \ \ \ \ \ \ \ return(c)

      \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ angle:simp(myAtan2(expand(s),expand(c))),

      \ \ \ \ \ \ \ \ return(expand(angle))

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>211) >
    <|unfolded-io>
      getAngle(R)
    <|unfolded-io>
      <math|<with|math-display|true|<frac|<sqrt|321>*\<vartheta\>|10>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o211>)
      >><frac|<sqrt|321>*\<vartheta\>|10>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>92) >
    <|input>
      \;
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>212) >
    <|unfolded-io>
      a:atan(sin (((sqrt(321)*theta)/10))/cos (((sqrt(321)*theta)/10)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o212>)
      >>arctan <around*|(|<frac|sin <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>|cos
      <around*|(|<frac|<sqrt|321>*\<vartheta\>|10>|)>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>213) >
    <|unfolded-io>
      b:simp(a)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o213>)
      >><frac|<sqrt|321>*\<vartheta\>|10>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>214) >
    <|unfolded-io>
      myAtan2(sin(b),cos(b))
    <|unfolded-io>
      <math|<with|math-display|true|<frac|<sqrt|321>*\<vartheta\>|10>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o214>)
      >><frac|<sqrt|321>*\<vartheta\>|10>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>215) >
    <|unfolded-io>
      c:cos(%pi/6)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o215>)
      >><frac|<sqrt|3>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>216) >
    <|unfolded-io>
      s:sin(%pi/6)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o216>)
      >><frac|1|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>217) >
    <|unfolded-io>
      myAtan2(s,c)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<frac|\<pi\>|6>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o217>)
      >><frac|\<pi\>|6>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>218) >
    <|unfolded-io>
      myAtan2(0,0)
    <|unfolded-io>
      \;

      Gli argomenti non possono essere entrambi zero

      #0: myAtan2(y=0,x=0)

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>219) >
    <|unfolded-io>
      myAtan2(1,0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o219>)
      >><frac|\<pi\>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>220) >
    <|unfolded-io>
      k:myAtan2(0,-1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|0>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o220>)
      >>-\<pi\>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>221) >
    <|unfolded-io>
      atan(0/c)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o221>)
      >>0>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>222) >
    <|unfolded-io>
      c
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o222>)
      >><frac|<sqrt|3>|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>223) >
    <|unfolded-io>
      myAtan2(sin(3.2),cos(3.2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|arctan
      <around*|(|<frac|51721437561317|884522459470680>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>223) >
    <|unfolded-io>
      sin(%)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o223>)
      >><math-bf|false>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>224) >
    <|unfolded-io>
      cos(ratsimp(3.2))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o224>)
      >>sin <around*|(|<math-bf|false>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>225) >
    <|unfolded-io>
      myAtan2(sin(ratsimp(3.2)),cos(ratsimp(3.2)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o225>)
      >>cos <around*|(|<frac|16|5>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>226) >
    <|unfolded-io>
      c:(0.154)
    <|unfolded-io>
      <math|<with|math-display|true|<frac|16|5>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o226>)
      >><frac|16|5>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>227) >
    <|unfolded-io>
      s:-sqrt(1-c^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o227>)
      >>0.154>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>228) >
    <|unfolded-io>
      cos(myAtan2(s,c))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o228>)
      >>-0.9880708476622514>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>229) >
    <|unfolded-io>
      float(sin(atan(ratsimp(sin(3.2))/ratsimp(cos(3.2)))))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|-arctan
      <around*|(|<frac|14799628000|2306659201>|)>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o229>)
      >>cos <around*|(|<math-bf|false>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>230) >
    <|unfolded-io>
      ratsimp(cos(3.2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o230>)
      >>0.05837414342757998>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>231) >
    <|unfolded-io>
      float(atan(ratsimp(sin(3.2))/ratsimp(cos(3.2))))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o231>)
      >>-<frac|19769492|19803261>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>232) >
    <|unfolded-io>
      sin(3.2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o232>)
      >>0.05840734641020683>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>233) >
    <|unfolded-io>
      cos(simp(atan((51721437561317/884522459470680))))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o233>)
      >>-0.05837414342758009>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>234) >
    <|unfolded-io>
      cos(atan((51721437561317/884522459470680))+%pi)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o234>)
      >><frac|884522459470680|<sqrt|785055088411469956245914436889>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>235) >
    <|unfolded-io>
      aa:ratsimp(sin((3.2)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o235>)
      >>-<frac|884522459470680|<sqrt|785055088411469956245914436889>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>236) >
    <|unfolded-io>
      bb:ratsimp(sqrt(1-aa^2))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o236>)
      >>-<frac|7835291|134225370>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>237) >
    <|unfolded-io>
      ll:myAtan2(aa,bb)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o237>)
      >><frac|<sqrt|17955058166582219>|134225370>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>238) >
    <|unfolded-io>
      trigreduce(trigsimp(atan(aa/bb)))
    <|unfolded-io>
      <math|<with|math-display|true|-arctan
      <around*|(|<frac|7835291|<sqrt|17955058166582219>>|)>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o238>)
      >>-arctan <around*|(|<frac|7835291|<sqrt|17955058166582219>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>239) >
    <|unfolded-io>
      sin(ll)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o239>)
      >>-arctan <around*|(|<frac|7835291|<sqrt|17955058166582219>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>240) >
    <|unfolded-io>
      cos(ll)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o240>)
      >>-<frac|7835291|134225370>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>241) >
    <|unfolded-io>
      yy:sin(1/(sqrt(3/99)*%pi-cos(2.3)))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o241>)
      >><frac|<sqrt|17955058166582219>|134225370>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>242) >
    <|unfolded-io>
      xx:sqrt(1-yy^2)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o242>)
      >>sin <around*|(|<frac|1|<frac|\<pi\>|<sqrt|33>>+0.666276021279824>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>250) >
    <|unfolded-io>
      myAtan2(yy,xx)
    <|unfolded-io>
      <math|<with|math-display|true|arctan <around*|(|<frac|<sqrt|2>*sin
      <around*|(|<frac|569703387|17263739*<sqrt|33>*\<pi\>+379579706>|)>|<sqrt|cos
      <around*|(|<frac|1139406774|17263739*<sqrt|33>*\<pi\>+379579706>|)>+1>>|)>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o250>)
      >><math-bf|false>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>244) >
    <|unfolded-io>
      yyy:ratsimp(yy)
    <|unfolded-io>
      <math|<with|math-display|true|arctan <around*|(|<frac|<sqrt|2>*sin
      <around*|(|<frac|569703387|17263739*<sqrt|33>*\<pi\>+379579706>|)>|<sqrt|cos
      <around*|(|<frac|1139406774|17263739*<sqrt|33>*\<pi\>+379579706>|)>+1>>|)>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o244>)
      >><math-bf|false>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>245) >
    <|unfolded-io>
      xxx:ratsimp(xx)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o245>)
      >>sin <around*|(|<frac|569703387|17263739*<sqrt|33>*\<pi\>+379579706>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      rapport:trigsimp3((yyy/xxx))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >><with|math-font-family|rm|trigsimp3><around*|(|<frac|<math-up|yyy>|<math-up|xxx>>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      angleee:c2sin(trigsimp(atan(rapport)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><with|math-font-family|rm|c2sin><around*|(|arctan
      <around*|(|<with|math-font-family|rm|trigsimp3><around*|(|<frac|<math-up|yyy>|<math-up|xxx>>|)>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|unfolded-io>
      load(trigtools)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o1>)
      >C:/Maxima/bin/../share/maxima/5.44.0/share/contrib/trigtools/trigtools.mac
      >>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|unfolded-io>
      trigfactor(atan(((sqrt(2)*sin ((569703387/(17263739*sqrt(33)*%pi+379579706))))/(sqrt(cos
      ((1139406774/(17263739*sqrt(33)*%pi+379579706)))+1)))))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o2>)
      >>arctan <around*|(|<frac|<sqrt|2>*sin
      <around*|(|<frac|569703387|17263739*<sqrt|33>*\<pi\>+379579706>|)>|<sqrt|cos
      <around*|(|<frac|1139406774|17263739*<sqrt|33>*\<pi\>+379579706>|)>+1>>|)>>>
    </unfolded-io>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|papyrus>
  </collection>
</initial>