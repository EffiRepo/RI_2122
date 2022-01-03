test(y,x):=block(
[xx, yy, s, sp, c, cp, myAtan, res, isFloat:false, tol:1e-15],
if y = 0 and x = 0 then
 error("Gli argomenti non possono essere entrambi zero"),
if x = 0 and 1 = y then return(%pi/2)
elseif x = 0 and -1 = y then return(-%pi/2),
/*x != 0*/
/*Per robustezza rimappiamo x e y*/
/*introduco errore con ratsimp> ratepsilon = 2e-15*/
xx:ratsimp(x), yy:ratsimp(y),
/*Verifico se ingressi float*/
if floatnump(y) or floatnump(x) then isFloat:true,
/*Calcolo arcotangente e coseno/seno*/
myAtan:trigreduce(trigsimp(atan(yy/xx))), print(myAtan),
s:trigreduce(trigsimp(sin(myAtan))), sp:trigreduce(trigsimp(sin(myAtan+%pi))),
c:trigreduce(trigsimp(cos(myAtan))), cp:trigreduce(trigsimp(cos(myAtan+%pi))),
if isFloat = true then(
    /*converto in float*/
    c:float(c), cp: float(cp),
    s:float(s), sp:float(sp),
    xx:float(xx), yy:float(yy)
) elseif  (
    print("Warning: Errore di approssimazione nell'atan2"),
    return(atan2(y,x))
),
/*x>0, y>0*/
if (abs(c-xx) < tol and abs(s-yy) < tol) and
(signum(c) = signum (xx) and signum(s) = signum (yy)) then return(myAtan)
/*x<0, y<0*/
elseif (abs(cp - xx) < tol and abs(sp - yy) < tol) and
(signum(cp) = signum (xx) and signum(sp) = signum (yy)) then return(myAtan-%pi)
/*x<0, y>0*/
elseif (abs(cp-xx) < tol and abs(s-yy) < tol) and
(signum(cp) = signum (xx) and signum(s) = signum (yy)) then return(myAtan+%pi)
/*x>0, y<0*/
elseif (abs(c-xx)< tol and abs(sp-yy) < tol) and
(signum(c)=signum(xx) and signum(sp)=signum(yy)) then return(-myAtan)
)$

exprbreak(expr):=block(
[term, part_list:[], idx],
partswitch:true,
idx:1,
term: part(expr,idx),
while term#'end do(
    if not(atom(term)) then(
        exprbreak(term)
    )
    else(
        part_list:append(part_list,[term]),
        idx=idx+1,
        term: part(expr,idx),
    )
)
return(part_list)
)$


if  = 1 then(
    part_list:append(part_list,[expr]),
    return(part_list[1])
) else (
    for i : 1 thru L do(
        p:part(expr,i),
        part_list:append(part_list,[exprbreak(p)])
    ),
    return(part_list)
)