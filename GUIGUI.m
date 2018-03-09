function varargout = GUIGUI(varargin)
% GUIGUI MATLAB code for GUIGUI.fig
%      GUIGUI, by itself, creates a new GUIGUI or raises the existing
%      singleton*.
%
%      H = GUIGUI returns the handle to a new GUIGUI or the handle to
%      the existing singleton*.
%
%      GUIGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIGUI.M with the given input arguments.
%
%      GUIGUI('Property','Value',...) creates a new GUIGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIGUI

% Last Modified by GUIDE v2.5 08-Jan-2018 18:52:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIGUI_OutputFcn, ...
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


% --- Executes just before GUIGUI is made visible.
function GUIGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIGUI (see VARARGIN)

% Choose default command line output for GUIGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse_Button.
function browse_Button_Callback(hObject, eventdata, handles)
% hObject    handle to browse_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
[file, path]=uigetfile('*.*');
image=imread([path file]);
guidata(hObject, handles);
axes(handles.browse_Axes);
imshow(image);


% --- Executes on button press in extract_Button.
function extract_Button_Callback(hObject, eventdata, handles)
% hObject    handle to extract_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
global LDPFeature
[mat0, mat45, mat90, mat135] = LDP2(image);
[hist0] = radiusOL(mat0,5);
[hist45] = radiusOL(mat45,5);
[hist90] = radiusOL(mat90,5);
[hist135] = radiusOL(mat135,5);
guidata(hObject, handles);
axes(handles.LDP0);
imshow(mat0);
guidata(hObject, handles);
axes(handles.histLDP0);
bar(hist0);
guidata(hObject, handles);
axes(handles.LDP45);
imshow(mat45);
guidata(hObject, handles);
axes(handles.histLDP45);
bar(hist45);
guidata(hObject, handles);
axes(handles.LDP90);
imshow(mat90);
guidata(hObject, handles);
axes(handles.histLDP90);
bar(hist90);
guidata(hObject, handles);
axes(handles.LDP135);
imshow(mat135);
guidata(hObject, handles);
axes(handles.histLDP135);
bar(hist135);
[LDPFeature] = histConcat(mat0,mat45,mat90,mat135,5,1)



function classify_Result_Callback(hObject, eventdata, handles)
% hObject    handle to classify_Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of classify_Result as text
%        str2double(get(hObject,'String')) returns contents of classify_Result as a double



% --- Executes during object creation, after setting all properties.
function classify_Result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to classify_Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in classify_Button.
function classify_Button_Callback(hObject, eventdata, handles)
% hObject    handle to classify_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('start')
load mdlSVM.mat
global LDPFeature

classifyResultSVM = predict(mdlSVM,LDPFeature)
if (classifyResultSVM == 1)
    result = 'Non Spoof'
    set(handles.classify_Result,'string',result);
elseif (classifyResultSVM == 0)
    result = 'Spoof'
    set(handles.classify_Result,'string',result);
end


% --- Executes on button press in reset_Button.
function reset_Button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.classify_Result,'string','Result'); 
axes(handles.browse_Axes);cla;
axes(handles.LDP0);cla;
axes(handles.LDP45);cla;
axes(handles.LDP90);cla;
axes(handles.LDP135);cla;
axes(handles.histLDP0);cla;
axes(handles.histLDP45);cla;
axes(handles.histLDP90);cla;
axes(handles.histLDP135);cla;
