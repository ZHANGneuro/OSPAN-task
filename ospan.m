
function ospan(subject_ID)

Screen('Preference', 'SkipSyncTests', 1); % skip sync-tests for retina display
[wPtr,wRect] = Screen('OpenWindow', 0);
w = wRect(RectRight);
h = wRect(RectBottom);
white = WhiteIndex(wPtr);
KbName('UnifyKeyNames');
% black = BlackIndex(wPtr);
% gray = (white + black) / 2;

rect_tl = [36*w/100, 10*w/100, 42*w/100, 16*w/100];
rect_tm = [47*w/100, 10*w/100, 53*w/100, 16*w/100];
rect_tr = [58*w/100, 10*w/100, 64*w/100, 16*w/100];
rect_ml =  [36*w/100, 18*w/100, 42*w/100, 24*w/100];
rect_mm = [47*w/100, 18*w/100, 53*w/100, 24*w/100];
rect_mr = [58*w/100, 18*w/100, 64*w/100, 24*w/100];
rect_bl = [36*w/100, 26*w/100, 42*w/100, 32*w/100];
rect_bm = [47*w/100, 26*w/100, 53*w/100, 32*w/100];
rect_br = [58*w/100, 26*w/100, 64*w/100, 32*w/100];
rect_bbl = [36*w/100, 34*w/100, 42*w/100, 40*w/100];
rect_bbm = [47*w/100, 34*w/100, 53*w/100, 40*w/100];
rect_bbr = [58*w/100, 34*w/100, 64*w/100, 40*w/100];
rect_clear = [25*w/100, 47*w/100, 36.5*w/100, 52*w/100];
rect_blank = [44.25*w/100, 47*w/100, 55.75*w/100, 52*w/100];
rect_exit = [63.5*w/100, 47*w/100, 75*w/100, 52*w/100];
rect_ture = [30*w/100, 40*w/100, 42*w/100, 45*w/100];
rect_false = [58*w/100, 40*w/100, 70*w/100, 45*w/100];


% ****************************
%             load instruction 1-3
% ****************************

img = imread('./image/1.png');
[y, x, depth] = size(img);
x = x/2.5;
y = y/2.5;
t1 = Screen('MakeTexture', wPtr, img);
Screen('DrawTexture', wPtr, t1, [],  [(w-x)/2 (h-y)/2 (w-x)/2+x (h-y)/2+y]);
Screen('Flip',wPtr);


for num = 1:2
    while 1
        [secs, keyCode, deltaSecs] = KbWait([], 3);
        if keyCode(KbName('escape'))
            Screen('CloseAll');
            return;
        end
        if keyCode(KbName('SPACE'))
            img = imread(['./image/' num2str(num+1) '.png']);
            [y, x, depth] = size(img);
            x = x/2.5;
            y = y/2.5;
            t1 = Screen('MakeTexture', wPtr, img);
            Screen('DrawTexture', wPtr, t1, [],  [(w-x)/2 (h-y)/2 (w-x)/2+x (h-y)/2+y]);
            Screen('Flip',wPtr);
            break;
        end
    end
end


% ********************************************
%                parctice part 1 (2 letters presented)
% ********************************************

showed_letter = cell(100,1);
selected_letter_array = cell(100,1); % for calculating the correctletters
letter_box_parc = ['L' 'N'];

while 1
    [secs, keyCode, deltaSecs] = KbWait([], 3);
    if keyCode(KbName('escape'))
        Screen('CloseAll');
        return;
    end
    if keyCode(KbName('SPACE'))
        letter_showed = letter_box_parc(1,1);
        showletter(wPtr,w,h, letter_showed);
        letter_showed = letter_box_parc(1,2);
        showletter(wPtr,w,h, letter_showed);
        break;
    end
end
color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];
color_marker_mr = [];color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
input_letter = 'The letter presented: ';
letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
    color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
    color_marker_bbm,color_marker_bbr,input_letter);

for n = 1:100
    [clicks,x,y,whichButton] = GetClicks([],0.001);
    if   whichButton == 1 && IsInRect(x,y,rect_tl)
        color_marker_tl = [186 186 186];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'F';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tm)
        color_marker_tl = [];color_marker_tm = [186 186 186];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'H';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [186 186 186];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'J';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_ml)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [186 186 186];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'K';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [186 186 186];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'L';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [186 186 186];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'N';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [186 186 186];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'P';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [186 186 186];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'Q';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_br)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [186 186 186];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'R';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [186 186 186];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'S';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [186 186 186];color_marker_bbr = [];
        showed_letter{n,1} =  'T';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [186 186 186];
        showed_letter{n,1} = 'Y';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_blank)
        showed_letter{n,1} = '_';
        input_letter = [showed_letter{:}];
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_clear)
        char_incell = [showed_letter{:}];
        if isempty(char_incell)
            input_letter = 'The letter presented: ';
        end
        if ~isempty(char_incell)
            char_incell(end) = [];
            showed_letter = cellstr(char_incell(:));
        end
        if ~isempty(showed_letter{1,1})
            input_letter = [showed_letter{:}];
        end
        if isempty(showed_letter{1,1})
            input_letter = 'The letter presented: ';
        end
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_exit)
        break;
    end
end

selected_str = [showed_letter{:}];
if isempty(selected_str)
    correctletters = 0;
end
selected_str_foradd_ = cell(1,100);
length_selected_str = length(selected_str);
for l = 1:length_selected_str
    selected_str_foradd_{1,l} = selected_str(1,l);
end
for m = length_selected_str+1:50
    selected_str_foradd_{1,m} = '_';
end
selected_str = [selected_str_foradd_{:}];
lettercount = length(letter_box_parc);
if ~isempty(selected_str)
    for q = 1:lettercount
        if selected_str(q) == letter_box_parc(q)
            selected_letter_array{q,1} = selected_str(q);
        end
    end
    selected_letter_array_str = [selected_letter_array{:}];
    correctletters = length(selected_letter_array_str);
