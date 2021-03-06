function varargout = zgaf_money(varargin)
% ZGAF_MONEY MATLAB code for zgaf_money.fig
%      ZGAF_MONEY, by itself, creates a new ZGAF_MONEY or raises the existing
%      singleton*.
%
%      H = ZGAF_MONEY returns the handle to a new ZGAF_MONEY or the handle to
%      the existing singleton*.
%
%      ZGAF_MONEY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZGAF_MONEY.M with the given input arguments.
%
%      ZGAF_MONEY('Property','Value',...) creates a new ZGAF_MONEY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zgaf_money_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zgaf_money_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zgaf_money

% Last Modified by GUIDE v2.5 27-Oct-2020 14:10:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zgaf_money_OpeningFcn, ...
                   'gui_OutputFcn',  @zgaf_money_OutputFcn, ...
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


% --- Executes just before zgaf_money is made visible.
function zgaf_money_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zgaf_money (see VARARGIN)

% Choose default command line output for zgaf_money
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

handles.moneda= imread('moneymoney.jpeg');
guidata(hObject, handles);

axes(handles.imgCoins);
imshow(handles.moneda);

% UIWAIT makes zgaf_money wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zgaf_money_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnCalcular.
function btnCalcular_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

moneda = rgb2gray(handles.moneda);
Niveles = graythresh(moneda);
BW = im2bw(moneda, Niveles);
moneda2= imfill(BW, 'holes');
moneda2= imfill(moneda2, 'holes');
[Label Nearby]=bwlabel(double(moneda2));

propiedades= regionprops(Label, 'Area', 'Centroid');

c=0;
m10 = 0;
m5 = 0;
hold on;
% Vamos a hacer un conteo de Monedas usando el �rea 
for n=1:size(propiedades,1)
    
    centavos=propiedades(n).Centroid;
    X=centavos(1);
    Y=centavos(2);
    
    if propiedades(n).Area >5340
         text(X,Y,'$10','Color','red');
         c=c+10;
         m10 = m10 + 1;
    else
        if propiedades(n).Area >100
        text(X,Y,'$5','Color','red');
        c=c+5;
        m5 = m5 + 1;
        end
    end
end

hold on;

handles.txtTotal.String = "EL TOTAL ES $" + num2str(c) + ".                    DE A $5 - " + num2str(m5) + "                             DE A $10 - " + num2str(m10);


% title(['El Total de Dinero que tiene Daniel Lozano es: ', num2str(c), 'Pesos'])
