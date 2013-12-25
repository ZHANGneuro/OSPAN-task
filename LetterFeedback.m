
function LetterFeedback(wPtr,h, correctletters, lettercount)

letter_text = ['You recalled' '  ' num2str(correctletters) '  ' 'out of' '  ' num2str(lettercount) '  ' 'letters correctly'];
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 40);
[nx, ny, bbox] = DrawFormattedText(wPtr, letter_text, 'center', 45*h/100, 0);
Screen('Flip',wPtr);
end