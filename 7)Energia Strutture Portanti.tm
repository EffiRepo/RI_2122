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

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>4) >
    <|input>
      gradient(varp,n):=block([variables:[],M,symbols:[v,a]],

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1 thru n do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if part(varp[i],0)#v then
      (variables:append(variables,[varp[i]]))

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ), variables:flatten(variables),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ n:length(variables),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ M:zeromatrix(n,2),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1 thru n do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for j:1 thru 2 do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if
      part(varp[i],1)#end then(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if j=1 then
      M[i][j]:v[part(varp[i],1)],

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if j=2 then
      M[i][j]:a[part(varp[i],1)])

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ else(if j=1 then
      M[i][j]:v,

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if j=2 then
      M[i][j]:a) \ \ 

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return(M)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>5) >
    <|unfolded-io>
      derivate(f):=block(

      \ \ \ \ \ \ \ \ [df:0,varp:[],sizeVar:0,derivSym:zeromatrix(1,1),var:0,index:0,symb:0,partswitch:true],

      \ \ \ \ \ \ \ \ varp:unique(flatten([exprbreak(f,1)])),

      \ \ \ \ \ \ \ \ sizeVar:length(varp),

      \ \ \ \ \ \ \ \ for i:1 thru sizeVar do(

      \ \ \ \ \ \ \ \ \ \ if not (subvarp(varp[i]) or symbolp(varp[i]) or
      part(varp[i],0)=q or part(varp[i],0)=v) then varp[i]:[]

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
      df:df+diff(f,var)*derivSym[i,1]

      \ \ \ \ \ \ \ \ \ \ \ \ \ elseif symb=v then
      df:df+diff(f,var)*derivSym[i,2])

      \ \ \ \ \ \ \ \ \ \ \ \ \ else(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ if var=q then df:df+diff(f,var)*v

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ elseif var=v then df:df+diff(f,var)*a

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )

      \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ return(df)

      \ )

      \;
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o5>)
      >><math-up|derivate><around*|(|f|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|df>:0,<math-up|varp>:<around*|[||]>,<math-up|sizeVar>:0,<math-up|derivSym>:<math-up|zeromatrix><around*|(|1,1|)>,<math-up|var>:0,<math-up|index>:0,<math-up|symb>:0,<math-up|partswitch>:<math-bf|true>|]>,<math-up|varp>:<math-up|unique><around*|(|<math-up|flatten><around*|(|<around*|[|<math-up|exprbreak><around*|(|f,1|)>|]>|)>|)>,<math-up|sizeVar>:<math-up|length><around*|(|<math-up|varp>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|sizeVar><space|0.27em><math-bf|do><space|0.27em><math-bf|if><space|0.27em>\<neg\><around*|(|<math-up|subvarp><around*|(|<math-up|varp><rsub|i>|)>\<vee\><math-up|symbolp><around*|(|<math-up|varp><rsub|i>|)>\<vee\><math-up|part><around*|(|<math-up|varp><rsub|i>,0|)>=q\<vee\><math-up|part><around*|(|<math-up|varp><rsub|i>,0|)>=v|)><space|0.27em><math-bf|then><space|0.27em><math-up|varp><rsub|i>:<around*|[||]>,<math-up|varp>:<math-up|flatten><around*|(|<math-up|varp>|)>,<math-up|sizeVar>:<math-up|length><around*|(|<math-up|varp>|)>,<math-up|derivSym>:<math-up|gradient><around*|(|<math-up|varp>,<math-up|sizeVar>|)>,<math-bf|for><space|0.27em>i<space|0.27em><math-bf|thru><space|0.27em><math-up|sizeVar><space|0.27em><math-bf|do><space|0.27em><around*|(|<math-up|var>:<math-up|varp><rsub|i>,<math-up|index>:<math-up|part><around*|(|<math-up|var>,1|)>,<math-up|symb>:<math-up|part><around*|(|<math-up|var>,0|)>,<math-bf|if><space|0.27em><math-up|index>\<neq\><math-up|end><space|0.27em><math-bf|then><space|0.27em><math-bf|if><space|0.27em><math-up|symb>=q<space|0.27em><math-bf|then><space|0.27em><math-up|df>:<math-up|df>+<math-up|diff><around*|(|f,<math-up|var>|)>*<math-up|derivSym><rsub|i,1><space|0.27em><math-bf|elseif><space|0.27em><math-up|symb>=v<space|0.27em><math-bf|then><space|0.27em><math-up|df>:<math-up|df>+<math-up|diff><around*|(|f,<math-up|var>|)>*<math-up|derivSym><rsub|i,2><space|0.27em><math-bf|else><space|0.27em><around*|(|<math-bf|if><space|0.27em><math-up|var>=q<space|0.27em><math-bf|then><space|0.27em><math-up|df>:<math-up|df>+<math-up|diff><around*|(|f,<math-up|var>|)>*v<space|0.27em><math-bf|elseif><space|0.27em><math-up|var>=v<space|0.27em><math-bf|then><space|0.27em><math-up|df>:<math-up|df>+<math-up|diff><around*|(|f,<math-up|var>|)>*a|)>|)>,<math-up|return><around*|(|<math-up|df>|)>|)>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>6) >
    <|input>
      matrixDot(m):=block([sizeM:size(m),dotM:zerofor(m)],

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for i:1
      thru sizeM[1] do (

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ for
      j:1 thru sizeM[2] do(

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ dotM[i,j]:derivate(m[i][j])

      )

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ),

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ return(dotM)

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ )$
    </input>

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

      [Tr,Tt,w,wt,II,R,Rt,Rd,Sw,result,dd,ddt],

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

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>9) >
    <|input>
      stampa(T,U,Ttot,Utot):=block([dof:size(U)[2],Tr:T,Ur:U],

      \ \ \ for i:1 thru dof do(

      \ \ \ \ \ \ \ \ print("Link",i),

      \ \ \ \ \ \ \ \ print("Energica Cinetica di Rotazione:",Tr[i][1]),

      \ \ \ \ \ \ \ \ print("Energia Cinetica di Traslazione:",Tr[i][2]),

      \ \ \ \ \ \ \ \ print("Matrice di Inerzia:",Tr[i][3]),

      \ \ \ \ \ \ \ \ print("Energia Potenziale:",Ur[i])

      \ \ \ ),

      \ \ \ \ print("Energia Cinetica Complessiva:",Ttot),

      \ \ \ \ print("Energia Potenziale Complessiva:",Utot)

      )$
    </input>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>10) >
    <|input>
      energia(tab,M,Trs,flag):=block(

      \ \ [T:[],U:[],Q:[],Qbc:[],i,rowList,Qdr:0,Ttot:0,Utot:0],

      rowList:args(DH),

      dof:size(rowList)[1],

      [Qdr,Q]:DH(tab),

      for i:1 thru size(Q)[2] do (

      \ \ \ Qbc:append(Qbc,[Q[i].baricentro(Trs[i])]),

      \ \ \ T:append(T,[Tlink(Qbc[i],i,M[i])]),

      \ \ \ U:append(U,[Ulink(Qbc[i],M[i])]),

      \ \ \ Ttot:expand(trigreduce(expand(Ttot+T[i][1]+T[i][2]))),

      \ \ \ Utot:expand(trigreduce(expand(Utot+U[i])))

      ),if flag=1 then stampa(T,U,Ttot,Utot),

      \ \ \ return(factor([formaQuad(Ttot,size(Q)[2]),Utot]))

      \ \ \ )$
    </input>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>11) >
    <|unfolded-io>
      DH:[matrix([q[1],0,0,L[1]],[q[2],0,0,L[2]]),

      matrix([0,q[1],-%pi/2,0],[-%pi/2,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],0,D[1]],[q[2],0,0,D[2]],[0,q[3],0,L[3]]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,%pi/2,D[2]],[0,q[3],0,0]),

      matrix([q[1],L[1],-%pi/2,0],[q[2],L[2],%pi/2,0],[0,q[3],0,0]),

      matrix([q[1],L[1],%pi/2,0],[q[2],0,0,D[2]],[q[3],0,0,D[3]])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o11>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|0>|<cell|0>|<cell|L<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|L<rsub|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|0>|<cell|D<rsub|1>>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|L<rsub|3>>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|<frac|\<pi\>|2>>|<cell|D<rsub|2>>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|L<rsub|2>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|q<rsub|1>>|<cell|L<rsub|1>>|<cell|<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|q<rsub|2>>|<cell|0>|<cell|0>|<cell|D<rsub|2>>>|<row|<cell|q<rsub|3>>|<cell|0>|<cell|0>|<cell|D<rsub|3>>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>12) >
    <|unfolded-io>
      Trsz:[matrix([-L[1]/2,0,0],[-L[2]/2,0,0]),

      matrix([0,L[1]/2,0],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,0,-L[1]/2],[0,L[2]/2,0],[0,0,-L[3]/2]),

      matrix([-D[1]/2,0,-L[1]/2],[-D[2]/2,0,0],[0,0,L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[0,0,-L[3]/2]),

      matrix([0,L[1]/2,0],[0,-L[2]/2,0],[0,0,-L[3]/2]),

      matrix([0,-L[1]/2,0],[-D[2]/2,0,0],[-D[3]/2,0,0])]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o12>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|-<frac|L<rsub|1>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|L<rsub|2>|2>>|<cell|0>|<cell|0>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|-<frac|D<rsub|1>|2>>|<cell|0>|<cell|-<frac|L<rsub|1>|2>>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|-<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|-<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|-<frac|D<rsub|2>|2>>|<cell|0>|<cell|0>>|<row|<cell|-<frac|D<rsub|3>|2>>|<cell|0>|<cell|0>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>13) >
    <|unfolded-io>
      M:[M[1],M[2],M[3]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o13>)
      >><around*|[|M<rsub|1>,M<rsub|2>,M<rsub|3>|]>>>
    </unfolded-io>

    <\textput>
      2DOF
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>14) >
    <|unfolded-io>
      [T,U]:energia(DH[1],M,Trsz[1],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|1>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|L<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|8>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|1>>>|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|xz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|yy><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>|<cell|I<rsub|<math-up|zz><rsub|1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale: >0>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|2><rsup|2>+2*v<rsub|1>*v<rsub|2>+v<rsub|1><rsup|2>|)>*I<rsub|<math-up|zz><rsub|2>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|2>*<around*|(|L<rsub|1>*L<rsub|2>*<around*|(|4*v<rsub|1>*v<rsub|2>+4*v<rsub|1><rsup|2>|)>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|2><rsup|2>*<around*|(|v<rsub|2><rsup|2>+2*v<rsub|1>*v<rsub|2>+v<rsub|1><rsup|2>|)>+4*L<rsub|1><rsup|2>*v<rsub|1><rsup|2>|)>|8>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|2>>>|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|xz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|yy><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>|<cell|I<rsub|<math-up|zz><rsub|2>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale: >0>>

      <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      ><frac|v<rsub|2><rsup|2>*I<rsub|<math-up|zz><rsub|2>>|2>+v<rsub|1>*v<rsub|2>*I<rsub|<math-up|zz><rsub|2>>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|2>>|2>+<frac|L<rsub|1>*v<rsub|1>*L<rsub|2>*M<rsub|2>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>|2>+<frac|L<rsub|1>*v<rsub|1><rsup|2>*L<rsub|2>*M<rsub|2>*cos
      <around*|(|q<rsub|2>|)>|2>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|1>>|2>+<frac|L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>|8>+<frac|v<rsub|1>*L<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2>|4>+<frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|8>+<frac|L<rsub|1><rsup|2>*v<rsub|1><rsup|2>*M<rsub|2>|2>+<frac|L<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|8>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o14>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|4*I<rsub|<math-up|zz><rsub|2>>+4*L<rsub|1>*L<rsub|2>*M<rsub|2>*cos
      <around*|(|q<rsub|2>|)>+4*I<rsub|<math-up|zz><rsub|1>>+L<rsub|2><rsup|2>*M<rsub|2>+4*L<rsub|1><rsup|2>*M<rsub|2>+L<rsub|1><rsup|2>*M<rsub|1>|4>>|<cell|<frac|4*I<rsub|<math-up|zz><rsub|2>>+2*L<rsub|1>*L<rsub|2>*M<rsub|2>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|2><rsup|2>*M<rsub|2>|8>>>|<row|<cell|<frac|4*I<rsub|<math-up|zz><rsub|2>>+2*L<rsub|1>*L<rsub|2>*M<rsub|2>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|<frac|4*I<rsub|<math-up|zz><rsub|2>>+L<rsub|2><rsup|2>*M<rsub|2>|4>>>>>>,0|]>>>
    </unfolded-io>

    <\textput>
      Robot Cartesiano
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>15) >
    <|unfolded-io>
      [T,U]:energia(DH[2],M,Trsz[2],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|1>*v<rsub|1><rsup|2>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|1>>>|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|xz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|yy><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>|<cell|I<rsub|<math-up|zz><rsub|1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|1>*<around*|(|q<rsub|1>-<frac|L<rsub|1>|2>|)>>>

      <math|<with|math-display|true|<text|Link >2>>

      \;

      \ <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >0>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|2>*<around*|(|v<rsub|2><rsup|2>+v<rsub|1><rsup|2>|)>|2>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|2>>>|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|xz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|yy><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>|<cell|I<rsub|<math-up|zz><rsub|2>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*q<rsub|1>*M<rsub|2>>>

      <math|<with|math-display|true|<text|Link >3>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*<around*|(|v<rsub|3><rsup|2>+v<rsub|2><rsup|2>+v<rsub|1><rsup|2>|)>|2>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|3>>>|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|xz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|yy><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>|<cell|I<rsub|<math-up|zz><rsub|3>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*q<rsub|1>*M<rsub|3>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      ><frac|M<rsub|3>*v<rsub|3><rsup|2>|2>+<frac|v<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|v<rsub|1><rsup|2>*M<rsub|3>|2>+<frac|M<rsub|2>*v<rsub|2><rsup|2>|2>+<frac|v<rsub|1><rsup|2>*M<rsub|2>|2>+<frac|M<rsub|1>*v<rsub|1><rsup|2>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*q<rsub|1>*M<rsub|3>-10*q<rsub|1>*M<rsub|2>-10*M<rsub|1>*q<rsub|1>+5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o15>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|M<rsub|3>+M<rsub|2>+M<rsub|1>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>+M<rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>,-5*<around*|(|2*q<rsub|1>*M<rsub|3>+2*q<rsub|1>*M<rsub|2>+2*M<rsub|1>*q<rsub|1>-L<rsub|1>*M<rsub|1>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>16) >
    <|unfolded-io>
      [T,U]:energia(DH[3],M,Trsz[3],1)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|Link >1>>

      \;

      \ <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|1>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      >0>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|1>>>|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|xz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|yy><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>|<cell|I<rsub|<math-up|zz><rsub|1>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|2>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|2>*v<rsub|2><rsup|2>|2>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|2>>>|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|xz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|yy><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>|<cell|I<rsub|<math-up|zz><rsub|2>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|2>*<around*|(|q<rsub|2>-<frac|L<rsub|2>|2>+L<rsub|1>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Link >3>>

      \;

      \ <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|3>>|2>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*<around*|(|4*v<rsub|3><rsup|2>+4*v<rsub|1><rsup|2>*q<rsub|3><rsup|2>-4*v<rsub|1><rsup|2>*L<rsub|3>*q<rsub|3>+v<rsub|1><rsup|2>*L<rsub|3><rsup|2>+4*v<rsub|2><rsup|2>|)>|8>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|3>>>|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|xz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|yy><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>|<cell|I<rsub|<math-up|zz><rsub|3>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*<around*|(|q<rsub|2>+L<rsub|1>|)>*M<rsub|3>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|3>>|2>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|2>>|2>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|1>>|2>+<frac|M<rsub|3>*v<rsub|3><rsup|2>|2>+<frac|v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>|2>-<frac|v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>|2>+<frac|v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|8>+<frac|v<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|M<rsub|2>*v<rsub|2><rsup|2>|2>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*q<rsub|2>*M<rsub|3>-10*L<rsub|1>*M<rsub|3>-10*M<rsub|2>*q<rsub|2>+5*L<rsub|2>*M<rsub|2>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o16>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|4*I<rsub|<math-up|yy><rsub|3>>+4*I<rsub|<math-up|yy><rsub|2>>+4*I<rsub|<math-up|zz><rsub|1>>+4*M<rsub|3>*q<rsub|3><rsup|2>-4*L<rsub|3>*M<rsub|3>*q<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>|4>>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|M<rsub|3>+M<rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>,-5*<around*|(|2*q<rsub|2>*M<rsub|3>+2*L<rsub|1>*M<rsub|3>+2*M<rsub|2>*q<rsub|2>-L<rsub|2>*M<rsub|2>+2*L<rsub|1>*M<rsub|2>+L<rsub|1>*M<rsub|1>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>17) >
    <|unfolded-io>
      [T,U]:energia(DH[4],M,Trsz[4],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|1>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|D<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|8>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|1>>>|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|xz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|yy><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>|<cell|I<rsub|<math-up|zz><rsub|1>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|2><rsup|2>+2*v<rsub|1>*v<rsub|2>+v<rsub|1><rsup|2>|)>*I<rsub|<math-up|zz><rsub|2>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|2>*<around*|(|D<rsub|1>*D<rsub|2>*<around*|(|4*v<rsub|1>*v<rsub|2>+4*v<rsub|1><rsup|2>|)>*cos
      <around*|(|q<rsub|2>|)>+D<rsub|2><rsup|2>*<around*|(|v<rsub|2><rsup|2>+2*v<rsub|1>*v<rsub|2>+v<rsub|1><rsup|2>|)>+4*D<rsub|1><rsup|2>*v<rsub|1><rsup|2>|)>|8>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|2>>>|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|xz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|yy><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>|<cell|I<rsub|<math-up|zz><rsub|2>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*L<rsub|1>*M<rsub|2>>>

      <math|<with|math-display|true|<text|Link >3>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|2><rsup|2>+2*v<rsub|1>*v<rsub|2>+v<rsub|1><rsup|2>|)>*I<rsub|<math-up|zz><rsub|3>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*<around*|(|D<rsub|1>*<around*|(|L<rsub|3>*<around*|(|<around*|(|2*v<rsub|1>*v<rsub|2>+2*v<rsub|1><rsup|2>|)>*sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>+q<rsub|1>|)>+<around*|(|2*v<rsub|1>*v<rsub|2>+2*v<rsub|1><rsup|2>|)>*cos
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>+q<rsub|1>|)>|)>+D<rsub|2>*<around*|(|<around*|(|2*v<rsub|1>*v<rsub|2>+2*v<rsub|1><rsup|2>|)>*sin
      <around*|(|q<rsub|1>|)>*sin <around*|(|q<rsub|2>+q<rsub|1>|)>+<around*|(|2*v<rsub|1>*v<rsub|2>+2*v<rsub|1><rsup|2>|)>*cos
      <around*|(|q<rsub|1>|)>*cos <around*|(|q<rsub|2>+q<rsub|1>|)>|)>|)>+v<rsub|3><rsup|2>+<around*|(|v<rsub|2><rsup|2>+2*v<rsub|1>*v<rsub|2>+v<rsub|1><rsup|2>|)>*L<rsub|3><rsup|2>+D<rsub|2>*<around*|(|2*v<rsub|2><rsup|2>+4*v<rsub|1>*v<rsub|2>+2*v<rsub|1><rsup|2>|)>*L<rsub|3>+D<rsub|2><rsup|2>*<around*|(|v<rsub|2><rsup|2>+2*v<rsub|1>*v<rsub|2>+v<rsub|1><rsup|2>|)>+D<rsub|1><rsup|2>*v<rsub|1><rsup|2>|)>|2>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|3>>>|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|xz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|yy><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>|<cell|I<rsub|<math-up|zz><rsub|3>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|3>*<around*|(|q<rsub|3>+<frac|L<rsub|3>|2>+L<rsub|1>|)>>>

      <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      ><frac|v<rsub|2><rsup|2>*I<rsub|<math-up|zz><rsub|3>>|2>+v<rsub|1>*v<rsub|2>*I<rsub|<math-up|zz><rsub|3>>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|3>>|2>+<frac|v<rsub|2><rsup|2>*I<rsub|<math-up|zz><rsub|2>>|2>+v<rsub|1>*v<rsub|2>*I<rsub|<math-up|zz><rsub|2>>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|2>>|2>+D<rsub|1>*v<rsub|1>*v<rsub|2>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+D<rsub|1>*v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+D<rsub|1>*v<rsub|1>*D<rsub|2>*v<rsub|2>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+<frac|D<rsub|1>*v<rsub|1>*D<rsub|2>*M<rsub|2>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>|2>+<frac|D<rsub|1>*v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*cos
      <around*|(|q<rsub|2>|)>|2>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|1>>|2>+<frac|M<rsub|3>*v<rsub|3><rsup|2>|2>+<frac|v<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|2>+v<rsub|1>*v<rsub|2>*L<rsub|3><rsup|2>*M<rsub|3>+<frac|v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|2>+D<rsub|2>*v<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>+2*v<rsub|1>*D<rsub|2>*v<rsub|2>*L<rsub|3>*M<rsub|3>+v<rsub|1><rsup|2>*D<rsub|2>*L<rsub|3>*M<rsub|3>+<frac|D<rsub|2><rsup|2>*v<rsub|2><rsup|2>*M<rsub|3>|2>+v<rsub|1>*D<rsub|2><rsup|2>*v<rsub|2>*M<rsub|3>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|1><rsup|2>*v<rsub|1><rsup|2>*M<rsub|3>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>|8>+<frac|v<rsub|1>*D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2>|4>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>|8>+<frac|D<rsub|1><rsup|2>*v<rsub|1><rsup|2>*M<rsub|2>|2>+<frac|D<rsub|1><rsup|2>*M<rsub|1>*v<rsub|1><rsup|2>|8>>>

      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*M<rsub|3>*q<rsub|3>-5*L<rsub|3>*M<rsub|3>-10*L<rsub|1>*M<rsub|3>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o17>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|4*I<rsub|<math-up|zz><rsub|3>>+4*I<rsub|<math-up|zz><rsub|2>>+8*D<rsub|1>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+8*D<rsub|1>*D<rsub|2>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+4*D<rsub|1>*D<rsub|2>*M<rsub|2>*cos
      <around*|(|q<rsub|2>|)>+4*I<rsub|<math-up|zz><rsub|1>>+4*L<rsub|3><rsup|2>*M<rsub|3>+8*D<rsub|2>*L<rsub|3>*M<rsub|3>+4*D<rsub|2><rsup|2>*M<rsub|3>+4*D<rsub|1><rsup|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|2>+4*D<rsub|1><rsup|2>*M<rsub|2>+D<rsub|1><rsup|2>*M<rsub|1>|4>>|<cell|<frac|4*I<rsub|<math-up|zz><rsub|3>>+4*I<rsub|<math-up|zz><rsub|2>>+4*D<rsub|1>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+4*D<rsub|1>*D<rsub|2>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+2*D<rsub|1>*D<rsub|2>*M<rsub|2>*cos
      <around*|(|q<rsub|2>|)>+4*L<rsub|3><rsup|2>*M<rsub|3>+8*D<rsub|2>*L<rsub|3>*M<rsub|3>+4*D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|0>>|<row|<cell|<frac|4*I<rsub|<math-up|zz><rsub|3>>+4*I<rsub|<math-up|zz><rsub|2>>+4*D<rsub|1>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+4*D<rsub|1>*D<rsub|2>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+2*D<rsub|1>*D<rsub|2>*M<rsub|2>*cos
      <around*|(|q<rsub|2>|)>+4*L<rsub|3><rsup|2>*M<rsub|3>+8*D<rsub|2>*L<rsub|3>*M<rsub|3>+4*D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|<frac|4*I<rsub|<math-up|zz><rsub|3>>+4*I<rsub|<math-up|zz><rsub|2>>+4*L<rsub|3><rsup|2>*M<rsub|3>+8*D<rsub|2>*L<rsub|3>*M<rsub|3>+4*D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|2>|4>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>,-5*<around*|(|2*M<rsub|3>*q<rsub|3>+L<rsub|3>*M<rsub|3>+2*L<rsub|1>*M<rsub|3>+2*L<rsub|1>*M<rsub|2>+L<rsub|1>*M<rsub|1>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      [T,U]:energia(DH[5],M,Trsz[5],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|1>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|1>>>|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|xz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|yy><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>|<cell|I<rsub|<math-up|zz><rsub|1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>|)>*I<rsub|<math-up|zz><rsub|2>>-4*v<rsub|1>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|2>>+2*v<rsub|2><rsup|2>*I<rsub|<math-up|yy><rsub|2>>-2*v<rsub|1><rsup|2>*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|2>>+4*v<rsub|1>*v<rsub|2>*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|2>>+<around*|(|v<rsub|1><rsup|2>-v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>|)>*I<rsub|<math-up|xx><rsub|2>>|4>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|D<rsub|2><rsup|2>*M<rsub|2>*<around*|(|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>|)>|16>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|2>>>|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|xz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|yy><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>|<cell|I<rsub|<math-up|zz><rsub|2>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|2>*<around*|(|<frac|D<rsub|2>*sin
      <around*|(|q<rsub|2>|)>|2>+L<rsub|1>|)>>>

      <math|<with|math-display|true|<text|Link >3>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>|)>*I<rsub|<math-up|zz><rsub|3>>-4*v<rsub|1>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|3>>+2*v<rsub|2><rsup|2>*I<rsub|<math-up|yy><rsub|3>>-2*v<rsub|1><rsup|2>*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|3>>+4*v<rsub|1>*v<rsub|2>*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|3>>+<around*|(|v<rsub|1><rsup|2>-v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>|)>*I<rsub|<math-up|xx><rsub|3>>|4>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*<around*|(|D<rsub|2>*<around*|(|8*v<rsub|1><rsup|2>*q<rsub|3>*sin
      <around*|(|2*q<rsub|2>|)>-4*v<rsub|1><rsup|2>*L<rsub|3>*sin
      <around*|(|2*q<rsub|2>|)>-16*v<rsub|2>*v<rsub|3>|)>+q<rsub|3>*<around*|(|4*v<rsub|1><rsup|2>*L<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+<around*|(|-8*v<rsub|2><rsup|2>-4*v<rsub|1><rsup|2>|)>*L<rsub|3>|)>+D<rsub|2><rsup|2>*<around*|(|4*v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+8*v<rsub|2><rsup|2>+4*v<rsub|1><rsup|2>|)>+q<rsub|3><rsup|2>*<around*|(|-4*v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+8*v<rsub|2><rsup|2>+4*v<rsub|1><rsup|2>|)>-v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+8*v<rsub|3><rsup|2>+<around*|(|2*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>|)>*L<rsub|3><rsup|2>|)>|16>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|3>>>|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|xz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|yy><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>|<cell|I<rsub|<math-up|zz><rsub|3>>>>>>>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|3>*<around*|(|D<rsub|2>*sin
      <around*|(|q<rsub|2>|)>-q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+<frac|L<rsub|3>*cos
      <around*|(|q<rsub|2>|)>|2>+L<rsub|1>|)>>>

      <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      ><frac|v<rsub|1><rsup|2>*cos <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|zz><rsub|3>>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|3>>|4>-v<rsub|1>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|3>>+<frac|v<rsub|2><rsup|2>*I<rsub|<math-up|yy><rsub|3>>|2>-<frac|v<rsub|1><rsup|2>*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|3>>|2>+v<rsub|1>*v<rsub|2>*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|3>>-<frac|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xx><rsub|3>>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|xx><rsub|3>>|4>+<frac|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|zz><rsub|2>>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|2>>|4>-v<rsub|1>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|2>>+<frac|v<rsub|2><rsup|2>*I<rsub|<math-up|yy><rsub|2>>|2>-<frac|v<rsub|1><rsup|2>*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|2>>|2>+v<rsub|1>*v<rsub|2>*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|2>>-<frac|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xx><rsub|2>>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|xx><rsub|2>>|4>+<frac|v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|3>*q<rsub|3>*sin
      <around*|(|2*q<rsub|2>|)>|2>-<frac|v<rsub|1><rsup|2>*D<rsub|2>*L<rsub|3>*M<rsub|3>*sin
      <around*|(|2*q<rsub|2>|)>|4>-<frac|v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>|4>+<frac|v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>|4>-<frac|v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>|16>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>|4>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>|16>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|1>>|2>+<frac|M<rsub|3>*v<rsub|3><rsup|2>|2>-D<rsub|2>*v<rsub|2>*M<rsub|3>*v<rsub|3>+<frac|v<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>|2>+<frac|v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>|4>-<frac|v<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>|2>-<frac|v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>|4>+<frac|v<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|8>+<frac|v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|16>+<frac|D<rsub|2><rsup|2>*v<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|3>|4>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>|8>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>|16>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>18) >
    <|unfolded-io>
      [T,U]:energia(DH[6],M,Trsz[6],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*D<rsub|2>*M<rsub|3>*sin <around*|(|q<rsub|2>|)>-5*D<rsub|2>*M<rsub|2>*sin
      <around*|(|q<rsub|2>|)>+10*M<rsub|3>*q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>-5*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>-10*L<rsub|1>*M<rsub|3>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o18>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|4*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|zz><rsub|3>>+4*I<rsub|<math-up|zz><rsub|3>>-8*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|3>>-4*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xx><rsub|3>>+4*I<rsub|<math-up|xx><rsub|3>>+4*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|zz><rsub|2>>+4*I<rsub|<math-up|zz><rsub|2>>-8*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|2>>-4*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xx><rsub|2>>+4*I<rsub|<math-up|xx><rsub|2>>+8*D<rsub|2>*M<rsub|3>*q<rsub|3>*sin
      <around*|(|2*q<rsub|2>|)>-4*D<rsub|2>*L<rsub|3>*M<rsub|3>*sin
      <around*|(|2*q<rsub|2>|)>-4*M<rsub|3>*q<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+4*L<rsub|3>*M<rsub|3>*q<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>-L<rsub|3><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+4*D<rsub|2><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+8*I<rsub|<math-up|yy><rsub|1>>+4*M<rsub|3>*q<rsub|3><rsup|2>-4*L<rsub|3>*M<rsub|3>*q<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>+4*D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|-<frac|cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|3>>-sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|3>>+cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|2>>-sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|2>>|2>>|<cell|0>>|<row|<cell|-<frac|cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|3>>-sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|3>>+cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|2>>-sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|2>>|2>>|<cell|<frac|4*I<rsub|<math-up|yy><rsub|3>>+4*I<rsub|<math-up|yy><rsub|2>>+4*M<rsub|3>*q<rsub|3><rsup|2>-4*L<rsub|3>*M<rsub|3>*q<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>+4*D<rsub|2><rsup|2>*M<rsub|3>+D<rsub|2><rsup|2>*M<rsub|2>|4>>|<cell|-<frac|D<rsub|2>*M<rsub|3>|2>>>|<row|<cell|0>|<cell|-<frac|D<rsub|2>*M<rsub|3>|2>>|<cell|M<rsub|3>>>>>>,-5*<around*|(|2*D<rsub|2>*M<rsub|3>*sin
      <around*|(|q<rsub|2>|)>+D<rsub|2>*M<rsub|2>*sin
      <around*|(|q<rsub|2>|)>-2*M<rsub|3>*q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+2*L<rsub|1>*M<rsub|3>+2*L<rsub|1>*M<rsub|2>+L<rsub|1>*M<rsub|1>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>19) >
    <|unfolded-io>
      [T,U]:energia(DH[7],M,Trsz[7],1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|1>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|1>>>|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|xz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|yy><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>|<cell|I<rsub|<math-up|zz><rsub|1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>|)>*I<rsub|<math-up|zz><rsub|2>>+4*v<rsub|1>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|2>>+2*v<rsub|2><rsup|2>*I<rsub|<math-up|yy><rsub|2>>-2*v<rsub|1><rsup|2>*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|2>>-4*v<rsub|1>*v<rsub|2>*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|2>>+<around*|(|v<rsub|1><rsup|2>-v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>|)>*I<rsub|<math-up|xx><rsub|2>>|4>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|8>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|2>>>|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|xz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|yy><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>|<cell|I<rsub|<math-up|zz><rsub|2>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*L<rsub|1>*M<rsub|2>>>

      <math|<with|math-display|true|<text|Link >3>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|<around*|(|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+v<rsub|1><rsup|2>|)>*I<rsub|<math-up|zz><rsub|3>>+4*v<rsub|1>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|3>>+2*v<rsub|2><rsup|2>*I<rsub|<math-up|yy><rsub|3>>-2*v<rsub|1><rsup|2>*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|3>>-4*v<rsub|1>*v<rsub|2>*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|3>>+<around*|(|v<rsub|1><rsup|2>-v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>|)>*I<rsub|<math-up|xx><rsub|3>>|4>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|3>*<around*|(|q<rsub|3>*<around*|(|4*v<rsub|1><rsup|2>*L<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+<around*|(|-8*v<rsub|2><rsup|2>-4*v<rsub|1><rsup|2>|)>*L<rsub|3>|)>+q<rsub|3><rsup|2>*<around*|(|-4*v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+8*v<rsub|2><rsup|2>+4*v<rsub|1><rsup|2>|)>-v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+L<rsub|2>*<around*|(|-16*v<rsub|1>*v<rsub|3>*sin
      <around*|(|q<rsub|2>|)>-16*v<rsub|1>*v<rsub|2>*q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+8*v<rsub|1>*v<rsub|2>*L<rsub|3>*cos
      <around*|(|q<rsub|2>|)>|)>+8*v<rsub|3><rsup|2>+<around*|(|2*v<rsub|2><rsup|2>+v<rsub|1><rsup|2>|)>*L<rsub|3><rsup|2>+8*v<rsub|1><rsup|2>*L<rsub|2><rsup|2>|)>|16>>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|3>>>|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|xz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|3>>>|<cell|I<rsub|<math-up|yy><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|3>>>|<cell|I<rsub|<math-up|yz><rsub|3>>>|<cell|I<rsub|<math-up|zz><rsub|3>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|3>*<around*|(|q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>-<frac|L<rsub|3>*cos
      <around*|(|q<rsub|2>|)>|2>+L<rsub|1>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      ><frac|v<rsub|1><rsup|2>*cos <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|zz><rsub|3>>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|3>>|4>+v<rsub|1>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|3>>+<frac|v<rsub|2><rsup|2>*I<rsub|<math-up|yy><rsub|3>>|2>-<frac|v<rsub|1><rsup|2>*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|3>>|2>-v<rsub|1>*v<rsub|2>*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|3>>-<frac|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xx><rsub|3>>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|xx><rsub|3>>|4>+<frac|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|zz><rsub|2>>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|zz><rsub|2>>|4>+v<rsub|1>*v<rsub|2>*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|2>>+<frac|v<rsub|2><rsup|2>*I<rsub|<math-up|yy><rsub|2>>|2>-<frac|v<rsub|1><rsup|2>*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|2>>|2>-v<rsub|1>*v<rsub|2>*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|2>>-<frac|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xx><rsub|2>>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|xx><rsub|2>>|4>-<frac|v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>|4>+<frac|v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>|4>-<frac|v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>|16>-v<rsub|1>*L<rsub|2>*M<rsub|3>*v<rsub|3>*sin
      <around*|(|q<rsub|2>|)>-v<rsub|1>*L<rsub|2>*v<rsub|2>*M<rsub|3>*q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+<frac|v<rsub|1>*L<rsub|2>*v<rsub|2>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>|2>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|1>>|2>+<frac|M<rsub|3>*v<rsub|3><rsup|2>|2>+<frac|v<rsub|2><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>|2>+<frac|v<rsub|1><rsup|2>*M<rsub|3>*q<rsub|3><rsup|2>|4>-<frac|v<rsub|2><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>|2>-<frac|v<rsub|1><rsup|2>*L<rsub|3>*M<rsub|3>*q<rsub|3>|4>+<frac|v<rsub|2><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|8>+<frac|v<rsub|1><rsup|2>*L<rsub|3><rsup|2>*M<rsub|3>|16>+<frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|3>|2>+<frac|v<rsub|1><rsup|2>*L<rsub|2><rsup|2>*M<rsub|2>|8>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*M<rsub|3>*q<rsub|3>*cos <around*|(|q<rsub|2>|)>+5*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>-10*L<rsub|1>*M<rsub|3>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o19>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|4*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|zz><rsub|3>>+4*I<rsub|<math-up|zz><rsub|3>>-8*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|3>>-4*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xx><rsub|3>>+4*I<rsub|<math-up|xx><rsub|3>>+4*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|zz><rsub|2>>+4*I<rsub|<math-up|zz><rsub|2>>-8*sin
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xz><rsub|2>>-4*cos
      <around*|(|2*q<rsub|2>|)>*I<rsub|<math-up|xx><rsub|2>>+4*I<rsub|<math-up|xx><rsub|2>>-4*M<rsub|3>*q<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+4*L<rsub|3>*M<rsub|3>*q<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>-L<rsub|3><rsup|2>*M<rsub|3>*cos
      <around*|(|2*q<rsub|2>|)>+8*I<rsub|<math-up|yy><rsub|1>>+4*M<rsub|3>*q<rsub|3><rsup|2>-4*L<rsub|3>*M<rsub|3>*q<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>+8*L<rsub|2><rsup|2>*M<rsub|3>+2*L<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|<frac|2*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|3>>-2*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|3>>+2*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|2>>-2*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|2>>-2*L<rsub|2>*M<rsub|3>*q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|2>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>|4>>|<cell|-<frac|L<rsub|2>*M<rsub|3>*sin
      <around*|(|q<rsub|2>|)>|2>>>|<row|<cell|<frac|2*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|3>>-2*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|3>>+2*cos
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|yz><rsub|2>>-2*sin
      <around*|(|q<rsub|2>|)>*I<rsub|<math-up|xy><rsub|2>>-2*L<rsub|2>*M<rsub|3>*q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+L<rsub|2>*L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>|4>>|<cell|<frac|4*I<rsub|<math-up|yy><rsub|3>>+4*I<rsub|<math-up|yy><rsub|2>>+4*M<rsub|3>*q<rsub|3><rsup|2>-4*L<rsub|3>*M<rsub|3>*q<rsub|3>+L<rsub|3><rsup|2>*M<rsub|3>|4>>|<cell|0>>|<row|<cell|-<frac|L<rsub|2>*M<rsub|3>*sin
      <around*|(|q<rsub|2>|)>|2>>|<cell|0>|<cell|M<rsub|3>>>>>>,-5*<around*|(|2*M<rsub|3>*q<rsub|3>*cos
      <around*|(|q<rsub|2>|)>-L<rsub|3>*M<rsub|3>*cos
      <around*|(|q<rsub|2>|)>+2*L<rsub|1>*M<rsub|3>+2*L<rsub|1>*M<rsub|2>+L<rsub|1>*M<rsub|1>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>20) >
    <|unfolded-io>
      a:DH(DH[2])[2][2].baricentro(Trsz[2][2])*M[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|Link >1>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|1>>|2>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      >0>>

      \;

      \ <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|1>>>|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|xz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|1>>>|<cell|I<rsub|<math-up|yy><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|1>>>|<cell|I<rsub|<math-up|yz><rsub|1>>>|<cell|I<rsub|<math-up|zz><rsub|1>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-5*L<rsub|1>*M<rsub|1>>>

      <math|<with|math-display|true|<text|Link >2>>

      <math|<with|math-display|true|<text|Energica Cinetica di Rotazione:
      ><frac|2*v<rsub|1><rsup|2>*I<rsub|<math-up|xy><rsub|2>>*sin
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>+<around*|(|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|2>>-v<rsub|1><rsup|2>*I<rsub|<math-up|xx><rsub|2>>|)>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>+<around*|(|4*v<rsub|1>*v<rsub|3>+4*v<rsub|1>*v<rsub|2>|)>*I<rsub|<math-up|xz><rsub|2>>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>+<around*|(|4*v<rsub|1>*v<rsub|3>+4*v<rsub|1>*v<rsub|2>|)>*I<rsub|<math-up|yz><rsub|2>>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>+<around*|(|2*v<rsub|3><rsup|2>+4*v<rsub|2>*v<rsub|3>+2*v<rsub|2><rsup|2>|)>*I<rsub|<math-up|zz><rsub|2>>+v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|2>>+v<rsub|1><rsup|2>*I<rsub|<math-up|xx><rsub|2>>|4>>>

      <math|<with|math-display|true|<text|Energia Cinetica di Traslazione:
      ><frac|M<rsub|2>*<around*|(|D<rsub|3><rsup|2>*<around*|(|4*v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>+8*v<rsub|3><rsup|2>+16*v<rsub|2>*v<rsub|3>+8*v<rsub|2><rsup|2>+4*v<rsub|1><rsup|2>|)>+D<rsub|2><rsup|2>*<around*|(|v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>-4*v<rsub|1><rsup|2>*cos
      <around*|(|q<rsub|3>+2*q<rsub|2>|)>+<around*|(|-8*v<rsub|2>*v<rsub|3>-8*v<rsub|2><rsup|2>-4*v<rsub|1><rsup|2>|)>*cos
      <around*|(|q<rsub|3>|)>+4*v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|2>|)>+2*v<rsub|3><rsup|2>+4*v<rsub|2>*v<rsub|3>+10*v<rsub|2><rsup|2>+5*v<rsub|1><rsup|2>|)>+D<rsub|2>*D<rsub|3>*<around*|(|-4*v<rsub|1><rsup|2>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>+8*v<rsub|1><rsup|2>*cos
      <around*|(|q<rsub|3>+2*q<rsub|2>|)>+<around*|(|16*v<rsub|2>*v<rsub|3>+16*v<rsub|2><rsup|2>+8*v<rsub|1><rsup|2>|)>*cos
      <around*|(|q<rsub|3>|)>-8*v<rsub|3><rsup|2>-16*v<rsub|2>*v<rsub|3>-8*v<rsub|2><rsup|2>-4*v<rsub|1><rsup|2>|)>|)>|16>>>

      <math|<with|math-display|true|<text|Matrice di Inerzia:
      ><matrix|<tformat|<table|<row|<cell|I<rsub|<math-up|xx><rsub|2>>>|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|xz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xy><rsub|2>>>|<cell|I<rsub|<math-up|yy><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>>|<row|<cell|I<rsub|<math-up|xz><rsub|2>>>|<cell|I<rsub|<math-up|yz><rsub|2>>>|<cell|I<rsub|<math-up|zz><rsub|2>>>>>>>>>

      <math|<with|math-display|true|<text|Energia Potenziale:
      >-10*M<rsub|2>*<around*|(|D<rsub|3>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>-<frac|D<rsub|2>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>|2>+D<rsub|2>*sin
      <around*|(|q<rsub|2>|)>+L<rsub|1>|)>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Cinetica Complessiva:
      ><frac|v<rsub|1><rsup|2>*I<rsub|<math-up|xy><rsub|2>>*sin
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>|2>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|2>>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>|4>-<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|xx><rsub|2>>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>|4>+<frac|v<rsub|1><rsup|2>*M<rsub|2>*D<rsub|3><rsup|2>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>|4>-<frac|v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*D<rsub|3>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>|4>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*q<rsub|3>+2*q<rsub|2>|)>|16>+<frac|v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*D<rsub|3>*cos
      <around*|(|q<rsub|3>+2*q<rsub|2>|)>|2>-<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|q<rsub|3>+2*q<rsub|2>|)>|4>+v<rsub|1>*v<rsub|3>*I<rsub|<math-up|xz><rsub|2>>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>+v<rsub|1>*v<rsub|2>*I<rsub|<math-up|xz><rsub|2>>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>+v<rsub|1>*v<rsub|3>*I<rsub|<math-up|yz><rsub|2>>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>+v<rsub|1>*v<rsub|2>*I<rsub|<math-up|yz><rsub|2>>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>+D<rsub|2>*M<rsub|2>*v<rsub|2>*D<rsub|3>*v<rsub|3>*cos
      <around*|(|q<rsub|3>|)>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2>*v<rsub|3>*cos
      <around*|(|q<rsub|3>|)>|2>+D<rsub|2>*M<rsub|2>*v<rsub|2><rsup|2>*D<rsub|3>*cos
      <around*|(|q<rsub|3>|)>+<frac|v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*D<rsub|3>*cos
      <around*|(|q<rsub|3>|)>|2>-<frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>*cos
      <around*|(|q<rsub|3>|)>|2>-<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|q<rsub|3>|)>|4>+<frac|v<rsub|3><rsup|2>*I<rsub|<math-up|zz><rsub|2>>|2>+v<rsub|2>*v<rsub|3>*I<rsub|<math-up|zz><rsub|2>>+<frac|v<rsub|2><rsup|2>*I<rsub|<math-up|zz><rsub|2>>|2>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|2>>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|xx><rsub|2>>|4>+<frac|v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>|4>+<frac|v<rsub|1><rsup|2>*I<rsub|<math-up|yy><rsub|1>>|2>+<frac|M<rsub|2>*D<rsub|3><rsup|2>*v<rsub|3><rsup|2>|2>-<frac|D<rsub|2>*M<rsub|2>*D<rsub|3>*v<rsub|3><rsup|2>|2>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|3><rsup|2>|8>+M<rsub|2>*v<rsub|2>*D<rsub|3><rsup|2>*v<rsub|3>-D<rsub|2>*M<rsub|2>*v<rsub|2>*D<rsub|3>*v<rsub|3>+<frac|D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2>*v<rsub|3>|4>+<frac|M<rsub|2>*v<rsub|2><rsup|2>*D<rsub|3><rsup|2>|2>+<frac|v<rsub|1><rsup|2>*M<rsub|2>*D<rsub|3><rsup|2>|4>-<frac|D<rsub|2>*M<rsub|2>*v<rsub|2><rsup|2>*D<rsub|3>|2>-<frac|v<rsub|1><rsup|2>*D<rsub|2>*M<rsub|2>*D<rsub|3>|4>+<frac|5*D<rsub|2><rsup|2>*M<rsub|2>*v<rsub|2><rsup|2>|8>+<frac|5*v<rsub|1><rsup|2>*D<rsub|2><rsup|2>*M<rsub|2>|16>>>

      \;

      \ <math|<with|math-display|true|<text|Energia Potenziale Complessiva:
      >-10*M<rsub|2>*D<rsub|3>*sin <around*|(|q<rsub|3>+q<rsub|2>|)>+5*D<rsub|2>*M<rsub|2>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>-10*D<rsub|2>*M<rsub|2>*sin
      <around*|(|q<rsub|2>|)>-10*L<rsub|1>*M<rsub|2>-5*L<rsub|1>*M<rsub|1>>>

      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o20>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|<frac|8*D<rsub|2>*M<rsub|2>*D<rsub|3>*cos
      <around*|(|q<rsub|3>+2*q<rsub|2>|)>-4*D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|q<rsub|3>+2*q<rsub|2>|)>+8*I<rsub|<math-up|xy><rsub|2>>*sin
      <around*|(|2*<around*|(|q<rsub|3>+q<rsub|2>|)>|)>+4*I<rsub|<math-up|yy><rsub|2>>*cos
      <around*|(|2*<around*|(|q<rsub|3>+q<rsub|2>|)>|)>-4*I<rsub|<math-up|xx><rsub|2>>*cos
      <around*|(|2*<around*|(|q<rsub|3>+q<rsub|2>|)>|)>+4*M<rsub|2>*D<rsub|3><rsup|2>*cos
      <around*|(|2*<around*|(|q<rsub|3>+q<rsub|2>|)>|)>-4*D<rsub|2>*M<rsub|2>*D<rsub|3>*cos
      <around*|(|2*<around*|(|q<rsub|3>+q<rsub|2>|)>|)>+D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*<around*|(|q<rsub|3>+q<rsub|2>|)>|)>+8*D<rsub|2>*M<rsub|2>*D<rsub|3>*cos
      <around*|(|q<rsub|3>|)>-4*D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|q<rsub|3>|)>+4*I<rsub|<math-up|yy><rsub|2>>+4*I<rsub|<math-up|xx><rsub|2>>+4*D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|2*q<rsub|2>|)>+8*I<rsub|<math-up|yy><rsub|1>>+4*M<rsub|2>*D<rsub|3><rsup|2>-4*D<rsub|2>*M<rsub|2>*D<rsub|3>+5*D<rsub|2><rsup|2>*M<rsub|2>|8>>|<cell|<frac|I<rsub|<math-up|xz><rsub|2>>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>+I<rsub|<math-up|yz><rsub|2>>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>|2>>>|<row|<cell|<frac|I<rsub|<math-up|xz><rsub|2>>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>+I<rsub|<math-up|yz><rsub|2>>*cos
      <around*|(|q<rsub|3>+q<rsub|2>|)>|2>>|<cell|<frac|8*D<rsub|2>*M<rsub|2>*D<rsub|3>*cos
      <around*|(|q<rsub|3>|)>-4*D<rsub|2><rsup|2>*M<rsub|2>*cos
      <around*|(|q<rsub|3>|)>+4*I<rsub|<math-up|zz><rsub|2>>+4*M<rsub|2>*D<rsub|3><rsup|2>-4*D<rsub|2>*M<rsub|2>*D<rsub|3>+5*D<rsub|2><rsup|2>*M<rsub|2>|4>>>>>>,-5*<around*|(|2*M<rsub|2>*D<rsub|3>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>-D<rsub|2>*M<rsub|2>*sin
      <around*|(|q<rsub|3>+q<rsub|2>|)>+2*D<rsub|2>*M<rsub|2>*sin
      <around*|(|q<rsub|2>|)>+2*L<rsub|1>*M<rsub|2>+L<rsub|1>*M<rsub|1>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>21) >
    <|unfolded-io>
      b:DH(DH[2])[2][1].baricentro(Trsz[2][1])*M[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o21>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|M<rsub|2>>|<cell|0>>|<row|<cell|0>|<cell|-M<rsub|2>>|<cell|0>|<cell|M<rsub|2>*<around*|(|q<rsub|2>-<frac|L<rsub|2>|2>|)>>>|<row|<cell|M<rsub|2>>|<cell|0>|<cell|0>|<cell|q<rsub|1>*M<rsub|2>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|M<rsub|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>22) >
    <|unfolded-io>
      c:DH(DH[2])[2][3].baricentro(Trsz[2][3])*M[3]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o22>)
      >><matrix|<tformat|<table|<row|<cell|M<rsub|1>>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|M<rsub|1>>|<cell|0>>|<row|<cell|0>|<cell|-M<rsub|1>>|<cell|0>|<cell|M<rsub|1>*<around*|(|q<rsub|1>-<frac|L<rsub|1>|2>|)>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|M<rsub|1>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>23) >
    <|unfolded-io>
      a:submatrix(4,a,1,2,3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o23>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|M<rsub|3>>|<cell|M<rsub|3>*<around*|(|q<rsub|3>-<frac|L<rsub|3>|2>|)>>>|<row|<cell|0>|<cell|-M<rsub|3>>|<cell|0>|<cell|q<rsub|2>*M<rsub|3>>>|<row|<cell|M<rsub|3>>|<cell|0>|<cell|0>|<cell|q<rsub|1>*M<rsub|3>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|M<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>24) >
    <|unfolded-io>
      b:submatrix(4,b,1,2,3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o24>)
      >><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|M<rsub|2>*<around*|(|q<rsub|2>-<frac|L<rsub|2>|2>|)>>>|<row|<cell|q<rsub|1>*M<rsub|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>25) >
    <|unfolded-io>
      c:submatrix(4,c,1,2,3)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o25>)
      >><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|M<rsub|1>*<around*|(|q<rsub|1>-<frac|L<rsub|1>|2>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>26) >
    <|unfolded-io>
      g:matrix([0,0,-10])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o26>)
      >><matrix|<tformat|<table|<row|<cell|M<rsub|3>*<around*|(|q<rsub|3>-<frac|L<rsub|3>|2>|)>>>|<row|<cell|q<rsub|2>*M<rsub|3>>>|<row|<cell|q<rsub|1>*M<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>27) >
    <|unfolded-io>
      g.a+g.b+g.c
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o27>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|-10>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>28) >
    <|unfolded-io>
      sort(DH(DH[2])[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o28>)
      >>-10*q<rsub|1>*M<rsub|3>-10*q<rsub|1>*M<rsub|2>-10*M<rsub|1>*<around*|(|q<rsub|1>-<frac|L<rsub|1>|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>29) >
    <|unfolded-io>
      Qij(0,q[1],-%pi/2,0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o29>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>30) >
    <|unfolded-io>
      derivate(cos(q[1]+q[2]))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o30>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>31) >
    <|unfolded-io>
      depends(q,t)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o31>)
      >>-v<rsub|2>*sin <around*|(|q<rsub|2>+q<rsub|1>|)>-v<rsub|1>*sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>32) >
    <|unfolded-io>
      diff(cos(q[1]+q[2]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o32>)
      >><around*|[|q<around*|(|t|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>33) >
    <|unfolded-io>
      cart:DH[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o33>)
      >>-sin <around*|(|q<rsub|2>+q<rsub|1>|)>*d<around*|(|q<rsub|2>|)>-sin
      <around*|(|q<rsub|2>+q<rsub|1>|)>*d<around*|(|q<rsub|1>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>34) >
    <|unfolded-io>
      dr:DH(cart)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o34>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|q<rsub|1>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|-<frac|\<pi\>|2>>|<cell|q<rsub|2>>|<cell|-<frac|\<pi\>|2>>|<cell|0>>|<row|<cell|0>|<cell|q<rsub|3>>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>35) >
    <|unfolded-io>
      Q01:dr[2][1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o35>)
      >><around*|[|<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<around*|[|<matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>,<matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>36) >
    <|unfolded-io>
      Q02:dr[2][2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o36>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>37) >
    <|unfolded-io>
      Q03:dr[2][3]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o37>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>38) >
    <|unfolded-io>
      Trc:Trsz[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o38>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>39) >
    <|unfolded-io>
      Q01bc:Q01.baricentro(Trc[1])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o39>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|<frac|L<rsub|1>|2>>|<cell|0>>|<row|<cell|0>|<cell|<frac|L<rsub|2>|2>>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|-<frac|L<rsub|3>|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>40) >
    <|unfolded-io>
      Q02bc:Q02.baricentro(Trc[2])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o40>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|0>|<cell|0>|<cell|0>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|1>-<frac|L<rsub|1>|2>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>41) >
    <|unfolded-io>
      Q03bc:Q03.baricentro(Trc[3])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o41>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|0>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>-<frac|L<rsub|2>|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>42) >
    <|unfolded-io>
      g:matrix([0],[0],[-10])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o42>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>-<frac|L<rsub|3>|2>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>43) >
    <|unfolded-io>
      M[1]*transpose(g).matrix([0], [0], [q[1]+((L[1])/2)])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o43>)
      >><matrix|<tformat|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|-10>>>>>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>44) >
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