function [fitresult, gof] = fitRho_P(p, rho)
%CREATEFIT(P,RHO)
%  Create a fit.
%
%  Data for 'fitRoh' fit:
%      X Input : p
%      Y Output: rho
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 13-Sep-2019 21:54:26 自动生成


%% Fit: 'fitRoh'.
[xData, yData] = prepareCurveData( p, rho );

% Set up fittype and options.
ft = fittype( 'poly2' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'fitRoh_P' );
h = plot( fitresult, xData, yData );
legend( h, 'rho vs. p', 'fitRoh', 'Location', 'NorthEast' );
% Label axes
xlabel p
ylabel rho
grid on