end
LetterFeedback(wPtr,h, correctletters, lettercount);
WaitSecs(2);

% ********************************************
%                parctice part 1 (2 letters presented)
% ********************************************

showed_letter = cell(100,1);
selected_letter_array = cell(100,1); % for calculating the correctletters
letter_box_parc = ['Q' 'J'];

letter_showed = letter_box_parc(1,1);
showletter(wPtr,w,h, letter_showed);
letter_showed = letter_box_parc(1,2);
showletter(wPtr,w,h, letter_showed);

color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];
color_marker_mr = [];color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
input_letter = 'The letter presented: ';
letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
    color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
    color_marker_bbm,color_marker_bbr,input_letter);

for n = 1:100
    [clicks,x,y,whichButton] = GetClicks([],0.001);
    if   whichButton == 1 && IsInRect(x,y,rect_tl)
        color_marker_tl = [186 186 186];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'F';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tm)
        color_marker_tl = [];color_marker_tm = [186 186 186];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'H';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [186 186 186];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'J';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_ml)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [186 186 186];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'K';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [186 186 186];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'L';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [186 186 186];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'N';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [186 186 186];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'P';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [186 186 186];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'Q';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_br)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [186 186 186];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'R';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [186 186 186];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'S';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [186 186 186];color_marker_bbr = [];
        showed_letter{n,1} =  'T';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [186 186 186];
        showed_letter{n,1} = 'Y';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_blank)
        showed_letter{n,1} = '_';
        input_letter = [showed_letter{:}];
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_clear)
        char_incell = [showed_letter{:}];
        if isempty(char_incell)
            input_letter = 'The letter presented: ';
        end
        if ~isempty(char_incell)
            char_incell(end) = [];
            showed_letter = cellstr(char_incell(:));
        end
        if ~isempty(showed_letter{1,1})
            input_letter = [showed_letter{:}];
        end
        if isempty(showed_letter{1,1})
            input_letter = 'The letter presented: ';
        end
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_exit)
        break;
    end
end

selected_str = [showed_letter{:}];
if isempty(selected_str)
    correctletters = 0;
end
selected_str_foradd_ = cell(1,100);
length_selected_str = length(selected_str);
for l = 1:length_selected_str
    selected_str_foradd_{1,l} = selected_str(1,l);
end
for m = length_selected_str+1:50
    selected_str_foradd_{1,m} = '_';
end
selected_str = [selected_str_foradd_{:}];
lettercount = length(letter_box_parc);
if ~isempty(selected_str)
    for q = 1:lettercount
        if selected_str(q) == letter_box_parc(q)
            selected_letter_array{q,1} = selected_str(q);
        end
    end
    selected_letter_array_str = [selected_letter_array{:}];
    correctletters = length(selected_letter_array_str);
end
LetterFeedback(wPtr,h, correctletters, lettercount);
WaitSecs(2);

% ********************************************
%                parctice part 1 (3 letters presented)
% ********************************************

showed_letter = cell(100,1);
selected_letter_array = cell(100,1); % for calculating the correctletters
letter_box_parc = ['H' 'K' 'T'];

letter_showed = letter_box_parc(1,1);
showletter(wPtr,w,h, letter_showed);
letter_showed = letter_box_parc(1,2);
showletter(wPtr,w,h, letter_showed);
letter_showed = letter_box_parc(1,3);
showletter(wPtr,w,h, letter_showed);

color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];
color_marker_mr = [];color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
input_letter = 'The letter presented: ';
letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
    color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
    color_marker_bbm,color_marker_bbr,input_letter);

for n = 1:100
    [clicks,x,y,whichButton] = GetClicks([],0.001);
    if   whichButton == 1 && IsInRect(x,y,rect_tl)
        color_marker_tl = [186 186 186];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'F';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tm)
        color_marker_tl = [];color_marker_tm = [186 186 186];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'H';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [186 186 186];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'J';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_ml)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [186 186 186];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'K';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [186 186 186];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'L';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [186 186 186];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'N';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [186 186 186];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'P';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [186 186 186];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'Q';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_br)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [186 186 186];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'R';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [186 186 186];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'S';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [186 186 186];color_marker_bbr = [];
        showed_letter{n,1} =  'T';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [186 186 186];
        showed_letter{n,1} = 'Y';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_blank)
        showed_letter{n,1} = '_';
        input_letter = [showed_letter{:}];
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_clear)
        char_incell = [showed_letter{:}];
        if isempty(char_incell)
            input_letter = 'The letter presented: ';
        end
        if ~isempty(char_incell)
            char_incell(end) = [];
            showed_letter = cellstr(char_incell(:));
        end
        if ~isempty(showed_letter{1,1})
            input_letter = [showed_letter{:}];
        end
        if isempty(showed_letter{1,1})
            input_letter = 'The letter presented: ';
        end
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_exit)
        break;
    end
end

selected_str = [showed_letter{:}];
if isempty(selected_str)
    correctletters = 0;
end
selected_str_foradd_ = cell(1,100);
length_selected_str = length(selected_str);
for l = 1:length_selected_str
    selected_str_foradd_{1,l} = selected_str(1,l);
end
for m = length_selected_str+1:50
    selected_str_foradd_{1,m} = '_';
end
selected_str = [selected_str_foradd_{:}];
lettercount = length(letter_box_parc);
if ~isempty(selected_str)
    for q = 1:lettercount
        if selected_str(q) == letter_box_parc(q)
            selected_letter_array{q,1} = selected_str(q);
        end
    end
    selected_letter_array_str = [selected_letter_array{:}];
    correctletters = length(selected_letter_array_str);
