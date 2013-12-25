function final_feedback(wPtr,w,h, Ospan_score,total_number_correct_letter,global_total_math_error,global_math_speed_errors,global_math_accuracy_errors)

math_text = ['OSPAN Absolute Score' '  ' '  ' '  ' num2str(Ospan_score)];
math_text2 = ['OSPAN Total Correct' '  ' '  ' '  ' '  ' num2str(total_number_correct_letter)];
math_text3 = ['Math Total Errors' '  ' '  ' '  ' '  ' num2str(global_total_math_error)];
math_text4 = ['Math Speed Errors' '  ' '  ' '  ' '  ' num2str(global_math_speed_errors)];
math_text5 = ['Math Accuracy Error' '  ' '  ' '  ' '  ' num2str(global_math_accuracy_errors)];
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 1);
Screen('TextSize',wPtr, 40);
[nx, ny, bbox] = DrawFormattedText(wPtr, math_text, 30*w/100, 20*h/100, 0);
[nx, ny, bbox] = DrawFormattedText(wPtr, math_text2, 30*w/100, 30*h/100, 0);
[nx, ny, bbox] = DrawFormattedText(wPtr, math_text3, 30*w/100, 50*h/100, 0);
[nx, ny, bbox] = DrawFormattedText(wPtr, math_text4, 30*w/100, 60*h/100, 0);
[nx, ny, bbox] = DrawFormattedText(wPtr, math_text5, 30*w/100, 70*h/100, 0);
Screen('TextFont',wPtr, 'Arial');
Screen('TextStyle',wPtr, 0);
Screen('TextSize',wPtr, 20);
[nx, ny, bbox] = DrawFormattedText(wPtr, 'Press ESC to quit', 'center', 90*h/100, 0);
Screen('Flip',wPtr);
end