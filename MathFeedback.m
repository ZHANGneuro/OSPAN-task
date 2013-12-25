function MathFeedback(wPtr,h, num_correctmath, mathcount,precentage_cor)

math_text = ['You were correct on' '  ' num2str(num_correctmath) '  ' 'of' '  ' num2str(mathcount) '  ' 'math trials\n'  'This is' ' ' num2str(precentage_cor) ' ' 'present correct'];
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 40);
[nx, ny, bbox] = DrawFormattedText(wPtr, math_text, 'center', 30*h/100, 0);
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 0);
Screen('TextSize',wPtr, 30);
[nx, ny, bbox] = DrawFormattedText(wPtr, 'Click the left mouse button to continue.', 'center', 70*h/100, 0);
Screen('Flip',wPtr);
end