end
LetterFeedback(wPtr,h, correctletters, lettercount);
WaitSecs(2);


% ****************************
%             load instruction 4-6
% ****************************
img = imread('./image/4.png');
[y, x, depth] = size(img);
x = x/2.5;
y = y/2.5;
t1 = Screen('MakeTexture', wPtr, img);
Screen('DrawTexture', wPtr, t1, [],  [(w-x)/2 (h-y)/2 (w-x)/2+x (h-y)/2+y]);
Screen('Flip',wPtr);

for num = 1:2
    while 1
        [secs, keyCode, deltaSecs] = KbWait([], 3);
        if keyCode(KbName('escape'))
            Screen('CloseAll');
            return;
        end
        if keyCode(KbName('SPACE'))
            img = imread(['./image/' num2str(num+4) '.png']);
            [y, x, depth] = size(img);
            x = x/2.5;
            y = y/2.5;
            t1 = Screen('MakeTexture', wPtr, img);
            Screen('DrawTexture', wPtr, t1, [],  [(w-x)/2 (h-y)/2 (w-x)/2+x (h-y)/2+y]);
            Screen('Flip',wPtr);
            break;
        end
    end
end
% ********************************************
%                parctice part 2
% ********************************************

math_info = cell(3,3);
math_info{1,1}='(1*2) + 1 = ?';
math_info{2,1}='(1/1) - 1 = ?';
math_info{3,1}='(7*3) - 3 = ?';
math_info{1,2}='3';
math_info{2,2}='2';
math_info{3,2}='18';
math_info{1,3}='TRUE';
math_info{2,3}='FALSE';
math_info{3,3}='TRUE';
correctmath = zeros(3,1);
time_elapsed = zeros(3,1);

[clicks,x,y,whichButton] = GetClicks([],0.001);
if clicks ==1
    for n =1:3
        rand_equation = cell(n,1);
        math_result = cell(n,1);
        choice_result = cell(n,1);
        rand_equation(n,1) = randsample(math_info(:,1),1);
        [row col]=find(cellfun(@(x) strcmp(x,rand_equation{n,1}),math_info));
        math_result(n,1) = math_info(row,2);
        choice_result(n,1) = math_info(row,3);
        math_info(row,:) = [];
        show_equation(wPtr,w,h,n,rand_equation);
        tic
        while 1
            [clicks,x,y,whichButton] = GetClicks([],0.001);
            time_elapsed(n,1) = toc;
            if clicks ==1
                color_marker_T = white; color_marker_F = white; color_marker_cor_incor=white; cor_incor=' ';
                show_math_result(wPtr,w,h,n,math_result,color_marker_T,color_marker_F,color_marker_cor_incor, cor_incor)
            end
            
            [clicks,x,y,whichButton] = GetClicks([],0.001);
            if  clicks ==1 && IsInRect(x,y,rect_ture)
                color_marker_T = [186 186 186]; color_marker_F = white; color_marker_cor_incor=white;
                if isempty(setdiff(choice_result{n,1},'TRUE'))
                    cor_incor = 'Correct';
                    correctmath(n,1) = 1;
                else
                    cor_incor = 'Incorrect';
                end
                show_math_result(wPtr,w,h,n,math_result,color_marker_T,color_marker_F,color_marker_cor_incor, cor_incor)
                WaitSecs(1);
                break;
            end
            
            if   whichButton == 1 && IsInRect(x,y,rect_false)
                color_marker_T = white; color_marker_F = [186 186 186]; color_marker_cor_incor=white;
                if isempty(setdiff(choice_result{n,1},'FALSE'))
                    cor_incor = 'Correct';
                    correctmath(n,1) = 1;
                else
                    cor_incor = 'Incorrect';
                end
                show_math_result(wPtr,w,h,n,math_result,color_marker_T,color_marker_F,color_marker_cor_incor, cor_incor)
                WaitSecs(1);
                break;
            end
        end
    end
end

num_correctmath = sum(correctmath == 1);
mathcount = 3;
precentage_cor = round((num_correctmath/mathcount)*100);
MathFeedback(wPtr,h, num_correctmath, mathcount,precentage_cor)
average_time_elapsed = (time_elapsed(1,1) + time_elapsed(2,1) + time_elapsed(3,1))/3+2.5;

% ****************************
%              instruction part 3 (7-9)
% ****************************
while 1
    [secs, keyCode, deltaSecs] = KbWait([], 3);
    if keyCode(KbName('escape'))
        Screen('CloseAll');
        return;
    end
    if keyCode(KbName('SPACE'))
        img = imread('./image/7.png');
        [y, x, depth] = size(img);
        x = x/2;
        y = y/2;
        t1 = Screen('MakeTexture', wPtr, img);
        Screen('DrawTexture', wPtr, t1, [],  [(w-x)/2 (h-y)/2 (w-x)/2+x (h-y)/2+y]);
        Screen('Flip',wPtr);
        break;
    end
end

for num = 1:2
    while 1
        [secs, keyCode, deltaSecs] = KbWait([], 3);
        if keyCode(KbName('escape'))
            Screen('CloseAll');
            return;
        end
        if keyCode(KbName('SPACE'))
            img = imread(['./image/' num2str(num+7) '.png']);
            [y, x, depth] = size(img);
            x = x/2;
            y = y/2;
            t1 = Screen('MakeTexture', wPtr, img);
            Screen('DrawTexture', wPtr, t1, [],  [(w-x)/2 (h-y)/2 (w-x)/2+x (h-y)/2+y]);
            Screen('Flip',wPtr);
            break;
        end
    end
end

% ********************************************
%                parctice part 3 (two sets)
% ********************************************

