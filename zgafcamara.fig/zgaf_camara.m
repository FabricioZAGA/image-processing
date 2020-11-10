function varargout = zgaf_camara(varargin)
% zgaf_camara MATLAB code for zgaf_camara.fig
%      zgaf_camara, by itself, creates a new zgaf_camara or raises the existing
%      singleton*.
%
%      H = zgaf_camara returns the handle to a new zgaf_camara or the handle to
%      the existing singleton*.
%
%      zgaf_camara('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in zgaf_camara.M with the given input arguments.
%
%      zgaf_camara('Property','Value',...) creates a new zgaf_camara or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zgaf_camara_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zgaf_camara_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zgaf_camara

% Last Modified by GUIDE v2.5 24-Aug-2020 18:37:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zgaf_camara_OpeningFcn, ...
                   'gui_OutputFcn',  @zgaf_camara_OutputFcn, ...
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


% --- Executes just before zgaf_camara is made visible.
function zgaf_camara_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zgaf_camara (see VARARGIN)

% Choose default command line output for zgaf_camara
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zgaf_camara wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zgaf_camara_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Prender.
function Prender_Callback(hObject, eventdata, handles)
% hObject    handle to Prender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=videoinput('winvideo',2, 'MJPG_1280x720');
axes(handles.Foto);
hImage = image(zeros(656,1184,3),'parent',handles.Foto);
preview(a,hImage)

% --- Executes on button press in Tomar.
function Tomar_Callback(hObject, eventdata, handles)
% hObject    handle to Tomar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=videoinput('winvideo',1, 'MJPG_1920x1080');
axes(handles.Imagen);
Imagen = getsnapshot(a)
image(Imagen)

% --- Executes on button press in Cerrar.
function Cerrar_Callback(hObject, eventdata, handles)
a=videoinput('winvideo',1);
stop(a)
delete(a)
close (gcf) 
% hObject    handle to Cerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Rafaga.
function Rafaga_Callback(hObject, eventdata, handles)
% hObject    handle to Rafaga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=videoinput('winvideo',1, 'MJPG_1280x720');
axes(handles.Imagen);
for i= 1:5
Imagen = getsnapshot(a)
image(Imagen)

end
% Hint: get(hObject,'Value') returns toggle state of Rafaga
