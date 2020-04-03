function [fitresult, gof] = fitd_t(t1, d1, t2, d2)
%CREATEFITS(T1,D1,T2,D2)
%  Create fits.
%
%  Data for 'fitd_t1' fit:
%      X Input : t1
%      Y Output: d1
%  Data for 'fitd_t' fit:
%      X Input : t2
%      Y Output: d2
%  Output:
%      fitresult : a cell-array of fit objects representing the fits.
%      gof : structure array with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 14-Sep-2019 22:55:17 自动生成

%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 2, 1 );
gof = struct( 'sse', cell( 2, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'fitd_t1'.
[xData, yData] = prepareCurveData( t1, d1 );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.Normalize = 'on';
opts.StartPoint = [1.995 1.67505137277914 0.549712170040287];

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'fitd_t1' );
h = plot( fitresult{1}, xData, yData );
legend( h, 'd1 vs. t1', 'fitd_t1', 'Location', 'NorthEast' );
% Label axes
xlabel t1
ylabel d1
grid on

%% Fit: 'fitd_t'.
[xData, yData] = prepareCurveData( t2, d2 );

% Set up fittype and options.
ft = fittype( 'gauss1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0];
opts.Normalize = 'on';
opts.StartPoint = [1.9942 -1.67505137277914 0.547726881556109];

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'fitd_t' );
h = plot( fitresult{2}, xData, yData );
legend( h, 'd2 vs. t2', 'fitd_t', 'Location', 'NorthEast' );
% Label axes
xlabel t2
ylabel d2
grid on