MathOpt01 = textread('./MathOpt01.txt', '%s');
MathOpt02 = textread('./MathOpt02.txt', '%s');
MathSign = textread('./MathSign.txt', '%s');
MathCorrect = textread('./MathCorrect.txt', '%s');
MathRand = textread('./MathRand.txt', '%s');
letter_pool = ['F','P','Q','J','H','K','T','S','N','R','Y','L'];
trial_length_pool = ['3' '7'];
total_math_shown=zeros(1,1);
total_math_correct=zeros(1,1);

% ********************************************
%                set 1
% ********************************************
[clicks,x,y,whichButton] = GetClicks;
if clicks ==1
    trial_length = randsample(trial_length_pool,1);
    the_th = find(trial_length_pool == trial_length);
    trial_length_pool(the_th) = [];
    trial_length_num = str2num(trial_length);
    rand_equation = cell(trial_length_num,1);
    math_result = cell(trial_length_num,1);
    math_correct = cell(trial_length_num,1);
    math_rand = cell(trial_length_num,1);
    math_result_false_arr = cell(trial_length_num,1);
    correctmath_parc3 = cell(trial_length_num,1);
    letter_memory = cell(100,1);
    showed_letter = cell(100,1);
    selected_letter_array = cell(100,1);
    for n = 1:trial_length_num
        rand_equation{n,1} = [cell2mat(randsample(MathOpt01,1)) cell2mat(randsample(MathSign,1)) cell2mat(randsample(MathOpt02,1))];
        math_result{n,1} = str2num(rand_equation{n,1});
        math_correct{n,1} = randsample(MathCorrect,1);
        math_rand(n,1) = randsample(MathRand,1);
        [start_time]=show_equation_practice3(wPtr,w,h,n,rand_equation);
        
        while GetSecs - start_time < average_time_elapsed
            [z,c,buttons,focus,valuators,valinfo] = GetMouse;
            if buttons(1) ==1 && strcmp('TRUE', math_correct{n,1}) == 1
                math_result_true = num2str(math_result{n,1});
                color_marker_T = white; color_marker_F = white;
                show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
                [clicks,x,y,whichButton] = GetClicks([],0.001);
                if  clicks ==1 && IsInRect(x,y,rect_ture)
                    correctmath_parc3{n,1} = '1';
                    color_marker_T = [186 186 186]; color_marker_F = white;
                    show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
                    WaitSecs(0.5);
                    break;
                end
                if  clicks ==1 && IsInRect(x,y,rect_false)
                    correctmath_parc3{n,1} = 'A';% A represents math accuracy error
                    color_marker_T = white; color_marker_F = [186 186 186];
                    show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
                    WaitSecs(0.5);
                    break;
                end
            end
            if buttons(1) ==1 && strcmp('FALSE', math_correct{n,1}) == 1
                math_result_false_arr{n,1} = math_result{n,1} + str2num(math_rand{n,1});
                math_result_false = num2str(math_result_false_arr{n,1});
                color_marker_T = white; color_marker_F = white;
                show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
                [clicks,x,y,whichButton] = GetClicks([],0.001);
                if  clicks ==1 && IsInRect(x,y,rect_ture)
                    correctmath_parc3{n,1} = 'A'; % A represents math accuracy error
                    color_marker_T = [186 186 186]; color_marker_F = white;
                    show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
                    WaitSecs(0.5);
                    break;
                end
                if  clicks ==1 && IsInRect(x,y,rect_false)
                    correctmath_parc3{n,1} = '1';
                    color_marker_T = white; color_marker_F = [186 186 186];
                    show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
                    WaitSecs(0.5);
                    break;
                end
            end
        end
        if  isempty(correctmath_parc3{n,1})
            correctmath_parc3{n,1} = 'S';% S represents math_speed_error
        end
        letter_showed = randsample(letter_pool,1);
        letter_memory{n,1} = letter_showed;
        showletter(wPtr,w,h,letter_showed)
    end
    
    color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];
    color_marker_mr = [];color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
    input_letter = 'The letter presented: ';
    letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
        color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
        color_marker_bbm,color_marker_bbr,input_letter);
    for n = 1:100
        [clicks,x,y,whichButton] = GetClicks([],0.001);
        if   whichButton == 1 && IsInRect(x,y,rect_tl)
            color_marker_tl = [186 186 186];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} = 'F';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_tm)
            color_marker_tl = [];color_marker_tm = [186 186 186];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} = 'H';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_tr)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [186 186 186];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} =  'J';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_ml)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [186 186 186];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} = 'K';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_mm)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [186 186 186];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} =  'L';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_mr)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [186 186 186];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} = 'N';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_bl)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [186 186 186];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} = 'P';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_bm)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [186 186 186];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} = 'Q';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_br)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [186 186 186];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} = 'R';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_bbl)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [186 186 186];color_marker_bbm = [];color_marker_bbr = [];
            showed_letter{n,1} =  'S';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_bbm)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [186 186 186];color_marker_bbr = [];
            showed_letter{n,1} =  'T';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_bbr)
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [186 186 186];
            showed_letter{n,1} = 'Y';
            input_letter = [showed_letter{:}];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_blank)
            showed_letter{n,1} = '_';
            input_letter = [showed_letter{:}];
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_clear)
            char_incell = [showed_letter{:}];
            if isempty(char_incell)
                input_letter = 'The letter presented: ';
            end
            if ~isempty(char_incell)
                char_incell(end) = [];
                showed_letter = cellstr(char_incell(:));
            end
            if ~isempty(showed_letter{1,1})
                input_letter = [showed_letter{:}];
            end
            if isempty(showed_letter{1,1})
                input_letter = 'The letter presented: ';
            end
            color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
            color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
            letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
                color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
                color_marker_bbm,color_marker_bbr,input_letter);
        end
        if  whichButton == 1 && IsInRect(x,y,rect_exit)
            break;
        end
    end
    selected_str = [showed_letter{:}];
    if isempty(selected_str)
        correctletters = 0;
    end
    selected_str_foradd_ = cell(1,100);
    length_selected_str = length(selected_str);
    for l = 1:length_selected_str
        selected_str_foradd_{1,l} = selected_str(1,l);
    end
    for m = length_selected_str+1:50
        selected_str_foradd_{1,m} = '_';
    end
    selected_str = [selected_str_foradd_{:}];
    lettercount = trial_length_num;
    if ~isempty(selected_str)
        for q = 1:lettercount
            if selected_str(q) == letter_memory{q}
                selected_letter_array{q,1} = selected_str(q);
            end
        end
        selected_letter_array_str = [selected_letter_array{:}];
        correctletters = length(selected_letter_array_str);
    end
    correctmath_parc3_char = [correctmath_parc3{:}];
    num_total_math = trial_length_num;
    num_corr_math = sum(correctmath_parc3_char=='1');
    total_math_shown(1,1)=num_total_math;
    total_math_correct(1,1)=num_corr_math;
    presentage_math = round((num_corr_math/num_total_math)*100);
    local_total_math_error = sum(correctmath_parc3_char=='A') + sum(correctmath_parc3_char=='S');
    feedback_practice3(wPtr,w,h, correctletters, lettercount,presentage_math,local_total_math_error);
    WaitSecs(2);
