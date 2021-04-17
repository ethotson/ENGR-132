function[] = PS07_academic_integrity_ehotson(names)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%This program replaces 
%
% Function Call
%PS07_academic_integrity.m(X)
%
% Input Arguments
% 1. names - series of names to be printed
%
% Output Arguments
% None
%
% Assignment Information
%   Assignment:       	PS 07, Problem 2
%   Author:             Ethan Hotson, ehotson@purdue.edu
%   Team ID:            009-01      
%  	Contributor: 		N/A
%   My contributor(s) helped me:	
%     [ ] understand the assignment expectations without
%         telling me how they will approach it.
%     [ ] understand different ways to think about a solution
%         without helping me plan my solution.
%     [ ] think through the meaning of a specific error or
%         bug present in my code without looking at my code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% INITIALIZATION

purdue_astronauts = ["Neil Armstrong","Eugene Cernan","Loral OHara","Scott Tingle"];

%% ____________________
%% SELECTION STRUCTURE
n=numel(names)
name = string(names)
if(n==0)
    fprintf("Error\n");
elseif(n == 1);
    fprintf("We are submitting code that is our own original work. We have not used source code, either modified or unmodified, obtained from any unauthorized source.  Neither have we provided access to our code to any peer or unauthorized source. Signed, ");
    fprintf("%f\n",'name(1)');
elseif(n == 2);
    fprintf("We are submitting code that is our own original work. We have not used source code, either modified or unmodified, obtained from any unauthorized source.  Neither have we provided access to our code to any peer or unauthorized source. Signed, ");
    fprintf("%f\n",name(1));
    fprintf("%f\n",name(2));
elseif(n == 3);
    fprintf("We are submitting code that is our own original work. We have not used source code, either modified or unmodified, obtained from any unauthorized source.  Neither have we provided access to our code to any peer or unauthorized source. Signed, ");
    fprintf("%f\n",name(1));
    fprintf("%f\n",name(2));
    fprintf("%f\n",name(3));
elseif(n == 4);
    fprintf("We are submitting code that is our own original work. We have not used source code, either modified or unmodified, obtained from any unauthorized source.  Neither have we provided access to our code to any peer or unauthorized source. Signed, ");
    fprintf("%f\n",name(1));
    fprintf("%f\n",name(2));
    fprintf("%f\n",name(3));
    fprintf("%f\n",name(4));
elseif(n == 5);
    fprintf("We are submitting code that is our own original work. We have not used source code, either modified or unmodified, obtained from any unauthorized source.  Neither have we provided access to our code to any peer or unauthorized source. Signed, ");
    fprintf("%f\n",name(1));
    fprintf("%f\n",name(2));
    fprintf("%f\n",name(3));
    fprintf("%f\n",name(4));
    fprintf("%f\n",name(5));
else
    fprintf("Error\n")
end;

%% ____________________
%% COMMAND WINDOW OUTPUTS

