uses graphABC;

procedure tr(x1, y1, x2, y2, x3, y3: Real);
begin
  moveto(round(x1), round(y1));
  lineto(round(x2), round(y2));
  lineto(round(x3), round(y3));
  lineto(round(x1), round(y1));
end;

procedure draw(x1, y1, x2, y2, x3, y3:real; n: integer);
var
  x1n, y1n, x2n, y2n, x3n, y3n,p: real;
begin
  if n > 0  then
  begin
    p:=0.5;
    x1n := (x1 + x2) * p;
    y1n := (y1 + y2) * p;
    x2n := (x2 + x3) * p;
    y2n := (y2 + y3) * p;
    x3n := (x3 + x1) * p;
    y3n := (y3 + y1) * p;
    tr(x1, y1, x2, y2, x3, y3);
    draw(x1, y1, x1n, y1n, x3n, y3n, n - 1);
    draw(x2, y2, x1n, y1n, x2n, y2n, n - 1);
    draw(x3, y3, x2n, y2n, x3n, y3n, n - 1);
  end;
end;

var
  n, x, y, a, d, h, x1, y1, x2, y2, x3, y3: integer;
  p: real;

begin
  repeat
    write('Глубина рекурсии [1..8] n=');
    read(n);
  until n in [1..8];
  clearwindow;
  x := windowwidth div 2;
  y := windowheight div 2;
  a := y;
  d := y;
  h := round(a * sqrt(3) / 2);
  x1 := x - d; 
  y1 := y + h;
  x2 := x; 
  y2 := y - h;
  x3 := x + d; 
  y3 := y + h;
  tr(x1, y1, x2, y2, x3, y3);
  draw(x1, y1, x2, y2, x3, y3 ,n);
end.