end

% ********************************************
%                set 2
% ********************************************
trial_length = randsample(trial_length_pool,1);
trial_length_num = str2num(trial_length);
rand_equation = cell(trial_length_num,1);
math_result = cell(trial_length_num,1);
math_correct = cell(trial_length_num,1);
math_rand = cell(trial_length_num,1);
math_result_false_arr = cell(trial_length_num,1);
correctmath_parc3 = cell(trial_length_num,1);
letter_memory = cell(100,1);
showed_letter = cell(100,1);
selected_letter_array = cell(100,1);
for n = 1:trial_length_num
    rand_equation{n,1} = [cell2mat(randsample(MathOpt01,1)) cell2mat(randsample(MathSign,1)) cell2mat(randsample(MathOpt02,1))];
    math_result{n,1} = str2num(rand_equation{n,1});
    math_correct{n,1} = randsample(MathCorrect,1);
    math_rand(n,1) = randsample(MathRand,1);
    [start_time]=show_equation_practice3(wPtr,w,h,n,rand_equation);
    
    while GetSecs - start_time < average_time_elapsed
        [z,c,buttons,focus,valuators,valinfo] = GetMouse;
        if buttons(1) ==1 && strcmp('TRUE', math_correct{n,1}) == 1
            math_result_true = num2str(math_result{n,1});
            color_marker_T = white; color_marker_F = white;
            show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
            [clicks,x,y,whichButton] = GetClicks([],0.001);
            if  clicks ==1 && IsInRect(x,y,rect_ture)
                correctmath_parc3{n,1} = '1';
                color_marker_T = [186 186 186]; color_marker_F = white;
                show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
            if  clicks ==1 && IsInRect(x,y,rect_false)
                correctmath_parc3{n,1} = 'A';% A represents math accuracy error
                color_marker_T = white; color_marker_F = [186 186 186];
                show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
        end
        if buttons(1) ==1 && strcmp('FALSE', math_correct{n,1}) == 1
            math_result_false_arr{n,1} = math_result{n,1} + str2num(math_rand{n,1});
            math_result_false = num2str(math_result_false_arr{n,1});
            color_marker_T = white; color_marker_F = white;
            show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
            [clicks,x,y,whichButton] = GetClicks([],0.001);
            if  clicks ==1 && IsInRect(x,y,rect_ture)
                correctmath_parc3{n,1} = 'A'; % A represents math accuracy error
                color_marker_T = [186 186 186]; color_marker_F = white;
                show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
            if  clicks ==1 && IsInRect(x,y,rect_false)
                correctmath_parc3{n,1} = '1';
                color_marker_T = white; color_marker_F = [186 186 186];
                show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
        end
    end
    if  isempty(correctmath_parc3{n,1})
        correctmath_parc3{n,1} = 'S';% S represents math_speed_error
    end
    letter_showed = randsample(letter_pool,1);
    letter_memory{n,1} = letter_showed;
    showletter(wPtr,w,h,letter_showed)
end

color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];
color_marker_mr = [];color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
input_letter = 'The letter presented: ';
letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
    color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
    color_marker_bbm,color_marker_bbr,input_letter);
for n = 1:100
    [clicks,x,y,whichButton] = GetClicks([],0.001);
    if   whichButton == 1 && IsInRect(x,y,rect_tl)
        color_marker_tl = [186 186 186];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'F';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tm)
        color_marker_tl = [];color_marker_tm = [186 186 186];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'H';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [186 186 186];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'J';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_ml)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [186 186 186];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'K';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [186 186 186];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'L';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [186 186 186];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'N';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [186 186 186];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'P';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [186 186 186];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'Q';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_br)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [186 186 186];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'R';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [186 186 186];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'S';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [186 186 186];color_marker_bbr = [];
        showed_letter{n,1} =  'T';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [186 186 186];
        showed_letter{n,1} = 'Y';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_blank)
        showed_letter{n,1} = '_';
        input_letter = [showed_letter{:}];
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_clear)
        char_incell = [showed_letter{:}];
        if isempty(char_incell)
            input_letter = 'The letter presented: ';
        end
        if ~isempty(char_incell)
            char_incell(end) = [];
            showed_letter = cellstr(char_incell(:));
        end
        if ~isempty(showed_letter{1,1})
            input_letter = [showed_letter{:}];
        end
        if isempty(showed_letter{1,1})
            input_letter = 'The letter presented: ';
        end
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_exit)
        break;
    end
end
selected_str = [showed_letter{:}];
if isempty(selected_str)
    correctletters = 0;
