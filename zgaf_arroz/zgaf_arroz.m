function varargout = zgaf_arroz(varargin)
% ZGAF_ARROZ MATLAB code for zgaf_arroz.fig
%      ZGAF_ARROZ, by itself, creates a new ZGAF_ARROZ or raises the existing
%      singleton*.
%
%      H = ZGAF_ARROZ returns the handle to a new ZGAF_ARROZ or the handle to
%      the existing singleton*.
%
%      ZGAF_ARROZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZGAF_ARROZ.M with the given input arguments.
%
%      ZGAF_ARROZ('Property','Value',...) creates a new ZGAF_ARROZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zgaf_arroz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zgaf_arroz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zgaf_arroz

% Last Modified by GUIDE v2.5 22-Oct-2020 12:14:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zgaf_arroz_OpeningFcn, ...
                   'gui_OutputFcn',  @zgaf_arroz_OutputFcn, ...
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


% --- Executes just before zgaf_arroz is made visible.
function zgaf_arroz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zgaf_arroz (see VARARGIN)

% Choose default command line output for zgaf_arroz
handles.output = hObject;
handles.I = imread('rice.png');

% Update handles structure
guidata(hObject, handles);

set(handles.panelOne,'visible', 'off');
set(handles.panelContenedorArroz,'visible', 'off');
set(handles.panelDatos,'visible', 'off');


axes(handles.imgOriginal);
imshow(handles.I);





% UIWAIT makes zgaf_arroz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zgaf_arroz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function r = powerUpImage()

I = imread('rice.png');

fondo = imopen(I, strel('disk', 15));
I2 = imadjust(double(I - fondo));
BW = graythresh(I2);
BW = im2bw(I, BW);
BW = bwareaopen(BW, 7);

se = strel('line', 5, 0);
BW = imerode(BW, se);
BW = imdilate(BW, se);

r = BW;

function areaMax(handles, BW)
datosobj = regionprops(handles.cc, 'basic');
AREAS = [datosobj.Area];
[Amax idy] = max(AREAS);
OAM = false(size(BW));
OAM(handles.cc.PixelIdxList{idy}) = true;

ar = num2str(idy);
obj = num2str(Amax);

myString1 = "El Area Maxima es " + obj + " del Grano " + ar; % Get string from mat file.
handles.txtAreaMax.String = myString1;


function areaMin(handles, BW)
datosobj = regionprops(handles.cc, 'basic');
AREAS = [datosobj.Area];
[Amax idy] = min(AREAS);
OAM = false(size(BW));
OAM(handles.cc.PixelIdxList{idy}) = true;

ar = num2str(idy);
obj = num2str(Amax);

myString2 = "El Area Minima es " + ar + " del Grano " + obj;  % Get string from mat file.
handles.txtAreaMin.String = myString2;



function graficar(handles)
datosobj = regionprops(handles.cc, 'basic');
AREAS = [datosobj.Area];
Nobj = handles.cc.NumObjects;
ordenado = sort(AREAS);

axes(handles.plotHistograma);
hist(ordenado, Nobj); axis off;

% --- Executes on button press in btnCalcular.
function btnCalcular_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

BW = powerUpImage();

handles.grano = false(size(BW));
handles.cc = bwconncomp(BW, 8);
guidata(hObject, handles);

myString = sprintf('Son %i granos en Total', handles.cc.NumObjects); % Get string from mat file.
handles.txtNumero.String = myString;

areaMax(handles, BW);

areaMin(handles, BW);

graficar(handles);

set(handles.panelContenedorArroz,'visible', 'on');
set(handles.panelDatos,'visible', 'on');






% --- Executes on button press in btnUnGrano.
function btnUnGrano_Callback(hObject, eventdata, handles)
% hObject    handle to btnUnGrano (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btnUnGrano

set(handles.panelOne,'visible', 'on');
set(handles.panelAll,'visible', 'off');




% --- Executes on button press in btnTodos.
function btnTodos_Callback(hObject, eventdata, handles)
% hObject    handle to btnTodos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of btnTodos
set(handles.panelAll,'visible', 'on');
set(handles.panelOne,'visible', 'off');


% --- Executes when selected object is changed in btnGroup.
function btnGroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in btnGroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txtCant_Callback(hObject, eventdata, handles)
% hObject    handle to txtCant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtCant as text
%        str2double(get(hObject,'String')) returns contents of txtCant as a double


% --- Executes during object creation, after setting all properties.
function txtCant_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtCant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnShowSelected.
function btnShowSelected_Callback(hObject, eventdata, handles)
% hObject    handle to btnShowSelected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
M = str2num(handles.txtCant.String);
handles.grano(handles.cc.PixelIdxList{M}) = true;

axes(handles.imgMostrar);
imshow(handles.grano);

    
    
    
    


% --- Executes on button press in btnShowAll.
function btnShowAll_Callback(hObject, eventdata, handles)
% hObject    handle to btnShowAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

for n = 1 : handles.cc.NumObjects
       handles.grano(handles.cc.PixelIdxList{n}) = true;
       axes(handles.imgMostrar);
       imshow(handles.grano);
       pause(0.05);
    end



function area = calcArea(N, handles)
    datosobj = regionprops(handles.cc, 'basic');
    AO = datosobj(N).Area;
    area = AO;
    
    
% --- Executes on button press in btnCalcularAreaUno.
function btnCalcularAreaUno_Callback(hObject, eventdata, handles)
% hObject    handle to btnCalcularAreaUno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N = str2num(handles.txtEditArea.String);
Area = calcArea(N, handles);

handles.txtMostrarArea.String = "es de " + Area;



function txtEditArea_Callback(hObject, eventdata, handles)
% hObject    handle to txtEditArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtEditArea as text
%        str2double(get(hObject,'String')) returns contents of txtEditArea as a double


% --- Executes during object creation, after setting all properties.
function txtEditArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtEditArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btnGraficar.
function btnGraficar_Callback(hObject, eventdata, handles)
% hObject    handle to btnGraficar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
