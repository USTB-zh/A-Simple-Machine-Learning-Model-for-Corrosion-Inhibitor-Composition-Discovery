function [g,h]=fun2min(x)
g=x(2)-3.5;
h=(7.37990888870099+0.0287227007147806.*x(1)+0.313551243289850.*log(x(2)))-7.6;
end