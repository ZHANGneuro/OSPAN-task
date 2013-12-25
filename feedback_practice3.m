function feedback_practice3(wPtr,w,h, correctletters, lettercount,presentage_math,local_total_math_error)

letter_text = ['You recalled' '  ' num2str(correctletters) '  ' 'out of' '  ' num2str(lettercount) '  ' 'letters correctly'];
letter_text_math_error = ['You made' ' ' num2str(local_total_math_error) ' ' 'math error(s) for this set of trials'];
letter_text_presentage_math = [num2str(presentage_math) ' ' '%'];
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 30);
[nx, ny, bbox] = DrawFormattedText(wPtr, letter_text, 'center', 45*h/100, 0);
[nx, ny, bbox] = DrawFormattedText(wPtr, letter_text_math_error, 'center', 55*h/100, 0);
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 50);
[nx, ny, bbox] = DrawFormattedText(wPtr, letter_text_presentage_math, 80*w/100, 10*h/100, [255 0 0]);
Screen('Flip',wPtr);
end