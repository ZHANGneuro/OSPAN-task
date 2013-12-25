
function show_equation(wPtr,w,h,n,rand_equation)
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 55);
Screen('FillRect', wPtr, [186 186 186], [w/2-2*w/6,h/2-2*h/6,w/2+2*w/6,h/2+2*h/6]);
[nx, ny, bbox] = DrawFormattedText(wPtr, rand_equation{n,1}, 'center', 3*h/10, 0);
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 0);
Screen('TextSize',wPtr, 30);
[nx, ny, bbox] = DrawFormattedText(wPtr, 'When you have solved the math problem,\n click the left mouse button to continue.', 'center', 7*h/10, 0);
Screen('Flip',wPtr);
end

