<TeXmacs|2.1.2>

<style|<tuple|generic|italian|maxima>>

<\body>
  <doc-data|<doc-title|Orientamento Inverso>|<doc-author|<author-data|<author-name|Andrea
  Efficace & Lorenzo Rossi>>>>

  Risolvere il problema dell'orientamento inverso scegliendo una terna di
  Eulero; applicarla a tutte le strutture portanti.

  <\session|maxima|default>
    \;

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>115) >
    <|unfolded-io>
      orientInversoEuleroZXZ(R):=block([eq,cb,sb,beta1,beta2,sgamma1,sgamma2,

      \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ gamma1,gamma2,cgamma1,cgamma2,salpha1,salpha2,calpha1,calpha2,alpha1,alpha2,Reulero],

      \ \ \ \ \ \ \ \ Reulero:rename(ternaEulero([z,x,z],[alpha,beta,gamma]),0),

      \ \ \ \ \ if(matrix_input(R)#false) then(

      \ \ \ \ \ \ \ eq:eliminate([c[beta]=R[3,3],c[beta]^2+s[beta]^2=1],[c[beta]]),

      \ \ \ \ \ \ \ cb:R[3,3],

      \ \ \ \ \ \ \ sb:solve(eq[1]=0,s[beta]),

      \ \ \ \ \ \ \ beta1:atan2mod(rhs(sb[1]),cb),

      \ \ \ \ \ \ \ beta2:atan2mod(rhs(sb[2]),cb),

      \ \ \ \ \ \ \ eq:eliminate([Reulero[3,1]=R[3,1],Reulero[3,2]=R[3,2],sb[1]],[s[beta]]),print(Reulero[3,1]=R[3,1]),print(Reulero[3,2]=R[3,2]),

      \ \ \ \ \ \ \ print(sb[1]),print(eq),

      \ \ \ \ \ \ \ sgamma1:solve(eq[1],s[gamma]),

      \ \ \ \ \ \ \ cgamma1:solve(eq[2]=0,c[gamma]),

      \ \ \ \ \ \ \ gamma1:atan2(rhs(sgamma1[1]),rhs(cgamma1[1])),

      \ \ \ \ \ \ \ eq:eliminate([Reulero[3,1]=R[3,1],Reulero[3,2]=R[3,2],sb[2]],[s[beta]]),

      \ \ \ \ \ \ \ sgamma2:solve(eq[1],s[gamma]),

      \ \ \ \ \ \ \ cgamma2:solve(eq[2],c[gamma]),

      \ \ \ \ \ \ \ gamma2:atan2(rhs(sgamma2[1]),rhs(cgamma2[1])),

      \ \ \ \ \ \ \ eq:eliminate([Reulero[1,3]=R[1,3],Reulero[2,3]=R[2,3],sb[1]],[s[beta]]),

      \ \ \ \ \ \ \ salpha1:solve(eq[1],s[alpha]),

      \ \ \ \ \ \ \ calpha1:solve(eq[2],c[alpha]),

      \ \ \ \ \ \ \ alpha1:atan2(rhs(salpha1[1]),rhs(calpha1[1])),

      \ \ \ \ \ \ \ eq:eliminate([Reulero[1,3]=R[1,3],Reulero[2,3]=R[2,3],sb[2]],[s[beta]]),

      \ \ \ \ \ \ \ salpha2:solve(eq[1],s[alpha]),

      \ \ \ \ \ \ \ calpha2:solve(eq[2],c[alpha]),

      \ \ \ \ \ \ \ alpha2:atan2(rhs(salpha2[1]),rhs(calpha2[1])),

      \ \ \ \ \ \ \ return([[alpha1,beta1,gamma1],[alpha2,beta2,gamma2]])

      \ \ \ \ \ \ 

      \ \ \ \ \ )

      )
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o115>)
      >><math-up|orientInversoEuleroZXZ><around*|(|R|)>\<assign\><math-bf|block><space|0.27em><around*|(|<around*|[|<math-up|eq>,<math-up|cb>,<math-up|sb>,<with|math-font-family|rm|beta1>,<with|math-font-family|rm|beta2>,<with|math-font-family|rm|sgamma1>,<with|math-font-family|rm|sgamma2>,<with|math-font-family|rm|gamma1>,<with|math-font-family|rm|gamma2>,<with|math-font-family|rm|cgamma1>,<with|math-font-family|rm|cgamma2>,<with|math-font-family|rm|salpha1>,<with|math-font-family|rm|salpha2>,<with|math-font-family|rm|calpha1>,<with|math-font-family|rm|calpha2>,<with|math-font-family|rm|alpha1>,<with|math-font-family|rm|alpha2>,<math-up|Reulero>|]>,<math-up|Reulero>:<math-up|rename><around*|(|<math-up|ternaEulero><around*|(|<around*|[|z,x,z|]>,<around*|[|\<alpha\>,\<beta\>,\<gamma\>|]>|)>,0|)>,<math-bf|if><space|0.27em><with|math-font-family|rm|matrix_input><around*|(|R|)>\<neq\><math-bf|false><space|0.27em><math-bf|then><space|0.27em><around*|(|<math-up|eq>:<math-up|eliminate><around*|(|<around*|[|c<rsub|\<beta\>>=R<rsub|3,3>,c<rsub|\<beta\>><rsup|2>+s<rsub|\<beta\>><rsup|2>=1|]>,<around*|[|c<rsub|\<beta\>>|]>|)>,<math-up|cb>:R<rsub|3,3>,<math-up|sb>:<math-up|solve><around*|(|<math-up|eq><rsub|1>=0,s<rsub|\<beta\>>|)>,<with|math-font-family|rm|beta1>:<with|math-font-family|rm|atan2mod><around*|(|<math-up|rhs><around*|(|<math-up|sb><rsub|1>|)>,<math-up|cb>|)>,<with|math-font-family|rm|beta2>:<with|math-font-family|rm|atan2mod><around*|(|<math-up|rhs><around*|(|<math-up|sb><rsub|2>|)>,<math-up|cb>|)>,<math-up|eq>:<math-up|eliminate><around*|(|<around*|[|<math-up|Reulero><rsub|3,1>=R<rsub|3,1>,<math-up|Reulero><rsub|3,2>=R<rsub|3,2>,<math-up|sb><rsub|1>|]>,<around*|[|s<rsub|\<beta\>>|]>|)>,<math-up|print><around*|(|<math-up|Reulero><rsub|3,1>=R<rsub|3,1>|)>,<math-up|print><around*|(|<math-up|Reulero><rsub|3,2>=R<rsub|3,2>|)>,<math-up|print><around*|(|<math-up|sb><rsub|1>|)>,<math-up|print><around*|(|<math-up|eq>|)>,<with|math-font-family|rm|sgamma1>:<math-up|solve><around*|(|<math-up|eq><rsub|1>,s<rsub|\<gamma\>>|)>,<with|math-font-family|rm|cgamma1>:<math-up|solve><around*|(|<math-up|eq><rsub|2>=0,c<rsub|\<gamma\>>|)>,<with|math-font-family|rm|gamma1>:<math-up|atan2><around*|(|<math-up|rhs><around*|(|<with|math-font-family|rm|sgamma1><rsub|1>|)>,<math-up|rhs><around*|(|<with|math-font-family|rm|cgamma1><rsub|1>|)>|)>,<math-up|eq>:<math-up|eliminate><around*|(|<around*|[|<math-up|Reulero><rsub|3,1>=R<rsub|3,1>,<math-up|Reulero><rsub|3,2>=R<rsub|3,2>,<math-up|sb><rsub|2>|]>,<around*|[|s<rsub|\<beta\>>|]>|)>,<with|math-font-family|rm|sgamma2>:<math-up|solve><around*|(|<math-up|eq><rsub|1>,s<rsub|\<gamma\>>|)>,<with|math-font-family|rm|cgamma2>:<math-up|solve><around*|(|<math-up|eq><rsub|2>,c<rsub|\<gamma\>>|)>,<with|math-font-family|rm|gamma2>:<math-up|atan2><around*|(|<math-up|rhs><around*|(|<with|math-font-family|rm|sgamma2><rsub|1>|)>,<math-up|rhs><around*|(|<with|math-font-family|rm|cgamma2><rsub|1>|)>|)>,<math-up|eq>:<math-up|eliminate><around*|(|<around*|[|<math-up|Reulero><rsub|1,3>=R<rsub|1,3>,<math-up|Reulero><rsub|2,3>=R<rsub|2,3>,<math-up|sb><rsub|1>|]>,<around*|[|s<rsub|\<beta\>>|]>|)>,<with|math-font-family|rm|salpha1>:<math-up|solve><around*|(|<math-up|eq><rsub|1>,s<rsub|\<alpha\>>|)>,<with|math-font-family|rm|calpha1>:<math-up|solve><around*|(|<math-up|eq><rsub|2>,c<rsub|\<alpha\>>|)>,<with|math-font-family|rm|alpha1>:<math-up|atan2><around*|(|<math-up|rhs><around*|(|<with|math-font-family|rm|salpha1><rsub|1>|)>,<math-up|rhs><around*|(|<with|math-font-family|rm|calpha1><rsub|1>|)>|)>,<math-up|eq>:<math-up|eliminate><around*|(|<around*|[|<math-up|Reulero><rsub|1,3>=R<rsub|1,3>,<math-up|Reulero><rsub|2,3>=R<rsub|2,3>,<math-up|sb><rsub|2>|]>,<around*|[|s<rsub|\<beta\>>|]>|)>,<with|math-font-family|rm|salpha2>:<math-up|solve><around*|(|<math-up|eq><rsub|1>,s<rsub|\<alpha\>>|)>,<with|math-font-family|rm|calpha2>:<math-up|solve><around*|(|<math-up|eq><rsub|2>,c<rsub|\<alpha\>>|)>,<with|math-font-family|rm|alpha2>:<math-up|atan2><around*|(|<math-up|rhs><around*|(|<with|math-font-family|rm|salpha2><rsub|1>|)>,<math-up|rhs><around*|(|<with|math-font-family|rm|calpha2><rsub|1>|)>|)>,<math-up|return><around*|(|<around*|[|<around*|[|<with|math-font-family|rm|alpha1>,<with|math-font-family|rm|beta1>,<with|math-font-family|rm|gamma1>|]>,<around*|[|<with|math-font-family|rm|alpha2>,<with|math-font-family|rm|beta2>,<with|math-font-family|rm|gamma2>|]>|]>|)>|)>|)>>>
    </unfolded-io>

    <\textput>
      <center|<with|font-series|bold|Cartesiano>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>116) >
    <|unfolded-io>
      cart:[[0,q[1],-%pi/2,0],[-%pi/2,q[2],-%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o116>)
      >><around*|[|<around*|[|0,q<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|-<frac|\<pi\>|2>,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>117) >
    <|unfolded-io>
      Q03:DH(cart)[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o117>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>|<cell|q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>>>|<row|<cell|1>|<cell|0>|<cell|0>|<cell|q<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>118) >
    <|unfolded-io>
      R03:submatrix(4,Q03,4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o118>)
      >><matrix|<tformat|<table|<row|<cell|0>|<cell|0>|<cell|1>>|<row|<cell|0>|<cell|-1>|<cell|0>>|<row|<cell|1>|<cell|0>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>119) >
    <|unfolded-io>
      orientInversoEuleroZXZ(R03)
    <|unfolded-io>
      <math|<with|math-display|true|s<rsub|\<beta\>>*s<rsub|\<gamma\>>=1>>

      <math|<with|math-display|true|s<rsub|\<beta\>>*c<rsub|\<gamma\>>=0>>

      \;

      \ <math|<with|math-display|true|s<rsub|\<beta\>>=-1>>

      \;

      \ <math|<with|math-display|true|<around*|[|s<rsub|\<gamma\>>+1,-c<rsub|\<gamma\>>|]>>>

      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o119>)
      >><around*|[|<around*|[|-<frac|\<pi\>|2>,-<frac|\<pi\>|2>,-<frac|\<pi\>|2>|]>,<around*|[|<frac|\<pi\>|2>,<frac|\<pi\>|2>,<frac|\<pi\>|2>|]>|]>>>
    </unfolded-io>

    <center|<with|font-series|bold|Cilindrico>>

    <center|<with|font-series|bold|>>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>120) >
    <|unfolded-io>
      cil:[[q[1],L[1],0,0],[0,q[2],-%pi/2,0],[0,q[3],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o120>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,0,0|]>,<around*|[|0,q<rsub|2>,-<frac|\<pi\>|2>,0|]>,<around*|[|0,q<rsub|3>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>121) >
    <|unfolded-io>
      Q03:rename(DH(cil)[1],0)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o121>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|0>|<cell|-s<rsub|1>>|<cell|-s<rsub|1>*q<rsub|3>>>|<row|<cell|s<rsub|1>>|<cell|0>|<cell|c<rsub|1>>|<cell|c<rsub|1>*q<rsub|3>>>|<row|<cell|0>|<cell|-1>|<cell|0>|<cell|q<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>122) >
    <|unfolded-io>
      R03:submatrix(4,Q03,4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o122>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>>|<cell|0>|<cell|-s<rsub|1>>>|<row|<cell|s<rsub|1>>|<cell|0>|<cell|c<rsub|1>>>|<row|<cell|0>|<cell|-1>|<cell|0>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>123) >
    <|unfolded-io>
      orientInversoEuleroZXZ(R03)
    <|unfolded-io>
      <math|<with|math-display|true|s<rsub|\<beta\>>*s<rsub|\<gamma\>>=0>>

      <math|<with|math-display|true|s<rsub|\<beta\>>*c<rsub|\<gamma\>>=-1>>

      <math|<with|math-display|true|s<rsub|\<beta\>>=-1>>

      \;

      \ <math|<with|math-display|true|<around*|[|s<rsub|\<gamma\>>,s<rsub|\<gamma\>>|]>>>

      <math|<with|math-display|true|<math-up|inpart><text|<verbatim|:><verbatim|
      ><verbatim|i><verbatim|n><verbatim|v><verbatim|a><verbatim|l><verbatim|i><verbatim|d><verbatim|
      ><verbatim|i><verbatim|n><verbatim|d><verbatim|e><verbatim|x><verbatim|
      >>1<text|<verbatim| ><verbatim|o><verbatim|f><verbatim|
      ><verbatim|l><verbatim|i><verbatim|s><verbatim|t><verbatim|
      ><verbatim|o><verbatim|r><verbatim|
      ><verbatim|m><verbatim|a><verbatim|t><verbatim|r><verbatim|i><verbatim|x><verbatim|.>>>>

      #0: orientInversoEuleroZXZ(r=matrix([c[1],0,-s[1]],[s[1],0,c[1]],[0,-1,0]))

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>128) >
    <|unfolded-io>
      eliminate([s[beta]*s[gamma]=0,s[beta]*c[gamma]=-1,s[beta]=1],[s[beta]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o128>)
      >><around*|[|-s<rsub|\<gamma\>>,s<rsub|\<gamma\>>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>129) >
    <|input>
      \;
    </input>
  </session>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|prog-scripts|maxima>
  </collection>
</initial>