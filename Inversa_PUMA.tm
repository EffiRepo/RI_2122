<TeXmacs|2.1.1>

<style|<tuple|generic|italian|maxima>>

<\body>
  <center|<strong|PUMA-Inversa>>

  <\session|maxima|default>
    <\output>
      \;
    </output>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>45) >
    <|unfolded-io>
      load(mbe5)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o45>)
      >C:/Users/loryb/Desktop/RI_2122/mbe5.mac >>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>46) >
    <|unfolded-io>
      puma:[[q[1],L[1],-%pi/2,0],

      \ \ \ \ \ [q[2],0,0,D[2]],

      \ \ \ \ \ [q[3],0,%pi/2,0],

      \ \ \ \ \ [q[4],L[4],-%pi/2,0],

      \ \ \ \ \ [q[5],0,%pi/2,0],

      \ \ \ \ \ [q[6],L[6],0,0]]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o46>)
      >><around*|[|<around*|[|q<rsub|1>,L<rsub|1>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|2>,0,0,D<rsub|2>|]>,<around*|[|q<rsub|3>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|4>,L<rsub|4>,-<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|5>,0,<frac|\<pi\>|2>,0|]>,<around*|[|q<rsub|6>,L<rsub|6>,0,0|]>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>47) >
    <|unfolded-io>
      dr:expand(rename(DH(puma),1))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o47>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*s<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*s<rsub|6>-s<rsub|1>*c<rsub|4>*s<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*c<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*c<rsub|6>-s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|-s<rsub|1>*s<rsub|4>*s<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>+c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>+c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>>|<cell|-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+c<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>+c<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>+c<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*s<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*s<rsub|6>+c<rsub|1>*c<rsub|4>*s<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*c<rsub|6>+c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*c<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*c<rsub|6>+c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*s<rsub|4>*s<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>+s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>+s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>>|<cell|c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>+s<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>+s<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|c<rsub|2>*s<rsub|3>*s<rsub|4>*s<rsub|6>+s<rsub|2>*c<rsub|3>*s<rsub|4>*s<rsub|6>+s<rsub|2>*s<rsub|3>*s<rsub|5>*c<rsub|6>-c<rsub|2>*c<rsub|3>*s<rsub|5>*c<rsub|6>-c<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-s<rsub|2>*s<rsub|3>*s<rsub|5>*s<rsub|6>+c<rsub|2>*c<rsub|3>*s<rsub|5>*s<rsub|6>+c<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|2>*s<rsub|3>*s<rsub|4>*c<rsub|6>+s<rsub|2>*c<rsub|3>*s<rsub|4>*c<rsub|6>>|<cell|-c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>-s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>-s<rsub|2>*s<rsub|3>*c<rsub|5>+c<rsub|2>*c<rsub|3>*c<rsub|5>>|<cell|-c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>+c<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|2>*s<rsub|3>*L<rsub|4>+c<rsub|2>*c<rsub|3>*L<rsub|4>-D<rsub|2>*s<rsub|2>+L<rsub|1>>>|<row|<cell|0>|<cell|0>|<cell|0>|<cell|1>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>48) >
    <|unfolded-io>
      eq:flatten([getEq(dr),s[1]^2+c[1]^2-1=0,s[2]^2+c[2]^2-1=0,s[3]^2+c[3]^2-1=0,s[4]^2+c[4]^2-1=0,s[5]^2+c[5]^2-1=0,s[6]^2+c[6]^2-1=0])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o48>)
      >><around*|[|x+s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>-c<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>-c<rsub|1>*D<rsub|2>*c<rsub|2>=0,y-c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>-s<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>-s<rsub|1>*D<rsub|2>*c<rsub|2>=0,z+c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|2>*s<rsub|3>*L<rsub|4>-c<rsub|2>*c<rsub|3>*L<rsub|4>+D<rsub|2>*s<rsub|2>-L<rsub|1>=0,s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1=0,s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0,s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1=0,s<rsub|4><rsup|2>+c<rsub|4><rsup|2>-1=0,s<rsub|5><rsup|2>+c<rsub|5><rsup|2>-1=0,s<rsub|6><rsup|2>+c<rsub|6><rsup|2>-1=0|]>>>
    </unfolded-io>

    <\textput>
      <choice|<tformat|<table|<row|<cell|<math|x+s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>-c<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>-c<rsub|1>*D<rsub|2>*c<rsub|2>=0>>>|<row|<cell|<math|y-c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>-s<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>-s<rsub|1>*D<rsub|2>*c<rsub|2>=0>>>|<row|<cell|<math|z+c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>-c<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|2>*s<rsub|3>*L<rsub|4>-c<rsub|2>*c<rsub|3>*L<rsub|4>+D<rsub|2>*s<rsub|2>-L<rsub|1>=0>>>|<row|<cell|<math|s<rsub|1><rsup|2>+c<rsub|1><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|2><rsup|2>+c<rsub|2><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|3><rsup|2>+c<rsub|3><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|4><rsup|2>+c<rsub|4><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|5><rsup|2>+c<rsub|5><rsup|2>-1=0>>>|<row|<cell|<math|s<rsub|6><rsup|2>+c<rsub|6><rsup|2>-1=0>>>>>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>49) >
    <|unfolded-io>
      d1:matrix([d[1]],[d[2]],[d[3]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o49>)
      >><matrix|<tformat|<table|<row|<cell|d<rsub|1>>>|<row|<cell|d<rsub|2>>>|<row|<cell|d<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>50) >
    <|unfolded-io>
      d0:matrix([d[4]],[d[5]],[d[6]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o50>)
      >><matrix|<tformat|<table|<row|<cell|d<rsub|4>>>|<row|<cell|d<rsub|5>>>|<row|<cell|d<rsub|6>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>51) >
    <|unfolded-io>
      R36:submatrix(4,rename(DH([puma[4],puma[5],puma[6]]),1),4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o51>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>>|<cell|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>>|<cell|c<rsub|4>*s<rsub|5>>>|<row|<cell|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>>|<cell|s<rsub|4>*s<rsub|5>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|c<rsub|5>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>52) >
    <|unfolded-io>
      R03:submatrix(4,rename(DH([[q[1],L[1],-%pi/2,0],

      \ \ \ \ \ [q[2],0,0,D[2]],

      \ \ \ \ \ [q[3],0,%pi/2,0]]),1),4)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o52>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>>|<cell|-s<rsub|1>>|<cell|c<rsub|1>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>>>|<row|<cell|s<rsub|1>*<around*|(|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>|)>>|<cell|c<rsub|1>>|<cell|s<rsub|1>*<around*|(|c<rsub|2>*s<rsub|3>+s<rsub|2>*c<rsub|3>|)>>>|<row|<cell|-c<rsub|2>*s<rsub|3>-s<rsub|2>*c<rsub|3>>|<cell|0>|<cell|c<rsub|2>*c<rsub|3>-s<rsub|2>*s<rsub|3>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>53) >
    <|unfolded-io>
      d03:submatrix(4,rename(DH([[q[1],L[1],-%pi/2,0],

      \ \ \ \ \ [q[2],0,0,D[2]],

      \ \ \ \ \ [q[3],0,%pi/2,0]]),1),1,2,3)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o53>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|s<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|L<rsub|1>-D<rsub|2>*s<rsub|2>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>54) >
    <|unfolded-io>
      d36:submatrix(4,rename(DH([puma[4],puma[5],puma[6]]),1),1,2,3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o54>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|s<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|c<rsub|5>*L<rsub|6>+L<rsub|4>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>55) >
    <|unfolded-io>
      disac:R36.d1+d0-d36
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o55>)
      >><matrix|<tformat|<table|<row|<cell|d<rsub|2>*<around*|(|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>|)>+d<rsub|1>*<around*|(|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>|)>-c<rsub|4>*s<rsub|5>*L<rsub|6>+d<rsub|3>*c<rsub|4>*s<rsub|5>+d<rsub|4>>>|<row|<cell|d<rsub|2>*<around*|(|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>|)>+d<rsub|1>*<around*|(|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>|)>-s<rsub|4>*s<rsub|5>*L<rsub|6>+d<rsub|3>*s<rsub|4>*s<rsub|5>+d<rsub|5>>>|<row|<cell|d<rsub|2>*s<rsub|5>*s<rsub|6>+d<rsub|6>-d<rsub|1>*s<rsub|5>*c<rsub|6>-c<rsub|5>*L<rsub|6>+d<rsub|3>*c<rsub|5>-L<rsub|4>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>56) >
    <|unfolded-io>
      eqDisac:facsum(factor([disac[1][1]=0,disac[2][1]=0,disac[3][1]=0]),[d[1],d[2],d[3],d[4],d[5],d[6]])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o56>)
      >><around*|[|-d<rsub|2>*<around*|(|c<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|4>*c<rsub|6>|)>-d<rsub|1>*<around*|(|s<rsub|4>*s<rsub|6>-c<rsub|4>*c<rsub|5>*c<rsub|6>|)>-c<rsub|4>*s<rsub|5>*L<rsub|6>+d<rsub|3>*c<rsub|4>*s<rsub|5>+d<rsub|4>=0,-d<rsub|2>*<around*|(|s<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|4>*c<rsub|6>|)>+d<rsub|1>*<around*|(|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>|)>-s<rsub|4>*s<rsub|5>*L<rsub|6>+d<rsub|3>*s<rsub|4>*s<rsub|5>+d<rsub|5>=0,d<rsub|2>*s<rsub|5>*s<rsub|6>+d<rsub|6>-d<rsub|1>*s<rsub|5>*c<rsub|6>-c<rsub|5>*L<rsub|6>+d<rsub|3>*c<rsub|5>-L<rsub|4>=0|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>57) >
    <|unfolded-io>
      eqq:factor(eliminate(flatten([eqDisac,eq[8]]),[s[5],c[5]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o57>)
      >><around*|[|<around*|(|L<rsub|6>-d<rsub|3>|)><rsup|2>*<around*|(|d<rsub|1>*s<rsub|4><rsup|2>*s<rsub|6>+d<rsub|1>*c<rsub|4><rsup|2>*s<rsub|6>+d<rsub|2>*s<rsub|4><rsup|2>*c<rsub|6>+d<rsub|2>*c<rsub|4><rsup|2>*c<rsub|6>+c<rsub|4>*d<rsub|5>-d<rsub|4>*s<rsub|4>|)><rsup|2>,c<rsub|4><rsup|2>*<around*|(|L<rsub|6>-d<rsub|3>|)><rsup|2>*<around*|(|d<rsub|2><rsup|2>*s<rsub|6><rsup|2>-2*d<rsub|1>*d<rsub|2>*c<rsub|6>*s<rsub|6>+d<rsub|1><rsup|2>*c<rsub|6><rsup|2>+L<rsub|6><rsup|2>-2*d<rsub|3>*L<rsub|6>+d<rsub|3><rsup|2>|)>*<around*|(|d<rsub|1><rsup|2>*s<rsub|4><rsup|2>*s<rsub|6><rsup|2>-d<rsub|2><rsup|2>*c<rsub|4><rsup|2>*s<rsub|6><rsup|2>+2*d<rsub|1>*d<rsub|2>*s<rsub|4><rsup|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|1>*d<rsub|2>*c<rsub|4><rsup|2>*c<rsub|6>*s<rsub|6>-2*d<rsub|1>*d<rsub|4>*s<rsub|4>*s<rsub|6>+c<rsub|4><rsup|2>*d<rsub|6><rsup|2>-2*L<rsub|4>*c<rsub|4><rsup|2>*d<rsub|6>+d<rsub|2><rsup|2>*s<rsub|4><rsup|2>*c<rsub|6><rsup|2>-d<rsub|1><rsup|2>*c<rsub|4><rsup|2>*c<rsub|6><rsup|2>-2*d<rsub|2>*d<rsub|4>*s<rsub|4>*c<rsub|6>-c<rsub|4><rsup|2>*L<rsub|6><rsup|2>+2*d<rsub|3>*c<rsub|4><rsup|2>*L<rsub|6>+d<rsub|4><rsup|2>+L<rsub|4><rsup|2>*c<rsub|4><rsup|2>-d<rsub|3><rsup|2>*c<rsub|4><rsup|2>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>58) >
    <|unfolded-io>
      eqq[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o58>)
      >><around*|(|L<rsub|6>-d<rsub|3>|)><rsup|2>*<around*|(|d<rsub|1>*s<rsub|4><rsup|2>*s<rsub|6>+d<rsub|1>*c<rsub|4><rsup|2>*s<rsub|6>+d<rsub|2>*s<rsub|4><rsup|2>*c<rsub|6>+d<rsub|2>*c<rsub|4><rsup|2>*c<rsub|6>+c<rsub|4>*d<rsub|5>-d<rsub|4>*s<rsub|4>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>59) >
    <|unfolded-io>
      eqq[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o59>)
      >>c<rsub|4><rsup|2>*<around*|(|L<rsub|6>-d<rsub|3>|)><rsup|2>*<around*|(|d<rsub|2><rsup|2>*s<rsub|6><rsup|2>-2*d<rsub|1>*d<rsub|2>*c<rsub|6>*s<rsub|6>+d<rsub|1><rsup|2>*c<rsub|6><rsup|2>+L<rsub|6><rsup|2>-2*d<rsub|3>*L<rsub|6>+d<rsub|3><rsup|2>|)>*<around*|(|d<rsub|1><rsup|2>*s<rsub|4><rsup|2>*s<rsub|6><rsup|2>-d<rsub|2><rsup|2>*c<rsub|4><rsup|2>*s<rsub|6><rsup|2>+2*d<rsub|1>*d<rsub|2>*s<rsub|4><rsup|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|1>*d<rsub|2>*c<rsub|4><rsup|2>*c<rsub|6>*s<rsub|6>-2*d<rsub|1>*d<rsub|4>*s<rsub|4>*s<rsub|6>+c<rsub|4><rsup|2>*d<rsub|6><rsup|2>-2*L<rsub|4>*c<rsub|4><rsup|2>*d<rsub|6>+d<rsub|2><rsup|2>*s<rsub|4><rsup|2>*c<rsub|6><rsup|2>-d<rsub|1><rsup|2>*c<rsub|4><rsup|2>*c<rsub|6><rsup|2>-2*d<rsub|2>*d<rsub|4>*s<rsub|4>*c<rsub|6>-c<rsub|4><rsup|2>*L<rsub|6><rsup|2>+2*d<rsub|3>*c<rsub|4><rsup|2>*L<rsub|6>+d<rsub|4><rsup|2>+L<rsub|4><rsup|2>*c<rsub|4><rsup|2>-d<rsub|3><rsup|2>*c<rsub|4><rsup|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>60) >
    <|unfolded-io>
      d1sol:map(rhs,solve(part(eqq[2],2),[d[3]]))[1]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o60>)
      >>L<rsub|6>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>61) >
    <|unfolded-io>
      subst()
    <|unfolded-io>
      \;

      <math|<with|math-display|true|<math-up|subst><text|<verbatim|:><verbatim|
      ><verbatim|e><verbatim|x><verbatim|p><verbatim|e><verbatim|c><verbatim|t><verbatim|e><verbatim|d><verbatim|
      ><verbatim|a><verbatim|t><verbatim|
      ><verbatim|l><verbatim|e><verbatim|a><verbatim|s><verbatim|t><verbatim|
      >>2*<text|<verbatim| ><verbatim|a><verbatim|r><verbatim|g><verbatim|u><verbatim|m><verbatim|e><verbatim|n><verbatim|t><verbatim|s><verbatim|
      ><verbatim|b><verbatim|u><verbatim|t><verbatim|
      ><verbatim|g><verbatim|o><verbatim|t><verbatim|
      >>0<text|<verbatim|:><verbatim| >><around*|[||]>>>

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>62) >
    <|unfolded-io>
      p:factor(eliminate(flatten([eqDisac[1],eqDisac[2],eq[7]]),[c[4],s[4]]))[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o62>)
      >>-<around*|(|d<rsub|2>*c<rsub|5>*s<rsub|6>-d<rsub|1>*c<rsub|5>*c<rsub|6>+s<rsub|5>*L<rsub|6>-d<rsub|3>*s<rsub|5>|)><rsup|2>*<around*|(|d<rsub|2><rsup|2>*c<rsub|5><rsup|2>*s<rsub|6><rsup|2>+d<rsub|1><rsup|2>*s<rsub|6><rsup|2>-2*d<rsub|1>*d<rsub|2>*c<rsub|5><rsup|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|1>*d<rsub|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|2>*c<rsub|5>*s<rsub|5>*L<rsub|6>*s<rsub|6>-2*d<rsub|2>*d<rsub|3>*c<rsub|5>*s<rsub|5>*s<rsub|6>+d<rsub|1><rsup|2>*c<rsub|5><rsup|2>*c<rsub|6><rsup|2>+d<rsub|2><rsup|2>*c<rsub|6><rsup|2>-2*d<rsub|1>*c<rsub|5>*s<rsub|5>*L<rsub|6>*c<rsub|6>+2*d<rsub|1>*d<rsub|3>*c<rsub|5>*s<rsub|5>*c<rsub|6>+s<rsub|5><rsup|2>*L<rsub|6><rsup|2>-2*d<rsub|3>*s<rsub|5><rsup|2>*L<rsub|6>+d<rsub|3><rsup|2>*s<rsub|5><rsup|2>|)>*<around*|(|d<rsub|2><rsup|2>*c<rsub|5><rsup|2>*s<rsub|6><rsup|2>+d<rsub|1><rsup|2>*s<rsub|6><rsup|2>-2*d<rsub|1>*d<rsub|2>*c<rsub|5><rsup|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|1>*d<rsub|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|2>*c<rsub|5>*s<rsub|5>*L<rsub|6>*s<rsub|6>-2*d<rsub|2>*d<rsub|3>*c<rsub|5>*s<rsub|5>*s<rsub|6>+d<rsub|1><rsup|2>*c<rsub|5><rsup|2>*c<rsub|6><rsup|2>+d<rsub|2><rsup|2>*c<rsub|6><rsup|2>-2*d<rsub|1>*c<rsub|5>*s<rsub|5>*L<rsub|6>*c<rsub|6>+2*d<rsub|1>*d<rsub|3>*c<rsub|5>*s<rsub|5>*c<rsub|6>+s<rsub|5><rsup|2>*L<rsub|6><rsup|2>-2*d<rsub|3>*s<rsub|5><rsup|2>*L<rsub|6>+d<rsub|3><rsup|2>*s<rsub|5><rsup|2>-d<rsub|5><rsup|2>-d<rsub|4><rsup|2>|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>63) >
    <|unfolded-io>
      part(part(p,1),1)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o63>)
      >><around*|(|d<rsub|2>*c<rsub|5>*s<rsub|6>-d<rsub|1>*c<rsub|5>*c<rsub|6>+s<rsub|5>*L<rsub|6>-d<rsub|3>*s<rsub|5>|)><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>64) >
    <|unfolded-io>
      part(part(p,1),2)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o64>)
      >>d<rsub|2><rsup|2>*c<rsub|5><rsup|2>*s<rsub|6><rsup|2>+d<rsub|1><rsup|2>*s<rsub|6><rsup|2>-2*d<rsub|1>*d<rsub|2>*c<rsub|5><rsup|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|1>*d<rsub|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|2>*c<rsub|5>*s<rsub|5>*L<rsub|6>*s<rsub|6>-2*d<rsub|2>*d<rsub|3>*c<rsub|5>*s<rsub|5>*s<rsub|6>+d<rsub|1><rsup|2>*c<rsub|5><rsup|2>*c<rsub|6><rsup|2>+d<rsub|2><rsup|2>*c<rsub|6><rsup|2>-2*d<rsub|1>*c<rsub|5>*s<rsub|5>*L<rsub|6>*c<rsub|6>+2*d<rsub|1>*d<rsub|3>*c<rsub|5>*s<rsub|5>*c<rsub|6>+s<rsub|5><rsup|2>*L<rsub|6><rsup|2>-2*d<rsub|3>*s<rsub|5><rsup|2>*L<rsub|6>+d<rsub|3><rsup|2>*s<rsub|5><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>65) >
    <|unfolded-io>
      part(part(p,1),3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o65>)
      >>d<rsub|2><rsup|2>*c<rsub|5><rsup|2>*s<rsub|6><rsup|2>+d<rsub|1><rsup|2>*s<rsub|6><rsup|2>-2*d<rsub|1>*d<rsub|2>*c<rsub|5><rsup|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|1>*d<rsub|2>*c<rsub|6>*s<rsub|6>+2*d<rsub|2>*c<rsub|5>*s<rsub|5>*L<rsub|6>*s<rsub|6>-2*d<rsub|2>*d<rsub|3>*c<rsub|5>*s<rsub|5>*s<rsub|6>+d<rsub|1><rsup|2>*c<rsub|5><rsup|2>*c<rsub|6><rsup|2>+d<rsub|2><rsup|2>*c<rsub|6><rsup|2>-2*d<rsub|1>*c<rsub|5>*s<rsub|5>*L<rsub|6>*c<rsub|6>+2*d<rsub|1>*d<rsub|3>*c<rsub|5>*s<rsub|5>*c<rsub|6>+s<rsub|5><rsup|2>*L<rsub|6><rsup|2>-2*d<rsub|3>*s<rsub|5><rsup|2>*L<rsub|6>+d<rsub|3><rsup|2>*s<rsub|5><rsup|2>-d<rsub|5><rsup|2>-d<rsub|4><rsup|2>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>66) >
    <|unfolded-io>
      part(part(p,1),4)
    <|unfolded-io>
      \;

      part: fell off the end.

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>67) >
    <|unfolded-io>
      p1:factor(eliminate(flatten([subst(d[3]=d1sol,eqDisac),eq[7],eq[8],eq[9]]),[s[4],c[4],c[5],s[5]]))
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o67>)
      >><around*|[|<around*|(|d<rsub|1>*s<rsub|6>+d<rsub|2>*c<rsub|6>|)><rsup|64>*<around*|(|d<rsub|2>*s<rsub|6>-d<rsub|1>*c<rsub|6>|)><rsup|128>*<around*|(|d<rsub|2><rsup|2>*s<rsub|6><rsup|2>+d<rsub|1><rsup|2>*s<rsub|6><rsup|2>-d<rsub|6><rsup|2>+2*L<rsub|4>*d<rsub|6>+d<rsub|2><rsup|2>*c<rsub|6><rsup|2>+d<rsub|1><rsup|2>*c<rsub|6><rsup|2>-L<rsub|4><rsup|2>|)><rsup|32>*<around*|(|d<rsub|2><rsup|2>*s<rsub|6><rsup|2>+d<rsub|1><rsup|2>*s<rsub|6><rsup|2>-d<rsub|6><rsup|2>+2*L<rsub|4>*d<rsub|6>+d<rsub|2><rsup|2>*c<rsub|6><rsup|2>+d<rsub|1><rsup|2>*c<rsub|6><rsup|2>-d<rsub|5><rsup|2>-d<rsub|4><rsup|2>-L<rsub|4><rsup|2>|)><rsup|32>,<around*|(|s<rsub|6><rsup|2>+c<rsub|6><rsup|2>-1|)><rsup|128>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>68) >
    <|unfolded-io>
      P:submatrix(4,dr,1,2,3)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o68>)
      >><matrix|<tformat|<table|<row|<cell|-s<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>-c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>+c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+c<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>+c<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>+c<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|c<rsub|1>*s<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>+s<rsub|1>*c<rsub|2>*s<rsub|3>*L<rsub|4>+s<rsub|1>*s<rsub|2>*c<rsub|3>*L<rsub|4>+s<rsub|1>*D<rsub|2>*c<rsub|2>>>|<row|<cell|-c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>*L<rsub|6>-s<rsub|2>*s<rsub|3>*c<rsub|5>*L<rsub|6>+c<rsub|2>*c<rsub|3>*c<rsub|5>*L<rsub|6>-s<rsub|2>*s<rsub|3>*L<rsub|4>+c<rsub|2>*c<rsub|3>*L<rsub|4>-D<rsub|2>*s<rsub|2>+L<rsub|1>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>69) >
    <|unfolded-io>
      R:submatrix(4,dr,4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o69>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*s<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*s<rsub|6>-s<rsub|1>*c<rsub|4>*s<rsub|6>-c<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>-c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>+c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*c<rsub|6>-c<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*c<rsub|6>-s<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|-s<rsub|1>*s<rsub|4>*s<rsub|5>-c<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>+c<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>+c<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>+c<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>>>|<row|<cell|s<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*s<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*s<rsub|6>+c<rsub|1>*c<rsub|4>*s<rsub|6>-s<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*c<rsub|6>+c<rsub|1>*s<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>+s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|s<rsub|1>*c<rsub|2>*s<rsub|3>*s<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|2>*c<rsub|3>*s<rsub|5>*s<rsub|6>-c<rsub|1>*s<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|1>*s<rsub|2>*s<rsub|3>*s<rsub|4>*c<rsub|6>-s<rsub|1>*c<rsub|2>*c<rsub|3>*s<rsub|4>*c<rsub|6>+c<rsub|1>*c<rsub|4>*c<rsub|6>>|<cell|c<rsub|1>*s<rsub|4>*s<rsub|5>-s<rsub|1>*s<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>+s<rsub|1>*c<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>+s<rsub|1>*c<rsub|2>*s<rsub|3>*c<rsub|5>+s<rsub|1>*s<rsub|2>*c<rsub|3>*c<rsub|5>>>|<row|<cell|c<rsub|2>*s<rsub|3>*s<rsub|4>*s<rsub|6>+s<rsub|2>*c<rsub|3>*s<rsub|4>*s<rsub|6>+s<rsub|2>*s<rsub|3>*s<rsub|5>*c<rsub|6>-c<rsub|2>*c<rsub|3>*s<rsub|5>*c<rsub|6>-c<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|-s<rsub|2>*s<rsub|3>*s<rsub|5>*s<rsub|6>+c<rsub|2>*c<rsub|3>*s<rsub|5>*s<rsub|6>+c<rsub|2>*s<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+s<rsub|2>*c<rsub|3>*c<rsub|4>*c<rsub|5>*s<rsub|6>+c<rsub|2>*s<rsub|3>*s<rsub|4>*c<rsub|6>+s<rsub|2>*c<rsub|3>*s<rsub|4>*c<rsub|6>>|<cell|-c<rsub|2>*s<rsub|3>*c<rsub|4>*s<rsub|5>-s<rsub|2>*c<rsub|3>*c<rsub|4>*s<rsub|5>-s<rsub|2>*s<rsub|3>*c<rsub|5>+c<rsub|2>*c<rsub|3>*c<rsub|5>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>70) >
    <|unfolded-io>
      d1:matrix([a],[b],[c])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o70>)
      >><matrix|<tformat|<table|<row|<cell|a>>|<row|<cell|b>>|<row|<cell|c>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>71) >
    <|unfolded-io>
      d0:matrix([d],[e],[f])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o71>)
      >><matrix|<tformat|<table|<row|<cell|d>>|<row|<cell|e>>|<row|<cell|f>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>72) >
    <|unfolded-io>
      d36:submatrix(4,rename(DH([puma[4],puma[5],puma[6]]),1),1,2,3)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o72>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|s<rsub|4>*s<rsub|5>*L<rsub|6>>>|<row|<cell|c<rsub|5>*L<rsub|6>+L<rsub|4>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>73) >
    <|unfolded-io>
      R36:submatrix(4,rename(DH([puma[4],puma[5],puma[6]]),1),4)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o73>)
      >><matrix|<tformat|<table|<row|<cell|c<rsub|4>*c<rsub|5>*c<rsub|6>-s<rsub|4>*s<rsub|6>>|<cell|-c<rsub|4>*c<rsub|5>*s<rsub|6>-s<rsub|4>*c<rsub|6>>|<cell|c<rsub|4>*s<rsub|5>>>|<row|<cell|c<rsub|4>*s<rsub|6>+s<rsub|4>*c<rsub|5>*c<rsub|6>>|<cell|c<rsub|4>*c<rsub|6>-s<rsub|4>*c<rsub|5>*s<rsub|6>>|<cell|s<rsub|4>*s<rsub|5>>>|<row|<cell|-s<rsub|5>*c<rsub|6>>|<cell|s<rsub|5>*s<rsub|6>>|<cell|c<rsub|5>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>74) >
    <|unfolded-io>
      solve(d36=R36.d1,[a,b,c])
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o74>)
      >><around*|[||]>>>
    </unfolded-io>

    <\textput>
      Risoluzione del sistema lineare Ax=b
    </textput>

    <\textput>
      <math|R<rsub|36>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>75) >
    <|unfolded-io>
      A:submatrix(4,DH([puma[4],puma[5],puma[6]]),4)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o75>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>-sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|6>|)>>|<cell|-cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>-sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|cos <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|5>|)>>>|<row|<cell|cos <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|6>|)>+sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>>|<cell|cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|6>|)>-sin
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>>|<cell|sin <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|5>|)>>>|<row|<cell|-sin <around*|(|q<rsub|5>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|sin <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>>|<cell|cos <around*|(|q<rsub|5>|)>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>76) >
    <|unfolded-io>
      rank(A)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o76>)
      >>3>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>77) >
    <|unfolded-io>
      expand(trigreduce(expand(determinant(A))))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o77>)
      >>1>>
    </unfolded-io>

    <\textput>
      <math|d<rsub|36>>
    </textput>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>78) >
    <|unfolded-io>
      bL:submatrix(4,DH([puma[4],puma[5],puma[6]]),1,2,3);
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o78>)
      >><matrix|<tformat|<table|<row|<cell|L<rsub|6>*cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>>|<row|<cell|L<rsub|6>*sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>>|<row|<cell|L<rsub|6>*cos
      <around*|(|q<rsub|5>|)>+L<rsub|4>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>79) >
    <|unfolded-io>
      Ab:addcol(A,bL)
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o79>)
      >><matrix|<tformat|<table|<row|<cell|cos <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>-sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|6>|)>>|<cell|-cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>-sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|cos <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|5>|)>>|<cell|L<rsub|6>*cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>>|<row|<cell|cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|6>|)>+sin
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*cos
      <around*|(|q<rsub|6>|)>>|<cell|cos <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|6>|)>-sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|5>|)>*sin <around*|(|q<rsub|6>|)>>|<cell|sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>|<cell|L<rsub|6>*sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>>|<row|<cell|-sin
      <around*|(|q<rsub|5>|)>*cos <around*|(|q<rsub|6>|)>>|<cell|sin
      <around*|(|q<rsub|5>|)>*sin <around*|(|q<rsub|6>|)>>|<cell|cos
      <around*|(|q<rsub|5>|)>>|<cell|L<rsub|6>*cos
      <around*|(|q<rsub|5>|)>+L<rsub|4>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>80) >
    <|unfolded-io>
      rank(Ab)
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o80>)
      >>3>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>81) >
    <|unfolded-io>
      Cd:trigsimp(expand(echelon(Ab)))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o81>)
      >><matrix|<tformat|<table|<row|<cell|1>|<cell|-<frac|sin
      <around*|(|q<rsub|6>|)>|cos <around*|(|q<rsub|6>|)>>>|<cell|-<frac|cos
      <around*|(|q<rsub|5>|)>|sin <around*|(|q<rsub|5>|)>*cos
      <around*|(|q<rsub|6>|)>>>|<cell|-<frac|L<rsub|6>*cos
      <around*|(|q<rsub|5>|)>+L<rsub|4>|sin <around*|(|q<rsub|5>|)>*cos
      <around*|(|q<rsub|6>|)>>>>|<row|<cell|0>|<cell|1>|<cell|<frac|cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>*sin
      <around*|(|q<rsub|6>|)>+sin <around*|(|q<rsub|4>|)>*cos
      <around*|(|q<rsub|6>|)>|cos <around*|(|q<rsub|4>|)>*sin
      <around*|(|q<rsub|5>|)>>>|<cell|<frac|<around*|(|L<rsub|6>*cos
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>+L<rsub|4>*cos
      <around*|(|q<rsub|4>|)>|)>*sin <around*|(|q<rsub|6>|)>+<around*|(|L<rsub|4>*sin
      <around*|(|q<rsub|4>|)>*cos <around*|(|q<rsub|5>|)>+L<rsub|6>*sin
      <around*|(|q<rsub|4>|)>|)>*cos <around*|(|q<rsub|6>|)>|cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>>>>|<row|<cell|0>|<cell|0>|<cell|1>|<cell|L<rsub|4>*cos
      <around*|(|q<rsub|5>|)>+L<rsub|6>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>82) >
    <|unfolded-io>
      xL:[d11,d12,d13]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o82>)
      >><around*|[|<with|math-font-family|rm|d11>,<with|math-font-family|rm|d12>,<with|math-font-family|rm|d13>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>83) >
    <|unfolded-io>
      solns:map(rhs,trigsimp(gauss_jordan(A,bL,xL-d0)))
    <|unfolded-io>
      \;

      \;

      ** error while printing error message **

      map: arguments must have same main operator; found: ~M, ~M

      #0: gauss_jordan(aa=matrix([cos(q[4])*cos(q[5])*cos(q[6])-sin(q[4])*sin(q[6]),(-cos(q[4])*cos(q[5])*sin(q[6]))-sin(q[4])...,bbl=matrix([L[6]*cos(q[4])*sin(q[5])],[L[6]*sin(q[4])*sin(q[5])],[L[6]*cos(q[5])+L[4]]),xxl=matrix([d11-d],[d12-e],[d13-f]))
      (mbe5.mac line 1262)

      \ -- an error. To debug this try: debugmode(true);
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>84) >
    <|unfolded-io>
      d11
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o84>)
      >><with|math-font-family|rm|d11>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>85) >
    <|unfolded-io>
      solns[1]
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o85>)
      >>cos <around*|(|q<rsub|6>|)>*<around*|(|sin
      <around*|(|q<rsub|5>|)>*<around*|(|f-L<rsub|4>|)>+cos
      <around*|(|q<rsub|5>|)>*<around*|(|-sin <around*|(|q<rsub|4>|)>*e-cos
      <around*|(|q<rsub|4>|)>*d|)>|)>+sin
      <around*|(|q<rsub|6>|)>*<around*|(|sin <around*|(|q<rsub|4>|)>*d-cos
      <around*|(|q<rsub|4>|)>*e|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>86) >
    <|unfolded-io>
      solns[2]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o86>)
      >>sin <around*|(|q<rsub|6>|)>*<around*|(|sin
      <around*|(|q<rsub|5>|)>*<around*|(|L<rsub|4>-f|)>+cos
      <around*|(|q<rsub|5>|)>*<around*|(|sin <around*|(|q<rsub|4>|)>*e+cos
      <around*|(|q<rsub|4>|)>*d|)>|)>+cos
      <around*|(|q<rsub|6>|)>*<around*|(|sin <around*|(|q<rsub|4>|)>*d-cos
      <around*|(|q<rsub|4>|)>*e|)>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>87) >
    <|unfolded-io>
      solns[3]
    <|unfolded-io>
      <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o87>)
      >>cos <around*|(|q<rsub|5>|)>*<around*|(|L<rsub|4>-f|)>+sin
      <around*|(|q<rsub|5>|)>*<around*|(|-sin <around*|(|q<rsub|4>|)>*e-cos
      <around*|(|q<rsub|4>|)>*d|)>+L<rsub|6>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>92) >
    <|unfolded-io>
      flatten([trigsimp(solve(solns,[f,e,d]))])
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o92>)
      >><around*|[|f=L<rsub|6>*cos <around*|(|q<rsub|5>|)>+L<rsub|4>,e=L<rsub|6>*sin
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>,d=L<rsub|6>*cos
      <around*|(|q<rsub|4>|)>*sin <around*|(|q<rsub|5>|)>|]>>>
    </unfolded-io>

    <\unfolded-io>
      <with|color|red|(<with|math-font-family|rm|%i>95) >
    <|unfolded-io>
      trigsimp(psubst([f=L[4],e=0,d=0], solns))
    <|unfolded-io>
      \;

      \ <math|<with|math-display|true|<text|<with|font-family|tt|color|red|(<with|math-font-family|rm|%o95>)
      >><around*|[|0,0,L<rsub|6>|]>>>
    </unfolded-io>

    <\input>
      <with|color|red|(<with|math-font-family|rm|%i>96) >
    <|input>
      \;
    </input>

    <\textput>
      <center|>
    </textput>
  </session>

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>