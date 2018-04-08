%Hardlim function is built-in in Matlab
%But still implementing because its not in octave
function a = hardlim(n)

  %a=1 if n>0, a=-1 otherwise
  if n>=0
    a=1;
  else
    a=0;
  endif

endfunction
