function varargout = zgaf_pikachu(varargin)
% ZGAF_PIKACHU MATLAB code for zgaf_pikachu.fig
%      ZGAF_PIKACHU, by itself, creates a new ZGAF_PIKACHU or raises the existing
%      singleton*.
%
%      H = ZGAF_PIKACHU returns the handle to a new ZGAF_PIKACHU or the handle to
%      the existing singleton*.
%
%      ZGAF_PIKACHU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZGAF_PIKACHU.M with the given input arguments.
%
%      ZGAF_PIKACHU('Property','Value',...) creates a new ZGAF_PIKACHU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zgaf_pikachu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zgaf_pikachu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zgaf_pikachu

% Last Modified by GUIDE v2.5 26-Oct-2020 18:10:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zgaf_pikachu_OpeningFcn, ...
                   'gui_OutputFcn',  @zgaf_pikachu_OutputFcn, ...
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


% --- Executes just before zgaf_pikachu is made visible.
function zgaf_pikachu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zgaf_pikachu (see VARARGIN)

% Choose default command line output for zgaf_pikachu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zgaf_pikachu wait for user response (see UIRESUME)
% uiwait(handles.figure1);
graficarPokebola(handles)


% --- Outputs from this function are returned to the command line.
function varargout = zgaf_pikachu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function graficarPokebola(handles)
N = 500; 

[x,y,z] = sphere(N); 
x = x(11:end,:);
y = y(11:end,:); 
z = z(11:end,:);

x2 = -1*x;
y2 = -1*y;
z2 = -1*z - 0.05;

[xc, yc, zc] = cylinder(1.003, N);
zc(2, :) = 0.2;

[xb1,yb1,zb1] = sphere(N);

axes(handles.pikachu);
hold on

surf(x, y, z, 'FaceColor', 'red', 'EdgeColor', 'none'); 
surf(x2, y2, z2,'FaceColor', 'white', 'EdgeColor', 'none', 'CDataMapping', 'direct');
surf(xc, yc, zc - 0.15, 'FaceColor', 'black', 'EdgeColor', 'none');

%button
surf(xb1/2.5, yb1/2.5 + 0.66, zb1/2.5 - 0.05, 'FaceColor', 'black', 'EdgeColor', 'none');
surf(xb1/5, yb1/5 + 0.9, zb1/5 - 0.05, 'FaceColor', 'white', 'EdgeColor', 'none', 'CDataMapping', 'direct');
 
hold off
axis equal;
grid off;
axis off;
camlight('left')
