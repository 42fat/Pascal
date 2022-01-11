program one;

const N = 100000;
type
  massive = array[1..N] of integer;

var
  A_quick: massive;

function shellsort(B: massive; size: integer): massive;
var
  d, j, i: integer;
  tmp: integer;
begin
  d := size;
  d := d div 2;
  while (d > 0) do
  begin
    for i := 1 to size - d do
    begin
      j := i;
      while ((j > 0) and (B[j] > B[j + d])) do 
      begin
        tmp := B[j];
        B[j] := B[j + d];
        B[j + d] := tmp;
        j := j - 1;
      end;
    end;
    d := d div 2;
  end;
  for i := 1 to size do 
    shellsort := B
end;


procedure quicksort(var B: massive; first: integer; last: integer);
var
  f, l: integer;
  mid, tmp: integer;
begin
  f := first;
  l := last;
  mid := B[(f + l) div 2];
  repeat
    while (B[f] < mid) do f := f + 1;
    while (B[l] > mid) do l := l - 1;
    if (f <= l) then
    begin
      tmp := B[f];
      B[f] := B[l];
      B[l] := tmp;
      f := f + 1;
      l := l - 1;
    end;
  until (f > l);
  if(first < l) then quicksort(B, first, l);
  if(f < last) then quicksort(B, f, last);
end;

var
  i: integer;
  A, A_shell: massive;
  start,finish: longint;
  time_s,time_q:longint;

begin
  for i := 1 to N do A[i] := random(N*10);
  
  A_quick := A;
  
  start:=Milliseconds;
  
  A_shell := shellsort(A, N);
  
  finish:=Milliseconds;
  time_s:=finish - start;
  
  start:=Milliseconds;
  
  quicksort(A_quick, 1, N);
  
  finish:=Milliseconds;
  time_q:=finish - start;
   
  
  writeln('Время сортировки методом Шелла на 100 000 элементов (ms) ',time_s);
  writeln('Время сортировки методом Быстрой сортировки на 100 000 элементов (ms) ',time_q);
end.