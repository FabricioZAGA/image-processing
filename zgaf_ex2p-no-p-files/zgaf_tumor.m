function varargout = zgaf_tumor(varargin)
% ZGAF_TUMOR MATLAB code for zgaf_tumor.fig
%      ZGAF_TUMOR, by itself, creates a new ZGAF_TUMOR or raises the existing
%      singleton*.
%
%      H = ZGAF_TUMOR returns the handle to a new ZGAF_TUMOR or the handle to
%      the existing singleton*.
%
%      ZGAF_TUMOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZGAF_TUMOR.M with the given input arguments.
%
%      ZGAF_TUMOR('Property','Value',...) creates a new ZGAF_TUMOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zgaf_tumor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zgaf_tumor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zgaf_tumor

% Last Modified by GUIDE v2.5 26-Oct-2020 18:17:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zgaf_tumor_OpeningFcn, ...
                   'gui_OutputFcn',  @zgaf_tumor_OutputFcn, ...
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


% --- Executes just before zgaf_tumor is made visible.
function zgaf_tumor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zgaf_tumor (see VARARGIN)

% Choose default command line output for zgaf_tumor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

I = imread('cer.jpg');

handles.I3 = rgb2gray(I);
guidata(hObject, handles);

axes(handles.imgOriginal);
imshow(handles.I3);


% UIWAIT makes zgaf_tumor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zgaf_tumor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in btnArea.
function btnArea_Callback(hObject, eventdata, handles)
% hObject    handle to btnArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calcularTumor(handles)

function calcularTumor(handles)
[height, width, colour_planes] = size(handles.I3);

I2 = imcrop(handles.I3,[0 0 (width * .52) height]);

Niveles = graythresh(I2);
BW = im2bw(I2, Niveles);
BW = bwareaopen(BW, 7);

se = strel('disk', 0);
BW = imerode(BW, se);
BW = imdilate(BW, se);


bw2 = imcomplement(BW);

%# Crear Elipse
c = fix(size(bw2)/2); 
r_sq = [90, 145] .^ 2; 
[X, Y] = meshgrid(1:size(bw2, 2), 1:size(bw2, 1)); 
ellipse_mask = (r_sq(2) * (X - c(2) + 10) .^ 2 + ... 
    r_sq(1) * (Y - c(1) - 10) .^ 2 <= prod(r_sq)); 
A_cropped = bsxfun(@times, im2uint8(bw2), uint8(ellipse_mask));

cc = bwconncomp(A_cropped, 8);
grano = false(size(A_cropped));

AreaTotal = 0;
datosobj = regionprops(cc, 'basic');

    for n = 1 : cc.NumObjects
       grano(cc.PixelIdxList{n}) = true;
       AreaTotal = AreaTotal + datosobj(n).Area;
    end
    


axes(handles.imgTumorSelected);
B = imoverlay(I2,grano,'red');
imshow(B);

handles.txtArea.String = "TUMOR AREA: " + num2str(AreaTotal);
