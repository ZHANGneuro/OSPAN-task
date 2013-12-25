

function showletter(wPtr,w,h,letter_showed) 
    Screen('TextFont',wPtr, 'Arial');
    Screen('TextStyle',wPtr, 1);
    Screen('TextSize',wPtr, 100);
    Screen('FillRect', wPtr, [186 186 186], [w/2-2*w/6,h/2-2*h/6,w/2+2*w/6,h/2+2*h/6]);
    [nx, ny, bbox] = DrawFormattedText(wPtr, letter_showed, 'center', 4*h/10, 0);
    Screen('Flip',wPtr);
    WaitSecs(0.8);
end
                    
                    