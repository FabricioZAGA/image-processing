function varargout = zgaf_cans(varargin)
% ZGAF_CANS MATLAB code for zgaf_cans.fig
%      ZGAF_CANS, by itself, creates a new ZGAF_CANS or raises the existing
%      singleton*.
%
%      H = ZGAF_CANS returns the handle to a new ZGAF_CANS or the handle to
%      the existing singleton*.
%
%      ZGAF_CANS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZGAF_CANS.M with the given input arguments.
%
%      ZGAF_CANS('Property','Value',...) creates a new ZGAF_CANS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zgaf_cans_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zgaf_cans_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zgaf_cans

% Last Modified by GUIDE v2.5 27-Oct-2020 14:02:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zgaf_cans_OpeningFcn, ...
                   'gui_OutputFcn',  @zgaf_cans_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before zgaf_cans is made visible.
function zgaf_cans_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zgaf_cans (see VARARGIN)

% Choose default command line output for zgaf_cans
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
N = 100;
graficar(imread('pepsi.jpg'),handles.imgPepsi, N);
graficar(imread('coca.jpg'),handles.imgCoca, N);
graficar(imread('tecate.jpg'),handles.imgCerveza, N);
graficar(imread('rebull.jpg'),handles.imgRefresco, N);




% UIWAIT makes zgaf_cans wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function problema = graficar(imagen, axesImg, N)
[X,Y,Z] = cylinder(N);
[X1,Y2,Z3] = sphere(N);

axes(axesImg);

[P map] = rgb2ind(imagen,.0001);
P = double(P);
% Pepsi
hold on;
problema = axesImg;
surface(X*4.2,Y*4.2,1250*Z,flipud(P), 'FaceColor', 'texturemap', 'EdgeColor', 'none', 'CDataMapping', 'direct');
surface(X1*420,Y2*420,Z3*10, 'FaceColor', '[0.5 0.5 0.5]', 'EdgeColor','none','CDataMapping', 'direct' );
surface(X1*420,Y2*420,1250 + (Z3*10), 'FaceColor', '[0.5 0.5 0.5]', 'EdgeColor','none','CDataMapping', 'direct' );
daspect([1 1 1]);
hold off;

view(90 * (4 + 60), 45);
set(problema,'XTick',[], 'YTick', [], 'ZTick', []);
axis off;
colormap(problema, map);

return



% --- Outputs from this function are returned to the command line.
function varargout = zgaf_cans_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