end
selected_str_foradd_ = cell(1,100);
length_selected_str = length(selected_str);
for l = 1:length_selected_str
    selected_str_foradd_{1,l} = selected_str(1,l);
end
for m = length_selected_str+1:50
    selected_str_foradd_{1,m} = '_';
end
selected_str = [selected_str_foradd_{:}];
lettercount = trial_length_num;
if ~isempty(selected_str)
    for q = 1:lettercount
        if selected_str(q) == letter_memory{q}
            selected_letter_array{q,1} = selected_str(q);
        end
    end
    selected_letter_array_str = [selected_letter_array{:}];
    correctletters = length(selected_letter_array_str);
end
correctmath_parc3_char = [correctmath_parc3{:}];
num_total_math = trial_length_num + total_math_shown(1,1);
num_corr_math = sum(correctmath_parc3_char=='1') + total_math_correct(1,1);
presentage_math = round((num_corr_math/num_total_math)*100);
local_total_math_error = sum(correctmath_parc3_char=='A') + sum(correctmath_parc3_char=='S');
feedback_practice3(wPtr,w,h, correctletters, lettercount,presentage_math,local_total_math_error);
WaitSecs(2);


img = imread('./image/10.png');
[y, x, depth] = size(img);
x = x/2;
y = y/2;
t1 = Screen('MakeTexture', wPtr, img);
Screen('DrawTexture', wPtr, t1, [],  [(w-x)/2 (h-y)/2 (w-x)/2+x (h-y)/2+y]);
Screen('Flip',wPtr);
WaitSecs(2);



% ********************************************
%   real trial is coming, is coming, is coming, is coming
% ********************************************

trial_length_pool = ['4' '6'];
total_math_shown=zeros(1,1);
total_math_correct=zeros(1,1);
Ospan_score = zeros(1,1);
total_number_correct_letter = zeros(1,1);
global_total_math_error = zeros(1,1);
global_math_speed_errors = zeros(1,1);
global_math_accuracy_errors = zeros(1,1);
% ********************************************
%               real trial set 1
% ********************************************
while 1
    [secs, keyCode, deltaSecs] = KbWait([], 3);
    if keyCode(KbName('escape'))
        Screen('CloseAll');
        return;
    end
    if keyCode(KbName('SPACE'))
        break;
    end
end
trial_length = randsample(trial_length_pool,1);
the_th = find(trial_length_pool == trial_length);
trial_length_pool(the_th) = [];
trial_length_num = str2num(trial_length);
rand_equation = cell(trial_length_num,1);
math_result = cell(trial_length_num,1);
math_correct = cell(trial_length_num,1);
math_rand = cell(trial_length_num,1);
math_result_false_arr = cell(trial_length_num,1);
correctmath_parc3 = cell(trial_length_num,1);
letter_memory = cell(100,1);
showed_letter = cell(100,1);
selected_letter_array = cell(100,1);
for n = 1:trial_length_num
    rand_equation{n,1} = [cell2mat(randsample(MathOpt01,1)) cell2mat(randsample(MathSign,1)) cell2mat(randsample(MathOpt02,1))];
    math_result{n,1} = str2num(rand_equation{n,1});
    math_correct{n,1} = randsample(MathCorrect,1);
    math_rand(n,1) = randsample(MathRand,1);
    [start_time]=show_equation_practice3(wPtr,w,h,n,rand_equation);
    
    while GetSecs - start_time < average_time_elapsed
        [z,c,buttons,focus,valuators,valinfo] = GetMouse;
        if buttons(1) ==1 && strcmp('TRUE', math_correct{n,1}) == 1
            math_result_true = num2str(math_result{n,1});
            color_marker_T = white; color_marker_F = white;
            show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
            [clicks,x,y,whichButton] = GetClicks([],0.001);
            if  clicks ==1 && IsInRect(x,y,rect_ture)
                correctmath_parc3{n,1} = '1';
                color_marker_T = [186 186 186]; color_marker_F = white;
                show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
            if  clicks ==1 && IsInRect(x,y,rect_false)
                correctmath_parc3{n,1} = 'A';% A represents math accuracy error
                color_marker_T = white; color_marker_F = [186 186 186];
                show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
        end
        if buttons(1) ==1 && strcmp('FALSE', math_correct{n,1}) == 1
            math_result_false_arr{n,1} = math_result{n,1} + str2num(math_rand{n,1});
            math_result_false = num2str(math_result_false_arr{n,1});
            color_marker_T = white; color_marker_F = white;
            show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
            [clicks,x,y,whichButton] = GetClicks([],0.001);
            if  clicks ==1 && IsInRect(x,y,rect_ture)
                correctmath_parc3{n,1} = 'A'; % A represents math accuracy error
                color_marker_T = [186 186 186]; color_marker_F = white;
                show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
            if  clicks ==1 && IsInRect(x,y,rect_false)
                correctmath_parc3{n,1} = '1';
                color_marker_T = white; color_marker_F = [186 186 186];
                show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
        end
    end
    if  isempty(correctmath_parc3{n,1})
        correctmath_parc3{n,1} = 'S';% S represents math_speed_error
    end
    letter_showed = randsample(letter_pool,1);
    letter_memory{n,1} = letter_showed;
    showletter(wPtr,w,h,letter_showed)
end

color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];
color_marker_mr = [];color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
input_letter = 'The letter presented: ';
letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
    color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
    color_marker_bbm,color_marker_bbr,input_letter);
