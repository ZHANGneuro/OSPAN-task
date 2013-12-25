
function show_math_result(wPtr,w,h,n,math_result,color_marker_T,color_marker_F,color_marker_cor_incor,cor_incor) 
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 80);
[nx, ny, bbox] = DrawFormattedText(wPtr, math_result{n,1}, 'center', 3*h/10, 0);
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 40);
Screen('FillRect', wPtr, color_marker_T, [30*w/100, 40*w/100, 42*w/100, 45*w/100]);
Screen('DrawText', wPtr, 'TRUE', 32.5*w/100, 41*w/100);
Screen('FillRect', wPtr, color_marker_F, [58*w/100, 40*w/100, 70*w/100, 45*w/100]);
Screen('DrawText', wPtr, 'FALSE', 60*w/100, 41*w/100);
Screen('FillRect', wPtr, color_marker_cor_incor, [46*w/100, 47*w/100, 54*w/100, 52*w/100]);
[nx, ny, bbox] = DrawFormattedText(wPtr, cor_incor, 'center', 48*w/100, [0 0 255]);
Screen('Flip',wPtr);
end