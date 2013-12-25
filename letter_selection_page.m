function  letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml,color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl,color_marker_bbm,color_marker_bbr,input_letter)


Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 32);
[nx, ny, bbox] = DrawFormattedText(wPtr, ...
    'Select the letter in the order presented. Use the bland button to fill in forgotten items.', 'center', h/20, 0);

Screen('TextFont',wPtr, 'Arial');
Screen('TextSize',wPtr, 80);
Screen('FillRect', wPtr, color_marker_tl, [36*w/100, 10*w/100, 42*w/100, 16*w/100]);
Screen('DrawText', wPtr, 'F', 37.5*w/100, 10.5*w/100);
Screen('FillRect', wPtr, color_marker_tm, [47*w/100, 10*w/100, 53*w/100, 16*w/100]);
Screen('DrawText', wPtr, 'H', 48*w/100, 10.5*w/100);
Screen('FillRect', wPtr,color_marker_tr, [58*w/100, 10*w/100, 64*w/100, 16*w/100]);
Screen('DrawText', wPtr, 'J', 59.5*w/100, 10.5*w/100);

Screen('FillRect', wPtr, color_marker_ml, [36*w/100, 18*w/100, 42*w/100, 24*w/100]);
Screen('DrawText', wPtr, 'K', 37.5*w/100, 18.5*w/100);
Screen('FillRect', wPtr, color_marker_mm, [47*w/100, 18*w/100, 53*w/100, 24*w/100]);
Screen('DrawText', wPtr, 'L', 48.5*w/100, 18.5*w/100);
Screen('FillRect', wPtr, color_marker_mr, [58*w/100, 18*w/100, 64*w/100, 24*w/100]);
Screen('DrawText', wPtr, 'N', 59.5*w/100, 18.5*w/100);

Screen('FillRect', wPtr, color_marker_bl, [36*w/100, 26*w/100, 42*w/100, 32*w/100]);
Screen('DrawText', wPtr, 'P', 37.5*w/100, 26.5*w/100);
Screen('FillRect', wPtr, color_marker_bm, [47*w/100, 26*w/100, 53*w/100, 32*w/100]);
Screen('DrawText', wPtr, 'Q', 48*w/100, 26.5*w/100);
Screen('FillRect', wPtr, color_marker_br, [58*w/100, 26*w/100, 64*w/100, 32*w/100]);
Screen('DrawText', wPtr, 'R', 59.5*w/100, 26.5*w/100);

Screen('FillRect', wPtr, color_marker_bbl, [36*w/100, 34*w/100, 42*w/100, 40*w/100]);
Screen('DrawText', wPtr, 'S', 37.5*w/100, 34.5*w/100);
Screen('FillRect', wPtr, color_marker_bbm, [47*w/100, 34*w/100, 53*w/100, 40*w/100]);
Screen('DrawText', wPtr, 'T', 48.5*w/100, 34.5*w/100);
Screen('FillRect', wPtr, color_marker_bbr, [58*w/100, 34*w/100, 64*w/100, 40*w/100]);
Screen('DrawText', wPtr, 'Y', 59.5*w/100, 34.5*w/100);

Screen('TextFont',wPtr, 'Arial');
Screen('TextSize',wPtr, 30);
[nx, ny, bbox] = DrawFormattedText(wPtr, input_letter, 'center', 42.5*w/100, [255, 0, 0]);

Screen('FillRect', wPtr, [186 186 186], [25*w/100, 47*w/100, 36.5*w/100, 52*w/100]);
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 40);
Screen('DrawText', wPtr, 'CLEAR', 25.6*w/100, 48*w/100, [0 0 0]);

Screen('FillRect', wPtr, [186 186 186], [44.25*w/100, 47*w/100, 55.75*w/100, 52*w/100]);
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 40);
Screen('DrawText', wPtr, 'BLANK', 45*w/100, 48*w/100, [0 0 0]);

Screen('FillRect', wPtr, [186 186 186], [63.5*w/100, 47*w/100, 75*w/100, 52*w/100]);
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 40);
Screen('DrawText', wPtr, 'EXIT', 66*w/100, 48*w/100, [0 0 0]);

Screen('Flip',wPtr);
end