for n = 1:100
    [clicks,x,y,whichButton] = GetClicks([],0.001);
    if   whichButton == 1 && IsInRect(x,y,rect_tl)
        color_marker_tl = [186 186 186];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'F';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tm)
        color_marker_tl = [];color_marker_tm = [186 186 186];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'H';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [186 186 186];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'J';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_ml)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [186 186 186];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'K';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [186 186 186];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'L';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [186 186 186];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'N';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [186 186 186];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'P';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [186 186 186];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'Q';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_br)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [186 186 186];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'R';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [186 186 186];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'S';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [186 186 186];color_marker_bbr = [];
        showed_letter{n,1} =  'T';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [186 186 186];
        showed_letter{n,1} = 'Y';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_blank)
        showed_letter{n,1} = '_';
        input_letter = [showed_letter{:}];
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_clear)
        char_incell = [showed_letter{:}];
        if isempty(char_incell)
            input_letter = 'The letter presented: ';
        end
        if ~isempty(char_incell)
            char_incell(end) = [];
            showed_letter = cellstr(char_incell(:));
        end
        if ~isempty(showed_letter{1,1})
            input_letter = [showed_letter{:}];
        end
        if isempty(showed_letter{1,1})
            input_letter = 'The letter presented: ';
        end
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_exit)
        break;
    end
end
selected_str = [showed_letter{:}];
if isempty(selected_str)
    correctletters = 0;
end
selected_str_foradd_ = cell(1,100);
length_selected_str = length(selected_str);
for l = 1:length_selected_str
    selected_str_foradd_{1,l} = selected_str(1,l);
end
for m = length_selected_str+1:50
    selected_str_foradd_{1,m} = '_';
end
selected_str = [selected_str_foradd_{:}];
lettercount = trial_length_num;
if ~isempty(selected_str)
    for q = 1:lettercount
        if selected_str(q) == letter_memory{q}
            selected_letter_array{q,1} = selected_str(q);
        end
    end
    selected_letter_array_str = [selected_letter_array{:}];
    correctletters = length(selected_letter_array_str);
end
total_number_correct_letter(1,1) = correctletters;
if correctletters == lettercount
    Ospan_score(1,1) = correctletters;
end
correctmath_parc3_char = [correctmath_parc3{:}];
num_total_math = trial_length_num;
num_corr_math = sum(correctmath_parc3_char=='1');
total_math_shown(1,1)=num_total_math;
total_math_correct(1,1)=num_corr_math;
presentage_math = round((num_corr_math/num_total_math)*100);
local_total_math_error = sum(correctmath_parc3_char=='A') + sum(correctmath_parc3_char=='S');
global_math_speed_errors(1,1) = sum(correctmath_parc3_char=='S');
global_math_accuracy_errors(1,1) = sum(correctmath_parc3_char=='A');
global_total_math_error(1,1) = sum(correctmath_parc3_char=='A') + sum(correctmath_parc3_char=='S');
feedback_practice3(wPtr,w,h, correctletters, lettercount,presentage_math,local_total_math_error);
WaitSecs(2);



% ********************************************
%               real trial set 2
% ********************************************
trial_length = randsample(trial_length_pool,1);
trial_length_num = str2num(trial_length);
rand_equation = cell(trial_length_num,1);
math_result = cell(trial_length_num,1);
math_correct = cell(trial_length_num,1);
math_rand = cell(trial_length_num,1);
math_result_false_arr = cell(trial_length_num,1);
correctmath_parc3 = cell(trial_length_num,1);
letter_memory = cell(100,1);
showed_letter = cell(100,1);
selected_letter_array = cell(100,1);
for n = 1:trial_length_num
    rand_equation{n,1} = [cell2mat(randsample(MathOpt01,1)) cell2mat(randsample(MathSign,1)) cell2mat(randsample(MathOpt02,1))];
    math_result{n,1} = str2num(rand_equation{n,1});
    math_correct{n,1} = randsample(MathCorrect,1);
    math_rand(n,1) = randsample(MathRand,1);
    [start_time]=show_equation_practice3(wPtr,w,h,n,rand_equation);
    
    while GetSecs - start_time < average_time_elapsed
        [z,c,buttons,focus,valuators,valinfo] = GetMouse;
        if buttons(1) ==1 && strcmp('TRUE', math_correct{n,1}) == 1
            math_result_true = num2str(math_result{n,1});
            color_marker_T = white; color_marker_F = white;
            show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
            [clicks,x,y,whichButton] = GetClicks([],0.001);
            if  clicks ==1 && IsInRect(x,y,rect_ture)
                correctmath_parc3{n,1} = '1';
                color_marker_T = [186 186 186]; color_marker_F = white;
                show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
            if  clicks ==1 && IsInRect(x,y,rect_false)
                correctmath_parc3{n,1} = 'A';% A represents math accuracy error
                color_marker_T = white; color_marker_F = [186 186 186];
                show_math_result_true(wPtr,w,h,math_result_true,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
        end
        if buttons(1) ==1 && strcmp('FALSE', math_correct{n,1}) == 1
            math_result_false_arr{n,1} = math_result{n,1} + str2num(math_rand{n,1});
            math_result_false = num2str(math_result_false_arr{n,1});
            color_marker_T = white; color_marker_F = white;
            show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
            [clicks,x,y,whichButton] = GetClicks([],0.001);
            if  clicks ==1 && IsInRect(x,y,rect_ture)
                correctmath_parc3{n,1} = 'A'; % A represents math accuracy error
                color_marker_T = [186 186 186]; color_marker_F = white;
                show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
            if  clicks ==1 && IsInRect(x,y,rect_false)
                correctmath_parc3{n,1} = '1';
                color_marker_T = white; color_marker_F = [186 186 186];
                show_math_result_false(wPtr,w,h,math_result_false,color_marker_T,color_marker_F)
                WaitSecs(0.5);
                break;
            end
        end
    end
    if  isempty(correctmath_parc3{n,1})
        correctmath_parc3{n,1} = 'S';% S represents math_speed_error
    end
    letter_showed = randsample(letter_pool,1);
    letter_memory{n,1} = letter_showed;
    showletter(wPtr,w,h,letter_showed)
end

color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];
color_marker_mr = [];color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
input_letter = 'The letter presented: ';
letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
    color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
    color_marker_bbm,color_marker_bbr,input_letter);
