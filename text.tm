<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<strong|Energia delle strutture portanti>>

  <\session|maxima|default>
    \;

    <\textput>
      Procedura per la costruzione di una matrice di inerzia simbolica
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>1) >
    <|input>
      inerzia(j):=block(

      [II],

      II:matrix([I[xx[i]],I[xy[i]],I[xz[i]]],

      [I[xy[i]],I[yy[i]],I[yz[i]]],

      [I[xz[i]],I[yz[i]],I[zz[i]]]),

      II:subst(j,i,II),

      return(II)

      )$
    </input>

    <\textput>
      Procedura di supporto per la definizione delle traslazioni per portare
      il sistema di riferimento <math|Q<rsub|i j>> nel baricentro del link
    </textput>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>2) >
    <|input>
      baricentro(row):=block(

      [bc],

      bc:addrow(addcol(ident(3),transpose(row)),[0,0,0,1]),

      return(bc)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>3) >
    <|input>
      formaQuad(func,n):=block(

      [B],

      B:zeromatrix(n,n),

      /*Derivoduevolte:ottengoiterminiquadraticinellevelocità*/

      for k:1thru n do(

      B[k,k]:diff(func,v[k],2)),

      /*Derivoiterminimisti:*/

      /*ottengoiterminisopraesottoladiagonaleprincipale.*/

      for i:1 thru n do(

      for j:i+1 thru n do(

      B[i,j]:1/2*diff(diff(func,v[j]),v[i]),

      B[j,i]:B[i,j]

      )

      ),

      return(B)

      )$
    </input>

    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|unfolded-io>
      gradient(varp,n):=block([variables:[],M,symbols:[v,a]],

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1 thru n do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if part(varp[i],0)#v then
      (variables:append(variables,[varp[i]]))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ), variables:flatten(variables),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ n:length(variables),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ M:zeromatrix(n,2),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1 thru n do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for j:1 thru 2 do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if j=1 then
      M[i][j]:v[i],

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if j=2 then
      M[i][j]:a[i]

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return(M)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o4>)
      >><math-up|gradient><around*|(|<math-up|varp>,n|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|variables>:<around*|[||]>,M,<math-up|symbols>:<around*|[|v,a|]>|]>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>n<space|0.27em><math-bf|do><space|0.27em><math-bf|if><space|0.27em><math-up|part><around*|(|<math-up|varp><rsub|i>,0|)>\<neq\>v<space|0.27em><math-bf|then><space|0.27em><math-up|variables>:<math-up|append><around*|(|<math-up|variables>,<around*|[|<math-up|varp><rsub|i>|]>|)>,<math-up|variables>:<math-up|flatten><around*|(|<math-up|variables>|)>,n:<math-up|length><around*|(|<math-up|variables>|)>,M:<math-up|zeromatrix><around*|(|n,2|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em>n<space|0.27em><math-bf|do><space|0.27em><math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em>2<space|0.27em><math-bf|do><space|0.27em><around*|(|<math-bf|if><space|0.27em>j=1<space|0.27em><math-bf|then><space|0.27em><around*|(|M<rsub|i>|)><rsub|j>:v<rsub|i>,<math-bf|if><space|0.27em>j=2<space|0.27em><math-bf|then><space|0.27em><around*|(|M<rsub|i>|)><rsub|j>:a<rsub|i>|)>,<math-up|return><around*|(|M|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      derivate(f):=block(

      \ \ \ \ \ \ \ \ [df:0,varp:[],sizeVar:0,derivSym:zeromatrix(1,1),var:0,index:0,symb:0,partswitch:true],

      \ \ \ \ \ \ \ \ varp:unique(flatten([exprbreak(f,1)])),

      \ \ \ \ \ \ \ \ sizeVar:length(varp),

      \ \ \ \ \ \ \ \ for i:1 thru sizeVar do(

      \ \ \ \ \ \ \ \ \ \ if not (subvarp(varp[i]) or symbolp(varp[i])) then
      varp[i]:[]

      \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ varp:flatten(varp),

      \ \ \ \ \ \ \ \ \ sizeVar:length(varp),

      \ \ \ \ \ \ \ \ \ derivSym:gradient(varp,sizeVar),

      \ \ \ \ \ \ \ \ \ \ for i:1 thru sizeVar do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ var:varp[i],

      \ \ \ \ \ \ \ \ \ \ \ \ \ index:part(var,1),

      \ \ \ \ \ \ \ \ \ \ \ \ \ symb:part(var,0),

      \ \ \ \ \ \ \ \ \ \ \ \ \ if index#end then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ if symb=q then
      df:df+diff(f,var)*derivSym[index,1]

      \ \ \ \ \ \ \ \ \ \ \ \ \ elseif symb=v then
      df:df+diff(f,var)*derivSym[index,2])

      \ \ \ \ \ \ \ \ \ \ \ \ \ else(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if var=q then df:df+diff(f,var)*v

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ elseif var=v then df:df+diff(f,var)*a

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ \ 

      \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ return(df)

      \ \ \ \ \ \ \ \ )

      \;
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><math-up|derivate><around*|(|f|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|df>:0,<math-up|varp>:<around*|[||]>,<math-up|sizeVar>:0,<math-up|derivSym>:<math-up|zeromatrix><around*|(|1,1|)>,<math-up|var>:0,<math-up|index>:0,<math-up|symb>:0,<math-up|partswitch>:<math-bf|true>|]>,<math-up|varp>:<math-up|unique><around*|(|<math-up|flatten><around*|(|<around*|[|<math-up|exprbreak><around*|(|f,1|)>|]>|)>|)>,<math-up|sizeVar>:<math-up|length><around*|(|<math-up|varp>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|sizeVar><space|0.27em><math-bf|do><space|0.27em><math-bf|if><space|0.27em>\<neg\><around*|(|<math-up|subvarp><around*|(|<math-up|varp><rsub|i>|)>\<vee\><math-up|symbolp><around*|(|<math-up|varp><rsub|i>|)>|)><space|0.27em><math-bf|then><space|0.27em><math-up|varp><rsub|i>:<around*|[||]>,<math-up|varp>:<math-up|flatten><around*|(|<math-up|varp>|)>,<math-up|sizeVar>:<math-up|length><around*|(|<math-up|varp>|)>,<math-up|derivSym>:<math-up|gradient><around*|(|<math-up|varp>,<math-up|sizeVar>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|sizeVar><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-up|var>:<math-up|varp><rsub|i>,<math-up|index>:<math-up|part><around*|(|<math-up|var>,1|)>,<math-up|symb>:<math-up|part><around*|(|<math-up|var>,0|)>,<math-bf|if><space|0.27em><math-up|index>\<neq\><math-up|end><space|0.27em><math-bf|then><space|0.27em><math-bf|if><space|0.27em><math-up|symb>=q<space|0.27em><math-bf|then><space|0.27em><math-up|df>:<math-up|df>+<math-up|diff><around*|(|f,<math-up|var>|)>*<math-up|derivSym><rsub|<math-up|index>,1><space|0.27em><math-bf|elseif><space|0.27em><math-up|symb>=v<space|0.27em><math-bf|then><space|0.27em><math-up|df>:<math-up|df>+<math-up|diff><around*|(|f,<math-up|var>|)>*<math-up|derivSym><rsub|<math-up|index>,2><space|0.27em><math-bf|else><space|0.27em><around*|(|<math-bf|if><space|0.27em><math-up|var>=q<space|0.27em><math-bf|then><space|0.27em><math-up|df>:<math-up|df>+<math-up|diff><around*|(|f,<math-up|var>|)>*v<space|0.27em><math-bf|elseif><space|0.27em><math-up|var>=v<space|0.27em><math-bf|then><space|0.27em><math-up|df>:<math-up|df>+<math-up|diff><around*|(|f,<math-up|var>|)>*a|)>|)>,<math-up|return><around*|(|<math-up|df>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|unfolded-io>
      matrixDot(m):=block([sizeM:size(m),dotM:zerofor(m)],

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1
      thru sizeM[1] do (

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for
      j:1 thru sizeM[2] do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ dotM[i,j]:derivate(m[i][j])

      )

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return(dotM)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o6>)
      >><math-up|matrixDot><around*|(|m|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|sizeM>:<math-up|size><around*|(|m|)>,<math-up|dotM>:<math-up|zerofor><around*|(|m|)>|]>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|sizeM><rsub|1><space|0.27em><math-bf|do><space|0.27em><math-bf|for><space|0.27em>j<space|0.27em><math-bf|thru><space|0.27em><math-up|sizeM><rsub|2><space|0.27em><math-bf|do><space|0.27em><math-up|dotM><rsub|i,j>:<math-up|derivate><around*|(|<around*|(|m<rsub|i>|)><rsub|j>|)>,<math-up|return><around*|(|<math-up|dotM>|)>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>7) >
    <|input>
      Ulink(Qh,M):=block(

      [g,U,d],

      /*Approssimoaccelerazionegravitazionalea10m/s^2*/

      g:[0,0,10],

      d:submatrix(4,Qh,1,2,3),

      U:-M*g.d,

      return(U)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>8) >
    <|input>
      Tlink(Qh,dof,M):=block(

      [Tr,Tt,w,wt,II,R,Rt,Rd,Sw,result],

      R:submatrix(4,Qh,4),

      d:submatrix(4,Qh,1,2,3),

      Rd:matrixDot(R),

      dd:matrixDot(d),

      Sw:trigsimp(Rd.transpose(R)),

      w:matrix([Sw[3][2]],[Sw[1][3]],[Sw[2][1]]),

      wt:transpose(w),

      dd:trigsimp(trigreduce(trigexpand(dd))),

      ddt:transpose(dd),

      II:inerzia(dof),

      Tt:1/2*M*trigsimp(trigreduce(trigexpand(ddt.dd))),

      Tr:1/2*trigsimp(trigreduce(trigexpand(wt.R.II.transpose(R).w))),

      result:[Tr,Tt,II],

      return(result)

      )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      stampa(T,U):=block([dof:size(T)[2],Tr:rename(T,0),Ur:rename(U,0),Ttot:0,Utot:0],

      \ \ \ 

      \ \ \ for i:1 thru dof do(

      \ \ \ \ \ print(,true,"Link~d~% Energica Cinetica di Rotazione:~m~%\ 

      \ \ \ \ \ \ \ \ \ \ \ \ Energia Cinetica di Traslazione:~m~%\ 

      \ \ \ \ \ \ \ \ \ \ \ \ Matrice di Inerzia:~m~%\ 

      \ \ \ \ \ \ \ \ \ \ \ \ Energia Potenziale:~m",[i,Tr[i][1],Tr[i][2],Tr[i][3],Ur[i]])

      \ \ \ )

      \ \ \ \ 

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><math-up|stampa><around*|(|T,U|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|dof>:<around*|(|<math-up|size><around*|(|T|)>|)><rsub|2>,<math-up|Tr>:<math-up|rename><around*|(|T,0|)>,<math-up|Ur>:<math-up|rename><around*|(|U,0|)>,<math-up|Ttot>:0,<math-up|Utot>:0|]>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|dof><space|0.27em><math-bf|do><space|0.27em><math-up|print><around*|(|<text|Link
      >,i,<text|<nbsp>% >,<text|Energica Cinetica di Rotazione:
      >,<around*|(|<math-up|Tr><rsub|i>|)><rsub|1>,<text|<nbsp>%
      >,<text|Energia Cinetica di Traslazione :
      >,<around*|(|<math-up|Tr><rsub|i>|)><rsub|2>,<text|<nbsp>%
      >,<text|Matrice di Inerzia: >,<around*|(|<math-up|Tr><rsub|i>|)><rsub|3>,<text|<nbsp>%
      >,<text|Energia Potenziale: >,<math-up|Ur><rsub|i>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      energia(tab,M,Trs,flag):=block(

      \ \ [T:[],U:[],E1,E2,E3,Q:[],Qbc:[],i,rowList],

      rowList:args(DH),

      dof:size(rowList)[1],

      Q:DH(tab)[2],

      for i:1 thru size(Q)[2] do (

      \ \ \ Qbc:append(Qbc,[Q[i].baricentro(Trs[i])]),

      \ \ \ T:append(T,[Tlink(Qbc[i],i,M[i])]),

      \ \ \ U:append(U,[Ulink(Qbc[i],M[i])])

      \ \ \ 

      ),if flag=1 then(

      \ \ \ stampa(T,U)),

      \ \ \ return(T,U)

      )
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><math-up|energia><around*|(|<math-up|tab>,M,<math-up|Trs>,<math-up|flag>|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|T:<around*|[||]>,U:<around*|[||]>,<with|math-font-family|rm|E1>,<with|math-font-family|rm|E2>,<with|math-font-family|rm|E3>,Q:<around*|[||]>,<math-up|Qbc>:<around*|[||]>,i,<math-up|rowList>|]>,<math-up|rowList>:<math-up|args><around*|(|<math-up|DH>|)>,<math-up|dof>:<around*|(|<math-up|size><around*|(|<math-up|rowList>|)>|)><rsub|1>,Q:<around*|(|<math-up|DH><around*|(|<math-up|tab>|)>|)><rsub|2>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><around*|(|<math-up|size><around*|(|Q|)>|)><rsub|2><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-up|Qbc>:<math-up|append><around*|(|<math-up|Qbc>,<around*|[|Q<rsub|i>\<cdot\><math-up|baricentro><around*|(|<math-up|Trs><rsub|i>|)>|]>|)>,T:<math-up|append><around*|(|T,<around*|[|<math-up|Tlink><around*|(|<math-up|Qbc><rsub|i>,i,M<rsub|i>|)>|]>|)>,U:<math-up|append><around*|(|U,<around*|[|<math-up|Ulink><around*|(|<math-up|Qbc><rsub|i>,M<rsub|i>|)>|]>|)>|)>,<math-bf|if><space|0.27em><math-up|flag>=1<space|0.27em><math-bf|then><space|0.27em><math-up|stampa><around*|(|T,U|)>,<math-up|return><around*|(|T,U|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      DH:[matrix([q[1],0,0,L[1]],[q[2],0,0,L[2]]),

      matrix([0,q[1],-%pi/2,0],[-%pi/2,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,D[1]],[q[2],0,0,D[2]],[0,q[3],0,L[3]]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,%pi/2,D[2]],[0,q[3],0,0]),

      matrix([q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,0,D[2]],[q[3],0,0,D[3]])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|L<rsub|3>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|0>|<cell|D<rsub|3>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      Trsz:[matrix([-L[1]/2,0,0],[-L[2]/2,0,0]),

      matrix([0,L[1]/2,0],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,0,-L[1]/2],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([-D[1]/2,0,-L[1]/2],[-D[2]/2,0,0],[0,0,L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[0,0,-L[3]/2]),

      matrix([0,L[1]/2,0],[0,-L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[-D[3]/2,0,0])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-<frac|L<rsub|1>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|L<rsub|2>|2>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|-<frac|D<rsub|1>|2>>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|-<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|D<rsub|3>|2>>|<cell|0>|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      M:[M[1],M[2],M[3]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><around*|[|M<rsub|1>,M<rsub|2>,M<rsub|3>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      energia(DH[1],M,Trsz[1],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1*<text|<nbsp>% Energica
      Cinetica di Rotazione: ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|1>>|2>*<text|<nbsp>%
      Energia Cinetica di Traslazione : ><frac|L<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|8><text|<nbsp>%
      Matrice di Inerzia: ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|1>>>|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|xz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|yy><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>|<cell|I<rsub|<math-up|zz><rsub|1>>>>>>><text|<nbsp>%
      Energia Potenziale: >0>>

      <math|<with|math-display|true|<text|Link >2*<text|<nbsp>% Energica
      Cinetica di Rotazione: ><frac|<around*|(|v<rsub|2><rsup|2>+2*v<rsub|1>*v<rsub|2>+v<rsub|1><rsup|2>|)>*I<rsub|<math-up|zz><rsub|2>>|2>*<text|<nbsp>%
      Energia Cinetica di Traslazione : ><frac|M<rsub|2>*<around*|(|L<rsub|2><rsup|2>*<around*|(|v<rsub|2><rsup|2>+2*v<rsub|1>*v<rsub|2>+v<rsub|1><rsup|2>|)>+L<rsub|1>*L<rsub|2>*c<rsub|2>*<around*|(|4*v<rsub|1>*v<rsub|2>+4*v<rsub|1><rsup|2>|)>+4*L<rsub|1><rsup|2>*v<rsub|1><rsup|2>|)>|8><text|<nbsp>%
      Matrice di Inerzia: ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|2>>>|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|xz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|yy><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>|<cell|I<rsub|<math-up|zz><rsub|2>>>>>>><text|<nbsp>%
      Energia Potenziale: >0>>

      \;

      \ <math|<with|math-display|true|<text|<verbatim|r><verbatim|e><verbatim|t><verbatim|u><verbatim|r><verbatim|n><verbatim|:><verbatim|
      ><verbatim|t><verbatim|o><verbatim|o><verbatim|
      ><verbatim|m><verbatim|a><verbatim|n><verbatim|y><verbatim|
      ><verbatim|a><verbatim|r><verbatim|g><verbatim|u><verbatim|m><verbatim|e><verbatim|n><verbatim|t><verbatim|s><verbatim|;><verbatim|
      ><verbatim|f><verbatim|o><verbatim|u><verbatim|n><verbatim|d><verbatim|:><verbatim|
      >><with|math-font-family|rm|errexp1>>>

      #0: energia(tab=matrix([q[1],0,0,L[1]],[q[2],0,0,L[2]]),m=[M[1],M[2],M[3]],trs=matrix([-L[1]/2,0,0],[-L[2]/2,0,0]),flag=1)

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      a:<math|<with|math-display|true|<around*|[|q<rsub|1>,0,0,L<rsub|1>|]>>>
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><around*|[|<with|math-font-family|rm|q_1>,0,0,<with|math-font-family|rm|L_1>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      a[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >><with|math-font-family|rm|q_1>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>51) >
    <|unfolded-io>
      func(x):=block([yy,xx],yy:1,xx:1,return(yy,xx))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o51>)
      >><math-up|func><around*|(|x|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|yy>,<math-up|xx>|]>,<math-up|yy>:1,<math-up|xx>:1,<math-up|return><around*|(|<math-up|yy>,<math-up|xx>|)>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>52) >
    <|unfolded-io>
      q:func(1)
    <|unfolded-io>
      \;

      \;

      \ <math|<with|math-display|true|<text|<verbatim|r><verbatim|e><verbatim|t><verbatim|u><verbatim|r><verbatim|n><verbatim|:><verbatim|
      ><verbatim|t><verbatim|o><verbatim|o><verbatim|
      ><verbatim|m><verbatim|a><verbatim|n><verbatim|y><verbatim|
      ><verbatim|a><verbatim|r><verbatim|g><verbatim|u><verbatim|m><verbatim|e><verbatim|n><verbatim|t><verbatim|s><verbatim|;><verbatim|
      ><verbatim|f><verbatim|o><verbatim|u><verbatim|n><verbatim|d><verbatim|:><verbatim|
      >><around*|[|1,1|]>>>

      #0: func(x=1)

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      size(DH(DH[1])[2])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|1>|)>>|<cell|cos <around*|(|q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*cos
      <around*|(|q<rsub|1>|)>>>|<row|<cell|sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|cos
      <around*|(|q<rsub|2>+q<rsub|1>|)>>|<cell|0>|<cell|L<rsub|2>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>+L<rsub|1>*sin
      <around*|(|q<rsub|1>|)>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      size([[((v[1]^2*I[[1]])/2),((L[1]^2*M[1]*v[1]^2)/8),matrix([I[[1]],
      I[[1]], I[[1]]], [I[[1]], I[[1]], I[[1]]], [I[[1]], I[[1]],
      I[[1]]])],[(((v[2]^2+2*v[1]*v[2]+v[1]^2)*I[[2]])/2),((M[2]*(L[1]*L[2]*(4*v[1]*v[2]+4*v[1]^2)*cos
      (q[2])+L[2]^2*(v[2]^2+2*v[1]*v[2]+v[1]^2)+4*L[1]^2*v[1]^2))/8),matrix([I[[2]],
      I[[2]], I[[2]]], [I[[2]], I[[2]], I[[2]]], [I[[2]], I[[2]], I[[2]]])]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|2,2|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      print("casa\\n","coddio")
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|casan coddio >>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >coddio >>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|a2>
    <associate|page-width|auto>
  </collection>
</initial>