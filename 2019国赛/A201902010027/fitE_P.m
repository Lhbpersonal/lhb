function [fitresult, gof] = fitE_P(P, E)
%CREATEFIT(P,E)
%  Create a fit.
%
%  Data for 'fitP' fit:
%      X Input : P
%      Y Output: E
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 13-Sep-2019 21:45:15 自动生成


%% Fit: 'fitP'.
[xData, yData] = prepareCurveData( P, E );

% Set up fittype and options.
ft = fittype( 'poly6' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'fitP' );
h = plot( fitresult, xData, yData );
legend( h, 'E vs. P', 'fitP_E', 'Location', 'NorthEast' );
% Label axes
xlabel P
ylabel E
grid on