for n = 1:100
    [clicks,x,y,whichButton] = GetClicks([],0.001);
    if   whichButton == 1 && IsInRect(x,y,rect_tl)
        color_marker_tl = [186 186 186];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'F';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tm)
        color_marker_tl = [];color_marker_tm = [186 186 186];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'H';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_tr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [186 186 186];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'J';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_ml)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [186 186 186];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'K';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [186 186 186];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'L';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_mr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [186 186 186];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'N';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [186 186 186];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'P';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [186 186 186];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'Q';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_br)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [186 186 186];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} = 'R';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbl)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [186 186 186];color_marker_bbm = [];color_marker_bbr = [];
        showed_letter{n,1} =  'S';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbm)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [186 186 186];color_marker_bbr = [];
        showed_letter{n,1} =  'T';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_bbr)
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [186 186 186];
        showed_letter{n,1} = 'Y';
        input_letter = [showed_letter{:}];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_blank)
        showed_letter{n,1} = '_';
        input_letter = [showed_letter{:}];
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_clear)
        char_incell = [showed_letter{:}];
        if isempty(char_incell)
            input_letter = 'The letter presented: ';
        end
        if ~isempty(char_incell)
            char_incell(end) = [];
            showed_letter = cellstr(char_incell(:));
        end
        if ~isempty(showed_letter{1,1})
            input_letter = [showed_letter{:}];
        end
        if isempty(showed_letter{1,1})
            input_letter = 'The letter presented: ';
        end
        color_marker_tl = [];color_marker_tm = [];color_marker_tr = [];color_marker_ml = [];color_marker_mm = [];color_marker_mr = [];
        color_marker_bl = [];color_marker_bm = [];color_marker_br = [];color_marker_bbl = [];color_marker_bbm = [];color_marker_bbr = [];
        letter_selection_page(wPtr,w,h,color_marker_tl,color_marker_tm,color_marker_tr,color_marker_ml, ...
            color_marker_mm,color_marker_mr,color_marker_bl,color_marker_bm,color_marker_br,color_marker_bbl, ...
            color_marker_bbm,color_marker_bbr,input_letter);
    end
    if  whichButton == 1 && IsInRect(x,y,rect_exit)
        break;
    end
end
selected_str = [showed_letter{:}];
if isempty(selected_str)
    correctletters = 0;
end
selected_str_foradd_ = cell(1,100);
length_selected_str = length(selected_str);
for l = 1:length_selected_str
    selected_str_foradd_{1,l} = selected_str(1,l);
end
for m = length_selected_str+1:50
    selected_str_foradd_{1,m} = '_';
end
selected_str = [selected_str_foradd_{:}];
lettercount = trial_length_num;
if ~isempty(selected_str)
    for q = 1:lettercount
        if selected_str(q) == letter_memory{q}
            selected_letter_array{q,1} = selected_str(q);
        end
    end
    selected_letter_array_str = [selected_letter_array{:}];
    correctletters = length(selected_letter_array_str);
end
total_number_correct_letter(1,1) = correctletters + total_number_correct_letter(1,1);
if correctletters == lettercount
    Ospan_score(1,1) = correctletters + Ospan_score(1,1);
end
correctmath_parc3_char = [correctmath_parc3{:}];
num_total_math = trial_length_num + total_math_shown(1,1);
num_corr_math = sum(correctmath_parc3_char=='1') + total_math_correct(1,1);
presentage_math = round((num_corr_math/num_total_math)*100);
local_total_math_error = sum(correctmath_parc3_char=='A') + sum(correctmath_parc3_char=='S');
global_math_speed_errors(1,1) = sum(correctmath_parc3_char=='S')+global_math_speed_errors(1,1);
global_math_accuracy_errors(1,1) = sum(correctmath_parc3_char=='A')+global_math_accuracy_errors(1,1);
global_total_math_error(1,1) = sum(correctmath_parc3_char=='A') + sum(correctmath_parc3_char=='S') + global_total_math_error(1,1);
feedback_practice3(wPtr,w,h, correctletters, lettercount,presentage_math,local_total_math_error);
WaitSecs(2);

img = imread('./image/11.png');
[y, x, depth] = size(img);
x = x/2;
y = y/2;
t1 = Screen('MakeTexture', wPtr, img);
Screen('DrawTexture', wPtr, t1, [],  [(w-x)/2 (h-y)/2 (w-x)/2+x (h-y)/2+y]);
Screen('Flip',wPtr);
WaitSecs(2);
final_feedback(wPtr,w,h, Ospan_score,total_number_correct_letter,global_total_math_error,global_math_speed_errors,global_math_accuracy_errors)

cell_for_print = cell(5,1);
cell_for_print{1,1} = Ospan_score;
cell_for_print{2,1} = total_number_correct_letter;
cell_for_print{3,1} = global_total_math_error;
cell_for_print{4,1} = global_math_speed_errors;
cell_for_print{5,1} = global_math_accuracy_errors;

header = {'OSPAN Absolute Score'; 'OSPAN Total Correct'; 'Math Total Errors'; 'Math Speed Errors'; 'Math Accuracy Error'};
fin_printed_result = [header,cell_for_print];
folder = './result';
save([folder '/result_' num2str(subject_ID) '.mat'], 'fin_printed_result');


while 1
    [keyIsDown, secs, keyCode, deltaSecs] = KbCheck;
    if keyCode(KbName('escape'))
        Screen(wPtr,'Close');
        close all
        return;
    end
end

% ********************************************
%     End, next program comes soon.
% ********************************************
end